# Очищаем все текущие правила iptables
flush_iptables:
  cmd.run:
    - name: iptables -F
    - comment: Очищаем все текущие правила iptables

# Устанавливаем политику по умолчанию DROP для INPUT, FORWARD и ACCEPT для OUTPUT
set_default_policies:
  cmd.run:
    - name: |
        iptables -P INPUT DROP
        iptables -P FORWARD DROP
        iptables -P OUTPUT ACCEPT
    - comment: Устанавливаем политики по умолчанию

# Разрешаем loopback интерфейс и установленные соединения
allow_loopback_and_established:
  cmd.run:
    - name: |
        iptables -A INPUT -i lo -j ACCEPT
        iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
    - comment: Разрешаем трафик с loopback и установленные соединения

# Разрешаем входящие TCP подключения на порт 22
allow_ssh:
  cmd.run:
    - name: iptables -A INPUT -p tcp --dport 22 -j ACCEPT
    - comment: Разрешаем входящий SSH трафик

# Разрешаем порты SaltStack (4505 и 4506)
allow_salt_ports:
  cmd.run:
    - name: |
        iptables -A INPUT -p tcp --dport 4505 -j ACCEPT
        iptables -A INPUT -p tcp --dport 4506 -j ACCEPT
    - comment: Разрешаем входящий трафик для SaltStack (порты 4505 и 4506)

# Сохраняем правила iptables
save_iptables:
  cmd.run:
    - name: iptables-save > /etc/iptables/rules.v4
    - comment: Сохраняем правила iptables для перезагрузки

# Включаем ufw (если он установлен)
enable_ufw:
  cmd.run:
    - name: ufw enable
    - unless: ufw status | grep -q "Status: active"
    - comment: Включаем ufw если он не активен

# Устанавливаем базовые правила ufw
allow_ufw_ssh:
  cmd.run:
    - name: ufw allow 22/tcp
    - comment: Разрешаем SSH в ufw

deny_ufw_incoming:
  cmd.run:
    - name: ufw default deny incoming
    - comment: Блокируем весь входящий трафик по умолчанию

allow_ufw_outgoing:
  cmd.run:
    - name: ufw default allow outgoing
    - comment: Разрешаем весь исходящий трафик по умолчанию

allow_ufw_salt:
  cmd.run:
    - name: ufw allow 4505/tcp
    - comment: Разрешаем SaltStack порт 4505 в ufw

allow_ufw_salt2:
  cmd.run:
    - name: ufw allow 4506/tcp
    - comment: Разрешаем SaltStack порт 4506 в ufw