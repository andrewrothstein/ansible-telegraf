andrewrothstein.telegraf
=========
![Build Status](https://github.com/andrewrothstein/ansible-telegraf/actions/workflows/build.yml/badge.svg)

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
