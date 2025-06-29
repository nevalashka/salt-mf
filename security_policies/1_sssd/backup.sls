{% if salt['file.file_exists']('/etc/sssd/sssd.conf') %}

backup-sssd:
  file.copy:
    - name: /etc/sssd/sssd.conf.bak
    - source: /etc/sssd/sssd.conf
    - force: true

{% else %}

skip-backup:
  test.nop:
    - comment: "/etc/sssd/sssd.conf not found, skipping backup"

{% endif %}