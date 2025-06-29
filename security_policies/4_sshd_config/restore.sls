restore_sshd_config:
  file.copy:
    - name: /etc/ssh/sshd_config
    - source: /etc/ssh/sshd_config.bak
    - force: True