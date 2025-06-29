deploy-auditd-logrotate:
  file.managed:
    - name: /etc/logrotate.d/audit
    - source: salt://33_logrotate_auditd/files/audit
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: backup-auditd-logrotate