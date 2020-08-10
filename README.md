# SaltStack Lab

A SaltStack configuration to run a HTTP server on each salt minion. The configuration will:
* download HTTP server app from a GitHub repository
* install required packages to run the app
* build the app
* test the app and then run it

### Requirements
- Salt-master installed on master
- Salt-minions installed on minions

### Installing
- Files should be placed in /srv/salt on master

### Configuring
- Port 4505 and 4506 open on master
- Port 8080 open on minions
- Master config file (/etc/salt/master) should have states and pillar paths configured:
```
file_roots:
  base:
    - /srv/salt/states
pillar_roots:
  base:
    - /srv/salt/pillar
```

## Running

To run a state:
```
sudo salt '*' state.sls build-app
```

To run all states:
```
sudo salt '*' state.highstate
```

## Considerations
* Access HTTP server by http://[minion-ip]:8080
* Pillar data configured to accept minion running Ubuntu or AWS Linux

## License

This project is licensed under the MIT License.
