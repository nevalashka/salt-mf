restore_chrome_policy:
  cmd.run:
    - name: mv /etc/opt/chrome/policies/managed/chrome_policy.json.bak /etc/opt/chrome/policies/managed/chrome_policy.json
    - onlyif: test -f /etc/opt/chrome/policies/managed/chrome_policy.json.bak
    - comment: Восстанавливаем политику Chrome из бэкапа
