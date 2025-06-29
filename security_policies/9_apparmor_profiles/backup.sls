backup_apparmor_profiles:
  cmd.run:
    - name: tar czf /root/apparmor_profiles_backup.tar.gz /etc/apparmor.d/
    - creates: /root/apparmor_profiles_backup.tar.gz
    - comment: Создаём архив с резервной копией профилей AppArmor