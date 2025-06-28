install-sssd:
  pkg.installed:
    - name: sssd

deploy-sssd:
  file.managed:
    - name: /etc/sssd/sssd.conf
    - source: salt://security_policies/1 sssd/files/sssd.conf
    - user: root
    - group: root
    - mode: 0600

enable-sssd:
  service.running:
    - name: sssd
    - enable: True
    - watch:
      - file: deploy-sssd