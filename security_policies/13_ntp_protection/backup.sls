backup_adjtime:
  cmd.run:
    - name: cp /etc/adjtime /etc/adjtime.bak
    - onlyif: test -f /etc/adjtime
    - comment: Резервное копирование файла /etc/adjtime
