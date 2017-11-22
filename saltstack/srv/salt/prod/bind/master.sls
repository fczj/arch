include:
  - bind.pkg

create zone dir:
  cmd.run:
    - name: mkdir -p /etc/bind/zones
    - require:
      - pkg: install bind

config option:
  file.managed:
    - source: salt://bind/files/master-named.conf.options
    - name:  /etc/bind/named.conf.options
    - require:
      - pkg: install bind

config local:
  file.managed:
    - source: salt://bind/files/master-named.conf.local
    - name:  /etc/bind/named.conf.local
    - require:
      - pkg: install bind

config a record:
  file.managed:
    - source: salt://bind/files/master-db.calfdata.com
    - name:  /etc/bind/zones/db.calfdata.com
    - require:
      - pkg: install bind

config ptr record:
  file.managed:
    - source: salt://bind/files/master-db.192.168.56
    - name:  /etc/bind/zones/db.192.168.56
    - require:
      - pkg: install bind

service manage:
  service.running:
    - name: bind9
    - enable: True
    - reload: True
    - require:
      - pkg: install bind
    - watch:
      - file: config option
      - file: config local
      - file: config a record
      - file: config ptr record

