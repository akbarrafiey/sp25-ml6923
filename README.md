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
{: .fs-5.5 .fw-300 .mb-1 }
**Location:** {{ site.location }}
{: .fs-5.5 .fw-300 .mt-0 }

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
- Join our [Ed Discussion](#) message board and [Gradescope](https://www.gradescope.com/courses/959935) with the email invitations you received earlier this week. If you didn’t receive an email, you can use the access code G3NXW3 for Gradescope. For Ed Discussion, if you didn’t receive an email, please let me know. 


{{  site.modules[0]  }}
{{  site.modules[1]  }}
{{  site.modules[2]  }}
{{  site.modules[3]  }}
{{  site.modules[4]  }}
{{  site.modules[5]  }}
{{  site.modules[6]  }}
{{  site.modules[7]  }}
{{  site.modules[8]  }}
{{  site.modules[9]  }}
{{  site.modules[10]  }}
{{  site.modules[11]  }}
{{  site.modules[12]  }}
{{  site.modules[13]  }}

{{  site.modules[14]  }}
{{  site.modules[15]  }}

{{  site.modules[16]  }}
{% comment %}
{% endcomment %}