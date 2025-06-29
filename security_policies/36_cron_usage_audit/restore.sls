restore-cron-audit:
  cmd.run:
    - name: |
        cp -a /root/cron_backup/cron.allow.bak /etc/cron.allow 2>/dev/null || true
        cp -a /root/cron_backup/cron.deny.bak /etc/cron.deny 2>/dev/null || true
        cp -a /root/cron_backup/cron.rules.bak /etc/audit/rules.d/cron.rules 2>/dev/null || true
        augenrules --load