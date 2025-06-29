deploy_common_session_config:
  file.managed:
    - name: /etc/pam.d/common-session
    - source: salt://3_pam/files/common-session
    - user: root
    - group: root
    - mode: 644
    - backup: minion