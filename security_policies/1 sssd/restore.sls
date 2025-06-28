restore-sssd:
  file.copy:
    - source: /etc/sssd/sssd.conf.bak
    - name: /etc/sssd/sssd.conf
    - force: True