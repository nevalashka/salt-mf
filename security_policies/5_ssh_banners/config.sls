/etc/issue:
  file.managed:
    - source: salt://5_ssh_banners/files/issue
    - user: root
    - group: root
    - mode: '0644'
    - backup: minion

/etc/issue.net:
  file.managed:
    - source: salt://5_ssh_banners/files/issue.net
    - user: root
    - group: root
    - mode: '0644'
    - backup: minion

/etc/motd:
  file.managed:
    - source: salt://5_ssh_banners/files/motd
    - user: root
    - group: root
    - mode: '0644'
    - backup: minion