restore_shell_permissions:
  file.managed:
    - name: /usr/local/bin/restore_shell_permissions.sh
    - source: salt://19_restrict_bash_users/files/restore_shell_permissions.sh
    - mode: 755
    - user: root
    - group: root

  cmd.run:
    - name: /usr/local/bin/restore_shell_permissions.sh
    - comment: Восстановление прав и групп на оболочки из бэкапа
    - require:
      - file: restore_shell_permissions
