backup-sudoers:
  file.copy:
    - name: /etc/sudoers.bak
    - source: /etc/sudoers
    - force: True