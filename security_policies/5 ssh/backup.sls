backup-sshd:
  file.copy:
    - source: /etc/ssh/sshd_config
    - name: /etc/ssh/sshd_config.bak
    - force: True