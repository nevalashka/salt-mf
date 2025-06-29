restore_shell_permissions:
  cmd.run:
    - name: |
        while read -r line; do
          perms=$(echo "$line" | awk '{print $1}')
          user=$(echo "$line" | awk '{print $3}')
          group=$(echo "$line" | awk '{print $4}')
          file=$(echo "$line" | awk '{print $9}')
          [ -f "$file" ] && chown "$user:$group" "$file"
          case "$perms" in
            -rwxr-xr-x) chmod 755 "$file" ;;
            -rwx--x--x) chmod 711 "$file" ;;
            *) echo "Неизвестные права $perms, обработайте вручную: $file" ;;
          esac
        done < /root/shell_permissions_backup.txt
    - onlyif: test -f /root/shell_permissions_backup.txt
    - comment: Восстанавливаем права оболочек
