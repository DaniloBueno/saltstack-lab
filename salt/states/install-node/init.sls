# Install nodejs and node packages

{% set nodeUrl = pillar.nodeUrl %}
{% set installer = pillar.linux.installer %}

install_nodejs:
  cmd.run:
    - name: curl -sL {{ nodeUrl }} | sudo -E bash - && sudo {{ installer }} -y nodejs

install_forever_global:
  npm.installed:
    - name: forever
    - require:
      - cmd: install_nodejs

install_mocha_global:
  npm.installed:
    - name: mocha
    - require:
      - cmd: install_nodejs
