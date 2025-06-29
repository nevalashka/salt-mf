backup_selinux_config:
  cmd.run:
    - name: cp /etc/selinux/config /etc/selinux/config.bak
    - onlyif: test -f /etc/selinux/config
    - comment: Резервная копия /etc/selinux/config (если существует)
