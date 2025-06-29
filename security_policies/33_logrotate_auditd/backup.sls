backup-auditd-logrotate:
  file.copy:
    - name: /etc/logrotate.d/audit.bak
    - source: /etc/logrotate.d/audit
    - force: True
    - onfail: True