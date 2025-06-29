install_apparmor:
  pkg.installed:
    - name: apparmor
    - comment: Устанавливаем пакет AppArmor

install_apparmor_utils:
  pkg.installed:
    - name: apparmor-utils
    - comment: Устанавливаем утилиты для управления AppArmor

enable_apparmor_service:
  service.running:
    - name: apparmor
    - enable: True
    - require:
      - pkg: install_apparmor
      - pkg: install_apparmor_utils
    - comment: Запускаем и включаем сервис AppArmor

deploy_custom_profile:
  file.managed:
    - name: /etc/apparmor.d/custom_profile
    - source: salt://9_apparmor_profiles/files/custom_profile
    - user: root
    - group: root
    - mode: 0644
    - require:
      - pkg: install_apparmor
    - comment: Разворачиваем кастомный профиль AppArmor

reload_apparmor_profiles:
  cmd.run:
    - name: apparmor_parser -r /etc/apparmor.d/custom_profile
    - require:
      - file: deploy_custom_profile
    - comment: Перезагружаем кастомный профиль AppArmor

set_profiles_enforce_mode:
  cmd.run:
    - name: aa-enforce /etc/apparmor.d/*
    - require:
      - service: enable_apparmor_service
    - comment: Переводим все профили AppArmor в режим enforcing