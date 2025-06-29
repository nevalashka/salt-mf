set-umask-profile:
  file.managed:
    - name: /etc/profile.d/00-umask.sh
    - source: salt://29_umask_default/files/00-umask.sh
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: backup-umask-profile