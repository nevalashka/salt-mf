restore_apparmor_profiles:
  cmd.run:
    - name: tar xzf /root/apparmor_profiles_backup.tar.gz -C /
    - onlyif: test -f /root/apparmor_profiles_backup.tar.gz
    - comment: Восстанавливаем профили AppArmor из резервной копии

reload_restored_profiles:
  cmd.run:
    - name: systemctl restart apparmor
    - require:
      - cmd: restore_apparmor_profiles
    - comment: Перезапускаем службу AppArmor после восстановления