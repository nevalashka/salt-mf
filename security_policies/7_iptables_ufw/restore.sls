restore_iptables:
  cmd.run:
    - name: iptables-restore < /root/iptables.rules.bak
    - onlyif: test -f /root/iptables.rules.bak
    - comment: Восстанавливаем правила iptables из резервной копии

restore_ufw_status:
  cmd.run:
    - name: cat /root/ufw_status.bak | while read line; do ufw $line; done
    - onlyif: test -f /root/ufw_status.bak
    - comment: Восстанавливаем статус ufw из резервной копии (упрощённо)