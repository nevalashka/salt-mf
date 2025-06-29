restore_polkit_rule:
  cmd.run:
    - name: mv /etc/polkit-1/localauthority/50-local.d/50-org.freedesktop.systemd1.pkla.bak /etc/polkit-1/localauthority/50-local.d/50-org.freedesktop.systemd1.pkla
    - onlyif: test -f /etc/polkit-1/localauthority/50-local.d/50-org.freedesktop.systemd1.pkla.bak
    - comment: Восстанавливаем правило polkit из резервной копии
