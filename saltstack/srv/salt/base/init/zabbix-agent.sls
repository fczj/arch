install zabbix agent:
  pkg.installed:
    - name: zabbix-agent
  file.managed:
    - name: /etc/zabbix/zabbix_agentd.conf
    - source: salt://init/files/zabbix_agentd.conf
    - template: jinja
    - defaults:
      Zabbix_Server: {{ pillar['Zabbix_Server'] }}
      Hostname: 
    - requite:
      - pkg: install zabbix agent
  service.running:
    - name: zabbix-agent
    - enable: Ture
    - watch:
      - pkg: install zabbix agent
      - file: install zabbix agent

