---
layout: archive
title: "Publications"
permalink: /publications/
author_profile: true
---

***
[Preprints](#pp) | [Peer-reviewed papers](#pr) | [Conference](#conf) | [Journal Correspondence](#jc) | [Reports](#rp) | [Media](#md)
<br>

Updated: 24 Jul 2025

You can also find the full publication list on my [Google Scholar](https://scholar.google.com/citations?user=Kl-eyskAAAAJ&hl=en) profile.

† represents the equal contribution.


## <a name="pp"></a>Preprints
***

{% for post in site.preprints reversed %}
  {% include archive-single.html %}
{% endfor %}

## <a name="pr"></a>Peer-reviewed papers
***

{% assign pubs_sorted = site.publications | sort: "date" | reverse -%}

{%- assign year_buf = "" -%}
{%- for p in pubs_sorted -%}
  {%- assign yy = p.date | date: "%Y" -%}
  {%- unless year_buf contains yy -%}
    {%- assign year_buf = year_buf | append: yy | append: "," -%}
  {%- endunless -%}
{%- endfor -%}
{%- assign years = year_buf | split: "," | sort | reverse -%}

{%- for y in years -%}
  {%- if y != "" -%}
    <a href="#y{{ y }}">{{ y }}</a>{% unless forloop.last %} | {% endunless %}
  {%- endif -%}
{%- endfor -%}

<br>

{%- assign prev_year = "" -%}
{%- for post in pubs_sorted -%}
  {%- assign cur_year = post.date | date: "%Y" -%}
  {% if cur_year != prev_year %}
<h2 id="y{{ cur_year }}">{{ cur_year }}</h2>
{% assign prev_year = cur_year %}
  {% endif %}

  {% include archive-single.html %}
{%- endfor -%}

## <a name="conf"></a>Conference
***

<b>Murayama H</b>, Endo A. &quot;Transmission dynamics and risk assessment of mpox clade IIb and Ib within men who have sex with men.&quot; <i>Early Career Researcher Sandbox session, Infectious Disease Modelling conference.</i>Nov 2024. Bangkok, Thailand. <br/>
[Slide PDF](/files/slide/Session_351_Hiroaki_Murayama.pdf)
[Blog Post](/posts/2024/11/blog-post-4/)

## <a name="jc"></a>Journal Correspondence
***

Jung S, Miura F, <b>Murayama H</b>, Funk S, Wallinga J, Lessler J, Endo A. (2025) &quot;Preemptive Mpox Vaccine Deployment: Aligning Strategy with Reality.&quot; <i>The Journal of Infectious Diseases</i>. 2025 Jul;jiaf365. <br/>
<a href="https://doi.org/10.1093/infdis/jiaf365" target="_blank"><i class="fas fa-fw fa-link zoom" aria-hidden="true"></i></a>

## <a name="rp"></a>Report
***
Ko KY, <b>Murayama H</b>, Yamasaki L, Kinoshita R, Nishiura H, Suzuki M. (2021) &quot;Evaluating the Age-Specific Effectiveness of COVID-19 Vaccines Against Death from surveillance data in Tokyo.&quot; <i>Materials 3-2, 65th Advisory Board Meeting, Ministry of Health, Labour and Welfare on COVID-19 Countermeasures (28 December 2021), 79-90</i>.  28 Dec 2021. (in Japanese) <br/>
<a href="https://www.mhlw.go.jp/content/10900000/000875165.pdf" target="_blank"><i class="fas fa-fw fa-link zoom" aria-hidden="true"></i></a>

Ko KY, <b>Murayama H</b>, Yamasaki L, Kinoshita R, Nishiura H, Suzuki M. (2021) &quot;Evaluating the Age-Specific Effectiveness of COVID-19 Vaccines Against Death from surveillance data in Tokyo.&quot; <i>National Institute of Infectious Diseases, Infectious Diseases Surveillance Center</i>. 28th Dec 2021. (in Japanese)<br/>
<a href="https://id-info.jihs.go.jp/niid/ja/2019-ncov-e/10873-covid19-65.html" target="_blank"><i class="fas fa-fw fa-link zoom" aria-hidden="true"></i></a>

## <a name="md"></a>Media
***

Endo A, <b>Murayama H</b>. &quot;Japanese Scientists in Science 2022.&quot; <i>AAAS</i> <br/>
<a href="https://www.asca-co.com/business/science/pdf_japanese_scientists/Science_2022.pdf" target="_blank"><i class="fas fa-fw fa-file-pdf zoom" aria-hidden="true"></i></a>

Nishiura H, <b>Murayama H</b>. 特集「この先生に会いたい!! かくて生まれり, 「8割おじさん」」 <i>週刊医学界新聞</i> Vol. 3381, 医学書院. 10th Aug 2020. <br/>
<a href="https://www.igaku-shoin.co.jp/paper/archive/y2020/PA03383_01" target="_blank"><i class="fas fa-fw fa-link zoom" aria-hidden="true"></i></a>