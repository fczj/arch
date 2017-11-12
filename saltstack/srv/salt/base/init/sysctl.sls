local port range:
  sysctl.present:
    - name: net.ipv4.ip_local_port_range
    - value: 10000 65000

open max file:
  sysctl.present:
    - name: fs.file-max
    - value: 2000000


network forward:
  sysctl.present:
    - name: net.ipv4.ip_forward
    - value: 1

  
swappiness:
  sysctl.present:
    - name: vm.swappiness
    - value: 0

