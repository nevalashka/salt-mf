install-auth-packages:
  pkg.installed:
    - names:
      - sssd
      - sssd-tools
      - libpam-sss
      - libnss-sss

deploy-sssd:
  file.managed:
    - name: /etc/sssd/sssd.conf
    - source: salt://1_sssd/files/sssd.conf
    - user: root
    - group: root
    - mode: 600
    - require:
      - pkg: install-auth-packages

enable-sssd:
  service.running:
    - name: sssd
    - enable: true
    - watch:
      - file: deploy-sssd