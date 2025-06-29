backup-su:
  file.copy:
    - name: /etc/pam.d/su.bak
    - source: /etc/pam.d/su
    - force: True