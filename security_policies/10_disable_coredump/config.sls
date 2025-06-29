disable_core_dump:
  file.replace:
    - name: /etc/security/limits.conf
    - pattern: '^\*\s+hard\s+core\s+\d+'
    - repl: '*                hard    core            0'
    - append_if_not_found: True
    - backup: False
    - require:
      - file: backup_limits_conf