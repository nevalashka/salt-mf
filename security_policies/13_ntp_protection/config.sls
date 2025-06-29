enable_chronyd:
  service.running:
    - name: chronyd
    - enable: True
    - comment: Запускаем и включаем службу chronyd для синхронизации времени с корпоративными NTP-серверами

lock_adjtime:
  cmd.run:
    - name: chattr +i /etc/adjtime
    - unless: lsattr /etc/adjtime | grep -q 'i'
    - require:
      - service: enable_chronyd
    - comment: Устанавливаем атрибут immutable на /etc/adjtime для запрета ручных изменений времени
