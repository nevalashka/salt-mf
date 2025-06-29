restore_selinux_config:
  file.copy:
    - name: /etc/selinux/config
    - source: /etc/selinux/config.bak
    - backup: False
    - comment: Восстанавливаем конфигурацию SELinux из резервной копии

reload_selinux_mode:
  cmd.run:
    - name: 'setenforce $(grep ^SELINUX= /etc/selinux/config | cut -d= -f2)'
    - comment: Применяем режим SELinux из конфигурационного файла (требуется перезагрузка для полного эффекта)