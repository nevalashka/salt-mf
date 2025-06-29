deploy_udev_block_usb_dvd_rule:
  file.managed:
    - name: /etc/udev/rules.d/99-block-usb-dvd-mount.rules
    - source: salt://12_disable_removable_mounts/files/99-block-usb-dvd-mount.rules
    - mode: 0644
    - user: root
    - group: root
    - comment: Развёртывание правила udev для блокировки автоподключения USB и DVD устройств

reload_udev_rules:
  cmd.run:
    - name: udevadm control --reload-rules && udevadm trigger
    - require:
      - file: deploy_udev_block_usb_dvd_rule
    - comment: Перезагрузка udev для применения нового правила
