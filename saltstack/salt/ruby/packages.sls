base:
  pkgrepo.managed:
    - humanname: Ruby Brighthbox
    - name: ppa:brightbox/ruby-ng
    - dist: trusty
    - file: /etc/apt/sources.list.d/ruby.list

ruby_install:
  pkg.installed:
    - pkgs:
      - ruby2.2
      - ruby2.2-dev

{% for gem in ['rails','will_paginate','devise','sensu-plugins-rabbitmq']  %}
{{ gem }}:
  gem.installed:
    {% if gem == 'sensu-plugins-rabbitmq' %}
    - name: {{ gem }}
    - version: 3.0.0
    {% else %}
    - name: {{ gem }}
    {% endif %}
{% endfor %}
