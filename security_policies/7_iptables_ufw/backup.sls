backup_iptables:
  cmd.run:
    - name: iptables-save > /root/iptables.rules.bak
    - creates: /root/iptables.rules.bak
    - comment: Создаём резервную копию текущих правил iptables

backup_ufw:
  cmd.run:
    - name: ufw status verbose > /root/ufw_status.bak
    - creates: /root/ufw_status.bak
    - comment: Создаём резервную копию текущего статуса ufw