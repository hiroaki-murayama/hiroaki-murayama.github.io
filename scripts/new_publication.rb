# frozen_string_literal: true

# Create a structured publication markdown file.
#
# Examples:
#   ruby scripts/new_publication.rb --doi 10.1016/j.epidem.2023.100726
#   ruby scripts/new_publication.rb --title "Paper title" --venue "Journal" --date 2026-05-14

require "date"
require "fileutils"
require "json"
require "net/http"
require "optparse"
require "uri"

ROOT = File.expand_path("..", __dir__)
PUBLICATIONS_DIR = File.join(ROOT, "_publications")

def slugify(text)
  text.downcase.gsub(/[^a-z0-9]+/, "-").gsub(/^-|-$/, "")[0, 80]
end

def yaml_quote(value)
  "'#{value.to_s.gsub("'", "''")}'"
end

def crossref_lookup(doi)
  uri = URI("https://api.crossref.org/works/#{URI.encode_www_form_component(doi)}")
  request = Net::HTTP::Get.new(uri)
  request["User-Agent"] = "hiroaki-site-publication-helper/1.0"
  response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http| http.request(request) }
  raise "Crossref returned #{response.code}" unless response.is_a?(Net::HTTPSuccess)

  JSON.parse(response.body).fetch("message", {})
end

def first_date(message)
  %w[published-print published-online published issued].each do |key|
    parts = message.dig(key, "date-parts")
    next unless parts&.first&.any?

    year, month, day = parts.first
    return format("%04d-%02d-%02d", year, month || 1, day || 1)
  end
  Date.today.iso8601
end

def format_authors(message)
  message.fetch("author", []).filter_map do |author|
    given = author["given"].to_s
    family = author["family"].to_s
    initials = given.split(/[\s-]+/).filter_map { |part| part[0] }.join
    name = [family, initials].reject(&:empty?).join(" ")
    name = "<b>#{name}</b>" if family.downcase == "murayama"
    name unless name.empty?
  end.join(", ")
end

options = {
  status: "published",
  topics: "",
  methods: ""
}

OptionParser.new do |parser|
  parser.banner = "Usage: ruby scripts/new_publication.rb [options]"
  parser.on("--doi DOI", "DOI to fetch from Crossref") { |value| options[:doi] = value }
  parser.on("--title TITLE", "Publication title") { |value| options[:title] = value }
  parser.on("--venue VENUE", "Journal, preprint server, or venue") { |value| options[:venue] = value }
  parser.on("--date DATE", "Publication date in YYYY-MM-DD") { |value| options[:date] = value }
  parser.on("--status STATUS", "published, in_press, or preprint") { |value| options[:status] = value }
  parser.on("--authors AUTHORS", "Author string; HTML is allowed") { |value| options[:authors] = value }
  parser.on("--topics ITEMS", "Comma-separated topics") { |value| options[:topics] = value }
  parser.on("--methods ITEMS", "Comma-separated methods") { |value| options[:methods] = value }
end.parse!

unless %w[published in_press preprint].include?(options[:status])
  warn "Error: --status must be published, in_press, or preprint"
  exit 1
end

data = {}
if options[:doi]
  begin
    data = crossref_lookup(options[:doi])
  rescue StandardError => e
    warn "Warning: Crossref lookup failed: #{e.message}"
  end
end

title = options[:title] || data.fetch("title", [""]).first
if title.to_s.empty?
  warn "Error: provide --title or a DOI that Crossref can resolve."
  exit 1
end

venue = options[:venue] || data.fetch("container-title", [""]).first
venue = "medRxiv" if venue.to_s.empty? && options[:status] == "preprint"
pub_date = options[:date] || first_date(data)
doi = options[:doi] || data["DOI"].to_s
link = doi.empty? ? data["URL"].to_s : "https://doi.org/#{doi}"
authors = options[:authors] || format_authors(data)
year_month = pub_date[0, 7]
filename = File.join(PUBLICATIONS_DIR, "#{year_month}-#{slugify(title)}.md")

if File.exist?(filename)
  warn "Error: #{filename} already exists."
  exit 1
end

topics = options[:topics].split(",").map(&:strip).reject(&:empty?)
methods = options[:methods].split(",").map(&:strip).reject(&:empty?)

lines = [
  "---",
  "title: #{yaml_quote(title)}",
  "collection: publications",
  "permalink: /_publications/#{File.basename(filename, ".md")}",
  "date: #{pub_date}",
  "venue: #{yaml_quote(venue)}",
  "status: #{options[:status]}",
  "authors: #{yaml_quote(authors)}",
  "citation_details: #{yaml_quote("#{pub_date[0, 4]}.")}",
  "topics:"
]
lines.concat((topics.empty? ? ["TODO"] : topics).map { |topic| "  - #{topic}" })
lines << "methods:"
lines.concat((methods.empty? ? ["TODO"] : methods).map { |method| "  - #{method}" })
lines << "link: #{yaml_quote(link)}" unless link.empty?
lines << "preprint_url: #{yaml_quote(link)}" if !link.empty? && options[:status] == "preprint"
lines.concat([
  "paperurl: ''",
  "github: ''",
  "code: ''",
  "citation: ''",
  "---",
  ""
])

FileUtils.mkdir_p(PUBLICATIONS_DIR)
File.write(filename, lines.join("\n"), mode: "w:utf-8")

puts "Created #{filename}"
puts "Next: fill citation_details, topics/methods, paperurl, github, and code as needed."
