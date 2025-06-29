ensure_iptables_dir:
  file.directory:
    - name: /etc/iptables
    - user: root
    - group: root
    - mode: 0755
    - comment: Убеждаемся, что /etc/iptables существует

backup_iptables_v4:
  cmd.run:
    - name: iptables-save > /etc/iptables/rules.v4.bak
    - require:
      - file: ensure_iptables_dir
    - comment: Сохраняем текущие IPv4 правила в .bak
