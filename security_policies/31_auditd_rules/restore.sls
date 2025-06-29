restore-auditd-rules:
  cmd.run:
    - name: |
        rm -f /etc/audit/rules.d/*
        cp -r /etc/audit/rules.d.bak/* /etc/audit/rules.d/
        augenrules --load