deploy-lock-config:
  file.managed:
    - name: /etc/dconf/db/local.d/00-screensaver-lock
    - source: salt://28_gui_idle_screen_lock/files/00-screensaver-lock
    - user: root
    - group: root
    - mode: 644
    - require:
      - cmd: backup-lock-config

update-dconf-db:
  cmd.run:
    - name: dconf update
    - require:
      - file: deploy-lock-config