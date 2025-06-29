restore-umask-profile:
  file.copy:
    - name: /etc/profile.d/00-umask.sh
    - source: /etc/profile.d/00-umask.sh.bak
    - force: True