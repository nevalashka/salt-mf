restore_udev_rule:
  cmd.run:
    - name: cp /etc/udev/rules.d/99-block-usb-dvd-mount.rules.bak /etc/udev/rules.d/99-block-usb-dvd-mount.rules
    - onlyif: test -f /etc/udev/rules.d/99-block-usb-dvd-mount.rules.bak
    - comment: Восстановление udev правила из резервной копии

reload_udev_rules_restore:
  cmd.run:
    - name: udevadm control --reload-rules && udevadm trigger
    - require:
      - cmd: restore_udev_rule
    - comment: Перезагрузка udev после восстановления правила
