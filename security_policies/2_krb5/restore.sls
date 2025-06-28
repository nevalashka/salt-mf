restore-krb5:
  file.copy:
    - source: /etc/krb5.conf.bak
    - name: /etc/krb5.conf
    - force: True