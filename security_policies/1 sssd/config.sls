install-auth-packages:
  pkg.installed:
    - pkgs:
      - sssd
      - libnss-sss
      - libpam-sss
      - krb5-user

deploy-sssd:
  file.managed:
    - name: /etc/sssd/sssd.conf
    - source: salt://security/auth/files/sssd.conf
    - user: root
    - group: root
    - mode: 0600
