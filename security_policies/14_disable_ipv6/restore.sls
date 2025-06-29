restore_sysctl_conf:
  cmd.run:
    - name: cp /etc/sysctl.conf.bak /etc/sysctl.conf
    - onlyif: test -f /etc/sysctl.conf.bak
    - comment: Восстановление /etc/sysctl.conf

# Удаление кастомного sysctl-конфига, если он был установлен
remove_ipv6_override_sysctl:
  file.absent:
    - name: /etc/sysctl.d/99-disable-ipv6.conf
    - comment: Удаляем кастомный sysctl-файл

remove_modprobe_block:
  file.absent:
    - name: /etc/modprobe.d/disable-ipv6.conf
    - comment: Удаляем запрет на загрузку модуля IPv6

restore_modprobe_ipv6:
  cmd.run:
    - name: mv /etc/modprobe.d/disable-ipv6.conf.bak /etc/modprobe.d/disable-ipv6.conf
    - onlyif: test -f /etc/modprobe.d/disable-ipv6.conf.bak
    - comment: Восстановление файла запрета загрузки IPv6

reload_sysctl_restore:
  cmd.run:
    - name: sysctl --system
    - require:
        - cmd: restore_sysctl_conf
        - file: remove_ipv6_override_sysctl
        - file: remove_modprobe_block
    - comment: Применение восстановленных настроек
