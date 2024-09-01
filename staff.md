---
layout: page
title: 👩‍🏫 Staff
description: A listing of all the course staff members.
---

# 👩‍🏫 Staff


## Instructors

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


<!--
## Instructors

{% assign instructors = site.staffers | where: 'role', 'Instructor' %}
{% for staffer in instructors %}
{{ staffer }}
{% endfor %}

{% assign teaching_assistants = site.staffers | where: 'role', 'Teaching Assistant' %}
{% assign num_teaching_assistants = teaching_assistants | size %}
{% if num_teaching_assistants != 0 %}
## Teaching Assistants


{% for staffer in teaching_assistants %}
{{ staffer }}
{% endfor %}
{% endif %}
-->