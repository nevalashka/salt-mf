install_polkit_rule:
  file.managed:
    - name: /etc/polkit-1/localauthority/50-local.d/50-org.freedesktop.systemd1.pkla
    - source: salt://16_restrict_service_users_access/files/50-org.freedesktop.systemd1.pkla
    - user: root
    - group: root
    - mode: 0644
    - makedirs: True
    - comment: Устанавливаем правило polkit для ограничения управления службами только для администраторов
