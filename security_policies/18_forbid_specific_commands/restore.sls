restore_blocked_commands_permissions:
  cmd.script:
    - source: salt://18_forbid_specific_commands/files/restore_permissions.sh
    - comment: Восстанавливаем права на запрещённые команды из бэкапа
