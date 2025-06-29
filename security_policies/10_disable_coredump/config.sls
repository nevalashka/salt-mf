disable_core_dump:
  file.line:                        # Управляем строками внутри файла limits.conf
    - name: /etc/security/limits.conf   # Целевой файл с настройками лимитов
    - mode: ensure                  # Гарантируем, что строка будет добавлена или заменена
    - line: '*                hard    core            0'  # Запрещаем core dump для всех пользователей
    - match: '^\*\s+hard\s+core\s+\d+'  # Ищем строку с лимитом core dump для всех пользователей
    - backrefs: False               # Не используем обратные ссылки в регулярном выражении
    - require:                     # Зависимость — сначала создаём резервную копию
      - file: backup_limits_conf
    - comment: Запрещаем создание core dump для всех пользователей