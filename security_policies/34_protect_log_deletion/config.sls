protect-log-deletion-script:
  file.managed:
    - name: /usr/local/sbin/log_protect.sh
    - source: salt://34_protect_log_deletion/files/log_protect.sh
    - mode: 700
    - user: root
    - group: root

apply-log-protection:
  cmd.run:
    - name: /usr/local/sbin/log_protect.sh
    - require:
      - file: protect-log-deletion-script