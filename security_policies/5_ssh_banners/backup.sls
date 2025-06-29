backup_issue:
  file.copy:
    - name: /etc/issue.bak
    - source: /etc/issue
    - force: True

backup_issue_net:
  file.copy:
    - name: /etc/issue.net.bak
    - source: /etc/issue.net
    - force: True
