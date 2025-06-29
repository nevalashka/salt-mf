backup_apparmor_profile:
  cmd.run:
    - name: |
        if [ -f /etc/apparmor.d/limited_user ]; then
          cp /etc/apparmor.d/limited_user /etc/apparmor.d/limited_user.bak
        fi
    - comment: Делаем резервную копию текущего профиля limited_user
