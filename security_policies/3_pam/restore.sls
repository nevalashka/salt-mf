restore_common_session:
  file.copy:
    - name: /etc/pam.d/common-session
    - source: /etc/pam.d/common-session.bak
    - force: True