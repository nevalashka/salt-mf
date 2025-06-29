deploy-nsswitch:
  file.managed:
    - name: /etc/nsswitch.conf
    - source: salt://25_ldap/files/nsswitch.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: backup-nsswitch