install-auth-packages:
  pkg.installed:
    - pkgs:
      - sssd

deploy-sssd:
  file.managed:
    - name: /etc/sssd/sssd.conf
    - source: salt://security/auth/files/sssd.conf
    - user: root
    - group: root
    - mode: 0600

enable-sssd:
  service.running:
    - name: sssd
    - enable: True
    - watch:
      - file: deploy-sssd