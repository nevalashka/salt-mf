backup-auditd-config:
  file.copy:
    - name: /etc/audit/auditd.conf.bak
    - source: /etc/audit/auditd.conf
    - force: True