---
layout: archive
title: "Publications"
permalink: /publications/
author_profile: true
excerpt: "Searchable publication list for Hiroaki Murayama, including peer-reviewed papers, preprints, conference outputs, reports, and media."
---

[Preprints](#pp) | [Peer-reviewed papers](#pr) | [Conference](#conf) | [Journal Correspondence](#jc) | [Reports](#rp) | [Media](#md)
<br>

Updated: 14 May 2026

You can also find the full publication list on my [Google Scholar](https://scholar.google.com/citations?user=Kl-eyskAAAAJ&hl=en) profile.

† represents equal contribution.

<div class="publication-controls" role="search" aria-label="Publication search and filters">
  <div class="publication-controls__row">
    <input id="publication-search" type="search" placeholder="Search title, author, journal, topic, or method" aria-label="Search publications">
    <select id="publication-status" aria-label="Filter by status">
      <option value="all">All statuses</option>
      <option value="published">Published</option>
      <option value="in_press">In press</option>
      <option value="preprint">Preprint</option>
    </select>
    <select id="publication-topic" aria-label="Filter by topic">
      <option value="all">All topics</option>
      <option value="mpox">mpox</option>
      <option value="covid-19">COVID-19</option>
      <option value="sexual networks">sexual networks</option>
      <option value="vaccine effectiveness">vaccine effectiveness</option>
      <option value="climate">climate</option>
      <option value="surveillance">surveillance</option>
    </select>
  </div>
  <p id="publication-count" class="publication-controls__count"></p>
</div>

{% assign pubs_sorted = site.publications | sort: "date" | reverse %}

<section id="pp" class="publication-section" data-publication-section="preprints">
<h2>Preprints</h2>

{% assign has_preprints = false %}
{% for post in pubs_sorted %}
  {% if post.status == "preprint" %}
    {% assign has_preprints = true %}
    {% include archive-single.html %}
  {% endif %}
{% endfor %}

{% unless has_preprints %}
<p>No active preprints at the moment.</p>
{% endunless %}
</section>

<section id="pr" class="publication-section" data-publication-section="peer-reviewed">
<h2>Peer-reviewed papers</h2>

{% assign year_buf = "" %}
{% for p in pubs_sorted %}
  {% unless p.status == "preprint" %}
    {% assign yy = p.date | date: "%Y" %}
    {% unless year_buf contains yy %}
      {% assign year_buf = year_buf | append: yy | append: "," %}
    {% endunless %}
  {% endunless %}
{% endfor %}
{% assign years = year_buf | split: "," | sort | reverse %}

<nav class="publication-year-nav" aria-label="Publication years">
{% for y in years %}
  {% if y != "" %}
    <a href="#y{{ y }}">{{ y }}</a>{% unless forloop.last %} | {% endunless %}
  {% endif %}
{% endfor %}
</nav>

{% assign prev_year = "" %}
{% for post in pubs_sorted %}
  {% unless post.status == "preprint" %}
    {% assign cur_year = post.date | date: "%Y" %}
    {% if cur_year != prev_year %}
<h2 id="y{{ cur_year }}" class="publication-year-heading">{{ cur_year }}</h2>
{% assign prev_year = cur_year %}
    {% endif %}

    {% include archive-single.html %}
  {% endunless %}
{% endfor %}
</section>

<section id="conf">
<h2>Conference</h2>

<b>Murayama H</b>, Endo A. &quot;Transmission dynamics and risk assessment of mpox clade IIb and Ib within men who have sex with men.&quot; <i>Early Career Researcher Sandbox session, Infectious Disease Modelling conference.</i> Nov 2024. Bangkok, Thailand. <br/>
[Slide PDF](/files/slide/Session_351_Hiroaki_Murayama.pdf)
[Blog Post](/posts/2024/11/blog-post-4/)
</section>

<section id="jc">
<h2>Journal Correspondence</h2>

Jung S, Miura F, <b>Murayama H</b>, Funk S, Wallinga J, Lessler J, Endo A. (2025) &quot;Preemptive Mpox Vaccine Deployment: Aligning Strategy with Reality.&quot; <i>The Journal of Infectious Diseases</i>. 2025 Jul;jiaf365. <br/>
<a href="https://doi.org/10.1093/infdis/jiaf365" target="_blank" rel="noopener noreferrer"><i class="fas fa-fw fa-link zoom" aria-hidden="true"></i><span class="sr-only">Publication link</span></a>
</section>

<section id="rp">
<h2>Reports</h2>

Ko KY, <b>Murayama H</b>, Yamasaki L, Kinoshita R, Nishiura H, Suzuki M. (2021) &quot;Evaluating the Age-Specific Effectiveness of COVID-19 Vaccines Against Death from surveillance data in Tokyo.&quot; <i>Materials 3-2, 65th Advisory Board Meeting, Ministry of Health, Labour and Welfare on COVID-19 Countermeasures (28 December 2021), 79-90.&quot; </i>28 Dec 2021. (in Japanese) <br/>
<a href="https://www.mhlw.go.jp/content/10900000/000875165.pdf" target="_blank" rel="noopener noreferrer"><i class="fas fa-fw fa-link zoom" aria-hidden="true"></i><span class="sr-only">Report PDF</span></a>

Ko KY, <b>Murayama H</b>, Yamasaki L, Kinoshita R, Nishiura H, Suzuki M. (2021) &quot;Evaluating the Age-Specific Effectiveness of COVID-19 Vaccines Against Death from surveillance data in Tokyo.&quot; <i>National Institute of Infectious Diseases, Infectious Diseases Surveillance Center</i>. 28th Dec 2021. (in Japanese)<br/>
<a href="https://id-info.jihs.go.jp/niid/ja/2019-ncov-e/10873-covid19-65.html" target="_blank" rel="noopener noreferrer"><i class="fas fa-fw fa-link zoom" aria-hidden="true"></i><span class="sr-only">Report link</span></a>
</section>

<section id="md">
<h2>Media</h2>

Endo A, <b>Murayama H</b>. &quot;Japanese Scientists in Science 2022.&quot; <i>AAAS</i> <br/>
<a href="https://www.asca-co.com/business/science/pdf_japanese_scientists/Science_2022.pdf" target="_blank" rel="noopener noreferrer"><i class="fas fa-fw fa-file-pdf zoom" aria-hidden="true"></i><span class="sr-only">Media PDF</span></a>

Nishiura H, <b>Murayama H</b>. 特集「この先生に会いたい!! かくして生まれり,『割りおじさん』」<i>週刊医学界新聞</i> Vol. 3381, 医学書院. 10th Aug 2020. <br/>
<a href="https://www.igaku-shoin.co.jp/paper/archive/y2020/PA03383_01" target="_blank" rel="noopener noreferrer"><i class="fas fa-fw fa-link zoom" aria-hidden="true"></i><span class="sr-only">Media link</span></a>
</section>

<script>
  (function() {
    var search = document.getElementById('publication-search');
    var status = document.getElementById('publication-status');
    var topic = document.getElementById('publication-topic');
    var count = document.getElementById('publication-count');
    var items = Array.prototype.slice.call(document.querySelectorAll('.publication-item'));
    var sections = Array.prototype.slice.call(document.querySelectorAll('.publication-section'));
    var headings = Array.prototype.slice.call(document.querySelectorAll('.publication-year-heading'));
    var yearNav = document.querySelector('.publication-year-nav');

    function itemIsVisible(item) {
      return item.style.display !== 'none';
    }

    function sectionHasVisibleItems(section) {
      return Array.prototype.some.call(section.querySelectorAll('.publication-item'), itemIsVisible);
    }

    function yearHasVisibleItems(heading) {
      var node = heading.nextElementSibling;
      while (node && !node.classList.contains('publication-year-heading')) {
        if (node.querySelector && Array.prototype.some.call(node.querySelectorAll('.publication-item'), itemIsVisible)) {
          return true;
        }
        node = node.nextElementSibling;
      }
      return false;
    }

    function filterPublications() {
      var query = (search.value || '').trim().toLowerCase();
      var statusValue = status.value;
      var topicValue = topic.value;
      var visible = 0;

      items.forEach(function(item) {
        var haystack = item.getAttribute('data-search') || '';
        var itemStatus = item.getAttribute('data-status') || '';
        var itemTopics = item.getAttribute('data-topics') || '';
        var matchesQuery = !query || haystack.indexOf(query) !== -1;
        var matchesStatus = statusValue === 'all' || itemStatus === statusValue;
        var matchesTopic = topicValue === 'all' || itemTopics.indexOf(topicValue) !== -1;
        var show = matchesQuery && matchesStatus && matchesTopic;

        item.style.display = show ? '' : 'none';
        if (show) {
          visible += 1;
        }
      });

      headings.forEach(function(heading) {
        heading.style.display = yearHasVisibleItems(heading) ? '' : 'none';
      });

      sections.forEach(function(section) {
        section.style.display = sectionHasVisibleItems(section) ? '' : 'none';
      });

      if (yearNav) {
        yearNav.style.display = sectionHasVisibleItems(document.querySelector('[data-publication-section="peer-reviewed"]')) ? '' : 'none';
      }

      count.textContent = visible + ' publication' + (visible === 1 ? '' : 's') + ' shown';
    }

    if (search && status && topic && count) {
      search.addEventListener('input', filterPublications);
      status.addEventListener('change', filterPublications);
      topic.addEventListener('change', filterPublications);
      filterPublications();
    }
  })();
</script>
