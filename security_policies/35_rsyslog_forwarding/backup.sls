backup-rsyslog-forwarding:
  file.copy:
    - name: /etc/rsyslog.d/60-forward.conf.bak
    - source: /etc/rsyslog.d/60-forward.conf
    - force: True
    - onfail: True