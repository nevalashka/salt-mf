restore-auditd-logrotate:
  file.copy:
    - name: /etc/logrotate.d/audit
    - source: /etc/logrotate.d/audit.bak
    - force: True