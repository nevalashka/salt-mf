restore-sssd:
  file.copy:
    - source: /etc/sssd/sssd.conf.bak
    - name: /etc/sssd/sssd.conf
    - force: True

restart-sssd:
  service.running:
    - name: sssd
    - enable: True
    - reload: True
    - watch:
      - file: restore-sssd