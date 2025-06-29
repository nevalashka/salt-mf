backup_chrony_conf:
  cmd.run:
    - name: cp /etc/chrony/chrony.conf /etc/chrony/chrony.conf.bak
    - creates: /etc/chrony/chrony.conf.bak
    - onlyif: test -f /etc/chrony/chrony.conf
    - comment: Создаём резервную копию конфигурации chrony

backup_adjtime:
  cmd.run:
    - name: cp /etc/adjtime /etc/adjtime.bak
    - creates: /etc/adjtime.bak
    - onlyif: test -f /etc/adjtime
    - comment: Создаём резервную копию /etc/adjtime (если существует)
