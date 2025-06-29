# Восстановление rpcbind — если он был отключен, но нужен
restore_rpcbind:
  service.running:
    - name: rpcbind
    - enable: True
    - comment: Восстанавливаем службу rpcbind (если требуется NFSv3)

# Восстановление cups — если служба печати нужна
restore_cups:
  service.running:
    - name: cups
    - enable: True
    - comment: Восстанавливаем службу cups (печать)


 # telnetd, rsh-server, tftpd-hpa —  удалены, поэтому не восстанавливаем, нужно заново установить пакеты.
    