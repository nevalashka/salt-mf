/etc/krb5.conf:
  file.managed:
    - source: salt://krb5/files/krb5.conf
    - user: root
    - group: root
    - mode: 644