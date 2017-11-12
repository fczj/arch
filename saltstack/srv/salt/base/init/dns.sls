config dns resov.conf:
  file.managed:
    - name: /etc/resolv.conf
    - source: salt://init/files/resolv.conf
    - mode:  644
