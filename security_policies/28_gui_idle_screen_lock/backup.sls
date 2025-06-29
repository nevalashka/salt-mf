backup-lock-config:
  cmd.run:
    - name: |
        mkdir -p /etc/dconf/db/local.d.bak
        cp -r /etc/dconf/db/local.d/* /etc/dconf/db/local.d.bak/ 2>/dev/null || true