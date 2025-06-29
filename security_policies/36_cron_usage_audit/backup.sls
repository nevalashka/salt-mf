backup-cron-audit:
  cmd.run:
    - name: |
        mkdir -p /root/cron_backup
        cp -a /etc/cron.allow /root/cron_backup/cron.allow.bak 2>/dev/null || true
        cp -a /etc/cron.deny /root/cron_backup/cron.deny.bak 2>/dev/null || true
        cp -a /etc/audit/rules.d/cron.rules /root/cron_backup/cron.rules.bak 2>/dev/null || true