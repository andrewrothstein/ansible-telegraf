andrewrothstein.telegraf
=========
[![Build Status](https://travis-ci.org/andrewrothstein/ansible-telegraf.svg?branch=master)](https://travis-ci.org/andrewrothstein/ansible-telegraf)

Installs [Telegraf](https://www.influxdata.com/time-series-platform/telegraf/)

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.telegraf
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
