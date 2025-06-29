backup_exec_permissions:
  cmd.run:
    - name: find /home /tmp -type f -perm /111 -exec ls -l {} \; > /root/exec_permissions_backup.txt
    - comment: Создаём список исполняемых файлов в /home и /tmp для бэкапа
    - onlyif: test -d /home || test -d /tmp
