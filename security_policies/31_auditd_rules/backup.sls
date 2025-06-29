backup-auditd-rules:
  cmd.run:
    - name: |
        mkdir -p /etc/audit/rules.d.bak
        cp -r /etc/audit/rules.d/* /etc/audit/rules.d.bak/ 2>/dev/null || true