krb5_conf:
  file.managed:
    - name: /etc/krb5.conf
    - source: salt://security_policies/krb5/krb5.conf.j2
    - template: jinja
    - user: root
    - group: root
    - mode: 644