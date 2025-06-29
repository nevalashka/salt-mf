restore-logrotate-conf:
  file.copy:
    - name: /etc/logrotate.conf
    - source: /etc/logrotate.conf.bak
    - force: True