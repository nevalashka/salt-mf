blacklist_usb_storage_conf:
  file.managed:
    - name: /etc/modprobe.d/blacklist-usb_storage.conf
    - source: salt://11_disable_usb_storage/files/blacklist-usb_storage.conf
    - mode: 0644
    - user: root
    - group: root
    - comment: Блокируем загрузку модуля usb_storage

update_initramfs:
  cmd.run:
    - name: update-initramfs -u
    - require:
      - file: blacklist_usb_storage_conf
    - comment: Обновляем initramfs после добавления blacklist
