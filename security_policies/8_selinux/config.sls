install_selinux_policy:
  pkg.installed:
    - name: selinux-policy-targeted
    - comment: Устанавливаем selinux-policy-targeted (если отсутствует)


install_policycoreutils:
  pkg.installed:
    - name: policycoreutils
    - comment: Устанавливаем policycoreutils для управления SELinux

configure_selinux:
  file.managed:
    - name: /etc/selinux/config
    - source: salt://8_selinux/files/selinux_config
    - user: root
    - group: root
    - mode: 0644
    - comment: Управляем конфигом SELinux, устанавливаем режим enforcing/targeted

set_selinux_enforcing:
  cmd.run:
    - name: setenforce 1
    - unless: sestatus | grep -q 'Current mode:.*enforcing'
    - comment: Устанавливаем SELinux в режим enforcing немедленно