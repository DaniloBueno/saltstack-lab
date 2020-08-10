# Build app

{% set linux = pillar.linux %}

include:
  - download-app
  - install-node

build_app:
  npm.bootstrap:
    - name: {{ linux.home }}/http-server/
    - user: {{ linux.user }}
    - require:
      - git: download_from_github
      - cmd: install_nodejs
