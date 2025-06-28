sshd_config:
  file.managed:
    - name: /etc/ssh/sshd_config
    - source: salt://security_policies/sshd/sshd_config.j2
    - template: jinja
    - user: root
    - group: root
    - mode: 600

  service.running:
    - name: sshd
    - enable: true
    - watch:
      - file: sshd_config

issue_file:
  file.managed:
    - name: /etc/issue
    - source: salt://security_policies/sshd/issue
    - user: root
    - group: root
    - mode: 644

motd_file:
  file.managed:
    - name: /etc/motd
    - source: salt://security_policies/sshd/motd
    - user: root
    - group: root
    - mode: 644