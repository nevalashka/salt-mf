disable_blocked_commands_execution:
  cmd.run:
    - name: >
        for cmd in $(cat /srv/salt/18_forbid_specific_commands/files/blocked_commands.txt); do
          [ -f "$cmd" ] && chmod a-x "$cmd";
        done
    - comment: Убираем права на выполнение запрещённых команд
