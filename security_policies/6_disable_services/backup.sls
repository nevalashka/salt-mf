save_service_status:
  cmd.run:
    - name: |
        echo "=== Состояние служб на $(date) ===" > /root/services_status_backup.txt && \
        systemctl list-units --type=service | grep -E 'telnet|rsh|rexec|tftp|rpcbind|cups' >> /root/services_status_backup.txt
    - creates: /root/services_status_backup.txt
    - shell: /bin/bash
    - comment: >
        Сохраняем список активных и загруженных служб, которые могут быть отключены,
        для возможного отката или аудита