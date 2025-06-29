restore_usb_storage_blacklist:
  cmd.run:
    - name: cp /etc/modprobe.d/blacklist-usb_storage.conf.bak /etc/modprobe.d/blacklist-usb_storage.conf
    - onlyif: test -f /etc/modprobe.d/blacklist-usb_storage.conf.bak
    - comment: Восстановление blacklist-конфига usb_storage из резервной копии

update_initramfs_restore:
  cmd.run:
    - name: update-initramfs -u
    - require:
      - cmd: restore_usb_storage_blacklist
    - comment: Обновляем initramfs после восстановления blacklist