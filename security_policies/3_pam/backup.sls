backup_common_session:
  file.copy:
    - name: /etc/pam.d/common-session.bak
    - source: /etc/pam.d/common-session
    - force: True