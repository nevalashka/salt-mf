restore-log-permissions:
  cmd.run:
    - name: |
        if [ -f /root/log_backup_perms/log_acl.bak ]; then
          setfacl --restore=/root/log_backup_perms/log_acl.bak
        fi
        if [ -f /root/log_backup_perms/log_attr.bak ]; then
          while IFS= read -r line; do
            file=$(echo "$line" | awk '{print $2}')
            chattr -a "$file" 2>/dev/null || true
          done < /root/log_backup_perms/log_attr.bak
        fi