pam_time_restrictions:
  file.managed:
    - name: /etc/security/time.conf
    - source: salt://security_policies/pam/time.conf
    - user: root
    - group: root
    - mode: 644