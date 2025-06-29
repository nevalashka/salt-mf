apply_sysctl_ipv6_config:
  file.managed:
    - name: /etc/sysctl.d/99-disable-ipv6.conf
    - source: salt://14_disable_ipv6/files/sysctl_ipv6.conf
    - user: root
    - group: root
    - mode: 0644
    - comment: Отключение IPv6 через sysctl

block_ipv6_module:
  file.managed:
    - name: /etc/modprobe.d/disable-ipv6.conf
    - contents: install ipv6 /bin/true
    - user: root
    - group: root
    - mode: 0644
    - comment: Блокируем загрузку модуля IPv6

reload_sysctl:
  cmd.run:
    - name: sysctl --system
    - require:
        - file: apply_sysctl_ipv6_config
        - file: block_ipv6_module
    - comment: Применяем все настройки sysctl
