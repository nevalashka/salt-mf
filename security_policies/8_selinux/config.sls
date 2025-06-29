install_selinux_packages:
  pkg.installed:
    - pkgs:
        - selinux-basics
        - selinux-policy-default
        - policycoreutils
        - python3-selinux
    - comment: Установка необходимых пакетов SELinux для Debian

manage_selinux_config:
  file.managed:
    - name: /etc/selinux/config
    - source: salt://8_selinux/files/selinux_config
    - mode: 0644
    - user: root
    - group: root
    - require:
        - pkg: install_selinux_packages
    - comment: Замена конфига SELinux на желаемый

activate_selinux:
  cmd.run:
    - name: selinux-activate
    - unless: selinux-enabled
    - require:
        - file: manage_selinux_config
    - comment: Активация SELinux (потребуется перезагрузка)
