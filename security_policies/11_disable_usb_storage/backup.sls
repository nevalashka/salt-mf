backup_usb_storage_blacklist:
  cmd.run:
    - name: cp /etc/modprobe.d/blacklist-usb_storage.conf /etc/modprobe.d/blacklist-usb_storage.conf.bak
    - onlyif: test -f /etc/modprobe.d/blacklist-usb_storage.conf
    - comment: Резервная копия blacklist-конфига usb_storage