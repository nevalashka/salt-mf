remove_exec_permissions:
  cmd.run:
    - name: find /home /tmp -type f -perm /111 -exec chmod a-x {} \;
    - comment: Убираем права на исполнение у файлов в /home и /tmp
    - onlyif: test -d /home || test -d /tmp
