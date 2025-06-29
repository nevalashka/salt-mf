deploy-auditd-rules:
  file.managed:
    - name: /etc/audit/rules.d/10-base.rules
    - source: salt://31_auditd_rules/files/10-base.rules
    - user: root
    - group: root
    - mode: 640
    - require:
      - cmd: backup-auditd-rules

reload-auditd-rules:
  cmd.run:
    - name: augenrules --load
    - require:
      - file: deploy-auditd-rules