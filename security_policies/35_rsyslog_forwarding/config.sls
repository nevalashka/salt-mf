deploy-rsyslog-forwarding:
  file.managed:
    - name: /etc/rsyslog.d/60-forward.conf
    - source: salt://35_rsyslog_forwarding/files/60-forward.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: backup-rsyslog-forwarding

restart-rsyslog:
  service.running:
    - name: rsyslog
    - enable: true
    - watch:
      - file: deploy-rsyslog-forwarding