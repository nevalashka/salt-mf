backup-umask-profile:
  file.copy:
    - name: /etc/profile.d/00-umask.sh.bak
    - source: /etc/profile.d/00-umask.sh
    - force: True
    - onfail: True  # если файл ещё не существует, не будет ошибки