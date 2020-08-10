{% if grains.os == 'Ubuntu' %}
linux:
  home: /home/ubuntu
  user: ubuntu
  installer: apt install
nodeUrl: https://deb.nodesource.com/setup_10.x
{% elif grains['os'] == 'Amazon' %}
linux:
  home: /home/ec2-user
  user: ec2-user
  installer: yum install
nodeUrl: https://rpm.nodesource.com/setup_10.x
{% endif %}
repoUrl: https://github.com/DaniloBueno/node-app-with-automated-test.git
