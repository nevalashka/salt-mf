unlock_adjtime:
  cmd.run:
    - name: chattr -i /etc/adjtime
    - onlyif: lsattr /etc/adjtime | grep -q 'i'
    - comment: Снимаем атрибут immutable с /etc/adjtime для разрешения изменений

restore_adjtime:
  cmd.run:
    - name: cp /etc/adjtime.bak /etc/adjtime
    - onlyif: test -f /etc/adjtime.bak
    - require:
      - cmd: unlock_adjtime
    - comment: Восстанавливаем оригинальный файл /etc/adjtime из резервной копии
