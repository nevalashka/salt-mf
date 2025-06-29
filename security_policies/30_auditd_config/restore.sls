restore-auditd-config:
  file.copy:
    - name: /etc/audit/auditd.conf
    - source: /etc/audit/auditd.conf.bak
    - force: True