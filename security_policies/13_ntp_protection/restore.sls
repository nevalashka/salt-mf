# Восстановление конфигурации chrony
restore_chrony_conf:
  cmd.run:
    - name: cp /etc/chrony/chrony.conf.bak /etc/chrony/chrony.conf
    - onlyif: test -f /etc/chrony/chrony.conf.bak
    - comment: Восстанавливаем конфигурацию chrony из резервной копии

# Снимаем атрибут immutable с /etc/adjtime, если файл и его резервная копия существуют
unlock_adjtime:
  cmd.run:
    - name: chattr -i /etc/adjtime
    - onlyif: test -f /etc/adjtime
    - comment: Разблокировка файла /etc/adjtime для восстановления

restore_adjtime:
  cmd.run:
    - name: cp /etc/adjtime.bak /etc/adjtime
    - onlyif: test -f /etc/adjtime.bak
    - require:
        - cmd: unlock_adjtime
    - comment: Восстановление файла /etc/adjtime из резервной копии
