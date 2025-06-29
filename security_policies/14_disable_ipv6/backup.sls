backup_sysctl_conf:
  cmd.run:
    - name: cp /etc/sysctl.conf /etc/sysctl.conf.bak
    - creates: /etc/sysctl.conf.bak
    - onlyif: test -f /etc/sysctl.conf
    - comment: Бэкап текущего /etc/sysctl.conf

backup_ipv6_sysctl_custom:
  cmd.run:
    - name: cp /etc/sysctl.d/99-disable-ipv6.conf /etc/sysctl.d/99-disable-ipv6.conf.bak
    - creates: /etc/sysctl.d/99-disable-ipv6.conf.bak
    - onlyif: test -f /etc/sysctl.d/99-disable-ipv6.conf
    - comment: Бэкап /etc/sysctl.d/99-disable-ipv6.conf (если был)

backup_modprobe_ipv6:
  cmd.run:
    - name: cp /etc/modprobe.d/disable-ipv6.conf /etc/modprobe.d/disable-ipv6.conf.bak
    - creates: /etc/modprobe.d/disable-ipv6.conf.bak
    - onlyif: test -f /etc/modprobe.d/disable-ipv6.conf
    - comment: Бэкап запрета загрузки модуля IPv6 (если был)
