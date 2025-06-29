backup_blocked_commands_permissions:
  cmd.run:
    - name: >
        for cmd in $(cat /srv/salt/10_block_commands/files/blocked_commands.txt); do
          [ -f "$cmd" ] && ls -l "$cmd" >> /root/blocked_commands_permissions_backup.txt;
        done
    - comment: Создаём бэкап прав на запрещённые команды
