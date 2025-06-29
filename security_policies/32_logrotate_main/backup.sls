backup-logrotate-conf:
  file.copy:
    - name: /etc/logrotate.conf.bak
    - source: /etc/logrotate.conf
    - force: True