---
layout: home
title: 🏠 Home
nav_exclude: false
nav_order: 1
permalink: /:path/
seo:
  type: Course
  name: CS-GY 6923
---
# {{ site.tagline }}
{: .mb-2 }
{{ site.description }}
{: .fs-6 .fw-300 .mb-1 }

**Lectures:** {{ site.lecture }}
{: .fs-6 .fw-300 .mt-0 }

## Instructor

<div class="instructors-container">
  {% assign instructors = site.staffers | where: 'role', 'Instructor' %}
  {% for staffer in instructors %}
    {{ staffer }}
  {% endfor %}
</div>

{% assign teaching_assistants = site.staffers | where: 'role', 'Teaching Assistant' %}
{% assign num_teaching_assistants = teaching_assistants | size %}
{% if num_teaching_assistants != 0 %}
## Teaching Assistants

<div class="ta-container">
  {% for staffer in teaching_assistants %}
    {{ staffer }}
  {% endfor %}
</div>
{% endif %}


## How to get started:

- Read the [syllabus](syllabus.md).
- Join our [Campuswire](https://campuswire.com/p/GAA99D8BF) message board and [Gradescope](https://www.gradescope.com/courses/760595) with the email invitations you received earlier this week. If you didn't receive an email, you can use access code XXZVRD for Gradescope (the link above for Campuswire will automatically let you join the class without a code).


{{  site.modules[0]  }}
{{  site.modules[1]  }}
<!--
{{  site.modules[2]  }}
{{  site.modules[3]  }}
{{  site.modules[4]  }}
{{  site.modules[5]  }}
{{  site.modules[6]  }}
{{  site.modules[7]  }}
{{  site.modules[8]  }}
{{  site.modules[9]  }}
{{  site.modules[10]  }}
-->