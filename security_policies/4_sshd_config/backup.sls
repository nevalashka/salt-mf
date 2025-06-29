backup_sshd_config:
  file.copy:
    - name: /etc/ssh/sshd_config.bak
    - source: /etc/ssh/sshd_config
    - force: True
