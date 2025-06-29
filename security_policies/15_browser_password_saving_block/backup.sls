backup_chrome_policy:
  cmd.run:
    - name: cp /etc/opt/chrome/policies/managed/chrome_policy.json /etc/opt/chrome/policies/managed/chrome_policy.json.bak
    - onlyif: test -f /etc/opt/chrome/policies/managed/chrome_policy.json
    - comment: Создаём бэкап политики Chrome
