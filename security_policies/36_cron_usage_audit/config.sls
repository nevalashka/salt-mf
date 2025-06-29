deploy-cron-allow:
  file.managed:
    - name: /etc/cron.allow
    - source: salt://36_cron_usage_audit/files/cron.allow
    - user: root
    - group: root
    - mode: 644

disable-cron-deny:
  file.absent:
    - name: /etc/cron.deny

deploy-cron-audit-rules:
  file.managed:
    - name: /etc/audit/rules.d/cron.rules
    - source: salt://36_cron_usage_audit/files/cron.rules
    - user: root
    - group: root
    - mode: 640

reload-auditd:
  cmd.run:
    - name: augenrules --load
    - require:
      - file: deploy-cron-audit-rules