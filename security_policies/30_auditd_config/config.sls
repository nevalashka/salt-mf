deploy-auditd-config:
  file.managed:
    - name: /etc/audit/auditd.conf
    - source: salt://30_auditd_config/files/auditd.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: backup-auditd-config

restart-auditd:
  service.running:
    - name: auditd
    - enable: true
    - watch:
      - file: deploy-auditd-config