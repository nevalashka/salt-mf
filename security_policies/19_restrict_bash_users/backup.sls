backup_shell_permissions:
  cmd.run:
    - name: >
        sh -c 'for shell in /bin/bash /bin/sh /bin/dash /bin/rbash /usr/bin/zsh; do
          [ -f "$shell" ] && ls -l "$shell";
        done > /root/shell_permissions_backup.txt'
    - comment: Создаем бекап текущих прав доступа на шеллы
