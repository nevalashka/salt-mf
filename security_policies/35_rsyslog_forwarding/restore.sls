restore-rsyslog-forwarding:
  file.copy:
    - name: /etc/rsyslog.d/60-forward.conf
    - source: /etc/rsyslog.d/60-forward.conf.bak
    - force: True

restart-rsyslog-after-restore:
  service.running:
    - name: rsyslog
    - watch:
      - file: restore-rsyslog-forwarding