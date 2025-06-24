
install_sssd:
  pkg.installed:
    - pkgs:
        - sssd
        - sssd-tools
        - krb5-user
        - libpam-krb5
        - libpam-sss

/etc/sssd/sssd.conf:
  file.managed:
    - source: salt://sssd/files/sssd.conf.j2
    - template: jinja
    - user: root
    - group: root
    - mode: 600
    - require:
        - pkg: install_sssd
    - watch_in:
        - service: sssd_service

/etc/krb5.conf:
  file.managed:
    - source: salt://sssd/files/krb5.conf.j2
    - template: jinja
    - user: root
    - group: root
    - mode: 644

sssd_service:
  service.running:
    - name: sssd
    - enable: True
    - require:
        - file: /etc/sssd/sssd.conf
