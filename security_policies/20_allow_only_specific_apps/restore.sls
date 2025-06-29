restore_apparmor_profile:
  cmd.run:
    - name: |
        if [ -f /etc/apparmor.d/limited_user.bak ]; then
          cp /etc/apparmor.d/limited_user.bak /etc/apparmor.d/limited_user
          apparmor_parser -r /etc/apparmor.d/limited_user
        fi
    - comment: Восстанавливаем исходный AppArmor-профиль
