/etc/ssh/sshd_config:
  file.managed:
    - source: salt://4_sshd_config/files/sshd_config
    - user: root
    - group: root
    - mode: '0644'
    - backup: minion
    

restart_sshd:
  service.running:
    - name: sshd
    - enable: True
    - watch:
      - file: /etc/ssh/sshd_config
