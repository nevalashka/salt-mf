restore_issue:
  file.copy:
    - name: /etc/issue
    - source: /etc/issue.bak
    - force: True

restore_issue_net:
  file.copy:
    - name: /etc/issue.net
    - source: /etc/issue.net.bak
    - force: True

restore_motd:
  file.copy:
    - name: /etc/motd
    - source: /etc/motd.bak
    - force: True