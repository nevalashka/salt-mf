install_apparmor:
  pkg.installed:
    - name: apparmor
    - comment: Устанавливаем AppArmor

enable_apparmor_service:
  service.running:
    - name: apparmor
    - enable: True
    - require:
        - pkg: install_apparmor

upload_apparmor_profile:
  file.managed:
    - name: /etc/apparmor.d/limited_user
    - source: salt://17_command_whitelist_apparmor/files/limited_profile.apparmor
    - user: root
    - group: root
    - mode: 0644
    - require:
        - service: enable_apparmor_service

load_apparmor_profile:
  cmd.run:
    - name: apparmor_parser -r /etc/apparmor.d/limited_user
    - require:
        - file: upload_apparmor_profile
    - comment: Загружаем профиль ограниченного пользователя
