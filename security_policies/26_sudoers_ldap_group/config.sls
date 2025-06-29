deploy-sudoers:
  file.managed:
    - name: /etc/sudoers
    - source: salt://26_sudoers_ldap_group/files/sudoers
    - user: root
    - group: root
    - mode: 440
    - require:
      - file: backup-sudoers