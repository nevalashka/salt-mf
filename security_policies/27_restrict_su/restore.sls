restore-su:
  file.copy:
    - name: /etc/pam.d/su
    - source: /etc/pam.d/su.bak
    - force: True