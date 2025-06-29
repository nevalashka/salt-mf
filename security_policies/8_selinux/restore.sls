restore_selinux_config:
  cmd.run:
    - name: cp /etc/selinux/config.bak /etc/selinux/config
    - onlyif: test -f /etc/selinux/config.bak
    - comment: Восстановление оригинального конфига SELinux из резервной копии