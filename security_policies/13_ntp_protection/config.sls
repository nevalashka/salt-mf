install_chrony:
  pkg.installed:
    - name: chrony
    - comment: Установка chrony (NTP клиент/сервер)

manage_chrony_conf:
  file.managed:
    - name: /etc/chrony/chrony.conf
    - source: salt://13_ntp_protection/files/chrony.conf
    - user: root
    - group: root
    - mode: 0644
    - require:
      - pkg: install_chrony
    - comment: Обновление конфигурации chrony

enable_chrony:
  service.running:
    - name: chrony
    - enable: True
    - require:
      - file: manage_chrony_conf
    - comment: Запуск и включение службы chrony

lock_adjtime:
  cmd.run:
    - name: chattr +i /etc/adjtime
    - require:
      - service: enable_chrony
    - comment: Запрет ручного изменения системного времени через блокировку /etc/adjtime
