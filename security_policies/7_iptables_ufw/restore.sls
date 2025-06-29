restore_iptables_v4:
  cmd.run:
    - name: iptables-restore < /etc/iptables/rules.v4.bak
    - onlyif: test -f /etc/iptables/rules.v4.bak
    - comment: Восстанавливаем правила iptables из .bak файла
