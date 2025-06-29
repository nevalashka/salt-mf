backup_udev_rule:
  cmd.run:
    - name: cp /etc/udev/rules.d/99-block-usb-dvd-mount.rules /etc/udev/rules.d/99-block-usb-dvd-mount.rules.bak
    - onlyif: test -f /etc/udev/rules.d/99-block-usb-dvd-mount.rules
    - comment: Резервная копия текущего udev правила блокировки USB и DVD автоподключения