pam_system_auth_mkhomedir:
  file.replace:
    - name: /etc/pam.d/system-auth
    - pattern: '^#?\\s*session\\s+required\\s+pam_mkhomedir.so.*'
    - repl: 'session required pam_mkhomedir.so skel=/etc/skel/ umask=0022'
    - append_if_not_found: True