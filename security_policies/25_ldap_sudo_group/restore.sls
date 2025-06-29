restore-nsswitch:
  file.copy:
    - name: /etc/nsswitch.conf
    - source: /etc/nsswitch.conf.bak
    - force: True