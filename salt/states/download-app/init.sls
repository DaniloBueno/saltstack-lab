# Download app from GitHub

{% set repoUrl = pillar.repoUrl %}
{% set linux = pillar.linux %}

install_git:
  pkg.installed:
    - name: git

download_from_github:
  git.latest:
    - name: {{ repoUrl }}
    - rev: master
    - force_reset: remote-changes
    - target: {{ linux.home }}/http-server
    - user: {{ linux.user }}
    - require:
      - pkg: install_git
