install_chrony:
  pkg.installed:
    - pkgs:
        - chrony
        - util-linux  # для chattr
    - comment: Устанавливаем chrony и необходимые утилиты

configure_chrony:
  file.managed:
    - name: /etc/chrony/chrony.conf
    - source: salt://13_ntp_protection/files/chrony.conf
    - user: root
    - group: root
    - mode: 0644
    - require:
        - pkg: install_chrony
    - comment: Обновляем конфигурацию chrony

enable_chrony:
  service.running:
    - name: chrony
    - enable: True
    - require:
        - file: configure_chrony
    - comment: Включаем и запускаем chronyd

lock_adjtime:
  cmd.run:
    - name: chattr +i /etc/adjtime
    - onlyif: test -f /etc/adjtime
    - require:
        - service: enable_chrony
    - comment: Защищаем файл /etc/adjtime от изменений
