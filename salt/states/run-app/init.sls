# Test app and run it

{% set linux = pillar.linux %}

include:
  - build-app
  - install-node

test_app:
  cmd.run:
    - name: npm test
    - cwd: {{ linux.home }}/http-server/
    - require:
      - npm: build_app

stop_app:
  cmd.run:
    - name: ./run.sh stop
    - cwd: {{ linux.home }}/http-server/
    - runas: {{ linux.user }}
    - require:
      - cmd: test_app
      - npm: install_forever_global

start_app:
  cmd.run:
    - name: ./run.sh start
    - cwd: {{ linux.home }}/http-server/
    - runas: {{ linux.user }}
    - require:
      - cmd: stop_app

failure:
  test.fail_without_changes:
    - name: "Some tests have failed!"
    - failhard: True
    - onfail:
      - cmd: test_app
