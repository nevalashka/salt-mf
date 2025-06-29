restore-sudoers:
  file.copy:
    - name: /etc/sudoers
    - source: /etc/sudoers.bak
    - force: True