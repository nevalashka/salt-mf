backup-log-permissions:
  cmd.run:
    - name: |
        mkdir -p /root/log_backup_perms
        getfacl -R /var/log > /root/log_backup_perms/log_acl.bak || true
        lsattr -d /var/log/* > /root/log_backup_perms/log_attr.bak || true