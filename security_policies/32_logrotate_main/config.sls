deploy-logrotate-conf:
  file.managed:
    - name: /etc/logrotate.conf
    - source: salt://32_logrotate_main/files/logrotate.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: backup-logrotate-conf