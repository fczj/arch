config haproxy:
  file.managed:
    - name: /tmp/haproxy.cfg
    - source: salt://cluster/files/haproxy.cfg
    - template: jinja
