remove_telnet:
  pkg.removed:
    - name: telnetd
    - comment: Удаляем telnetd (Telnet daemon)

remove_rsh:
  pkg.removed:
    - name: rsh-server
    - comment: Удаляем rsh-server (rshd и rexecd)

remove_tftp:
  pkg.removed:
    - name: tftpd-hpa
    - comment: Удаляем tftpd-hpa - TFTP сервер (часто используется без аутентификации)

disable_rpcbind:
  service.dead:
    - name: rpcbind
    - enable: False
    - comment: Останавливаем и отключаем rpcbind (используется в основном для NFSv3)

disable_cups:
  service.dead:
    - name: cups
    - enable: False
    - comment: Останавливаем и отключаем cups (служба печати)