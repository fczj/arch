base:
  '*':
    - init.init
    - cluster.haproxy
prod:
  '*':
    - prod
  'vm100':
    - bind.master
  'vm101':
    - bind.slave
