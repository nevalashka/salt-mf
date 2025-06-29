backup_limits_conf:
  file.copy:
    - name: /etc/security/limits.conf.bak
    - source: /etc/security/limits.conf
    - backup: False
    - makedirs: True
    - comment: Создаём резервную копию limits.conf перед изменениями