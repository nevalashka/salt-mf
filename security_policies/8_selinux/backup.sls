backup_selinux_config:
  file.copy:
    - name: /etc/selinux/config.bak
    - source: /etc/selinux/config
    - backup: False
    - makedirs: True
    - comment: Создаём резервную копию конфигурационного файла SELinux