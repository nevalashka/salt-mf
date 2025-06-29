deploy-su-pam:
  file.managed:
    - name: /etc/pam.d/su
    - source: salt://27_restrict_su/files/su
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: backup-su