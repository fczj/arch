include:
  - bind.pkg

create slave bind cache dir:
  cmd.run:
    - name: mkdir -p /var/cache/bind/slaves
    - mode: 755
    - user: bind
    - group: bind
    - require:
      - pkg: install bind

config slave option:
  file.managed:
    - source: salt://bind/files/slave-named.conf.options
    - name:  /etc/bind/named.conf.options
    - require:
      - pkg: install bind

config slave local:
  file.managed:
    - source: salt://bind/files/slave-named.conf.local
    - name:  /etc/bind/named.conf.local
    - require:
      - pkg: install bind

slave service manage:
  service.running:
    - name: bind9
    - enable: True
    - reload: True
    - require:
      - pkg: install bind
    - watch:
      - file: config slave option
      - file: config slave local

