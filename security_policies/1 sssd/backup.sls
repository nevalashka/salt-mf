backup-sssd:
  file.copy:
    - source: /etc/sssd/sssd.conf
    - name: /etc/sssd/sssd.conf.bak
    - force: True