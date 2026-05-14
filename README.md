# Hiroaki Murayama Website

Personal academic website built with Jekyll and GitHub Pages.

## Local Preview

```powershell
$env:JEKYLL_NO_GITHUB_METADATA='true'
bundle exec jekyll serve --livereload
```

Then open <http://127.0.0.1:4000/>.

## Publication Workflow

Publication records live in `_publications/`. Preprints, in-press papers, and published papers use the same collection and are separated by the `status` field:

```yaml
status: preprint    # preprint | in_press | published
```

When a preprint becomes published, update the same file instead of moving it:

```yaml
status: published
venue: 'Journal Name'
date: 2026-05-14
citation_details: '2026;12(3):123.'
link: 'https://doi.org/...'
paperurl: '...'
```

The Publications page generates the displayed citation from structured fields such as `authors`, `venue`, `citation_details`, `topics`, and `methods`. The old `citation` field is kept only as a fallback.

## Add A Publication

Create a draft record from a DOI:

```powershell
ruby scripts/new_publication.rb --doi 10.1016/j.epidem.2023.100726 --topics "COVID-19,vaccine effectiveness" --methods "inference,mathematical modelling"
```

Or create one manually:

```powershell
ruby scripts/new_publication.rb --title "Paper title" --venue "Journal" --date 2026-05-14 --status preprint
```

After the file is created, fill in any missing `topics`, `methods`, `paperurl`, `github`, `code`, and final `citation_details`.
