backup_polkit_rule:
  cmd.run:
    - name: cp /etc/polkit-1/localauthority/50-local.d/50-org.freedesktop.systemd1.pkla /etc/polkit-1/localauthority/50-local.d/50-org.freedesktop.systemd1.pkla.bak
    - onlyif: test -f /etc/polkit-1/localauthority/50-local.d/50-org.freedesktop.systemd1.pkla
    - comment: Создаём резервную копию правила polkit для управления службами
