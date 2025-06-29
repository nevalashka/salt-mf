backup_chrony_conf:
  file.copy:
    - name: /etc/chrony/chrony.conf.bak
    - source: /etc/chrony/chrony.conf
    - backup_name: True
    - require:
      - pkg: install_chrony
    - comment: Создаём резервную копию конфига chrony

backup_adjtime:
  cmd.run:
    - name: cp /etc/adjtime /etc/adjtime.bak
    - creates: /etc/adjtime.bak
    - comment: Создаём резервную копию файла /etc/adjtime
