restore-lock-config:
  cmd.run:
    - name: |
        rm -f /etc/dconf/db/local.d/00-screensaver-lock
        cp -r /etc/dconf/db/local.d.bak/* /etc/dconf/db/local.d/
        dconf update