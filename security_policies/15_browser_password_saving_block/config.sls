configure_chrome_policy:
  file.managed:
    - name: /etc/opt/chrome/policies/managed/chrome_policy.json
    - source: salt://15_browser_password_saving_block/files/chrome_policy.json
    - user: root
    - group: root
    - mode: 0644
    - makedirs: True
    - comment: Отключаем автосохранение паролей в Chrome
