restore_chrony_conf:
  file.copy:
    - name: /etc/chrony/chrony.conf
    - source: /etc/chrony/chrony.conf.bak
    - backup_name: True
    - comment: Восстановление конфигурации chrony из резервной копии

restore_adjtime:
  cmd.run:
    - name: chattr -i /etc/adjtime && cp /etc/adjtime.bak /etc/adjtime
    - comment: Снимаем блокировку и восстанавливаем /etc/adjtime
