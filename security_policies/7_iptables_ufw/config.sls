# Установка iptables-persistent
install_iptables_persistent:
  pkg.installed:
    - name: iptables-persistent
    - refresh: True
    - comment: Устанавливаем iptables-persistent

flush_iptables:
  cmd.run:
    - name: iptables -F
    - comment: Очищаем все текущие правила iptables
    - require:
      - pkg: install_iptables_persistent

set_default_policies:
  cmd.run:
    - name: |
        iptables -P INPUT DROP
        iptables -P FORWARD DROP
        iptables -P OUTPUT ACCEPT
    - comment: Устанавливаем политики DROP по умолчанию
    - require:
      - cmd: flush_iptables

allow_loopback_and_established:
  cmd.run:
    - name: |
        iptables -A INPUT -i lo -j ACCEPT
        iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
    - comment: Разрешаем loopback и установленные соединения

allow_ssh:
  cmd.run:
    - name: iptables -A INPUT -p tcp --dport 22 -j ACCEPT
    - comment: Разрешаем SSH

allow_salt_ports:
  cmd.run:
    - name: |
        iptables -A INPUT -p tcp --dport 4505 -j ACCEPT
        iptables -A INPUT -p tcp --dport 4506 -j ACCEPT
    - comment: Разрешаем SaltStack порты

save_iptables:
  cmd.run:
    - name: iptables-save > /etc/iptables/rules.v4
    - require:
      - pkg: install_iptables_persistent
    - comment: Сохраняем правила iptables

enable_ufw:
  cmd.run:
    - name: ufw enable
    - unless: "ufw status | grep -q 'Status: active'"
    - comment: Включаем ufw если ещё не активен

allow_ufw_ssh:
  cmd.run:
    - name: ufw allow 22/tcp
    - comment: Разрешаем SSH в ufw

deny_ufw_incoming:
  cmd.run:
    - name: ufw default deny incoming
    - comment: Блокируем входящие подключения по умолчанию

allow_ufw_outgoing:
  cmd.run:
    - name: ufw default allow outgoing
    - comment: Разрешаем исходящий трафик

allow_ufw_salt_4505:
  cmd.run:
    - name: ufw allow 4505/tcp
    - comment: Разрешаем SaltStack порт 4505

allow_ufw_salt_4506:
  cmd.run:
    - name: ufw allow 4506/tcp
    - comment: Разрешаем SaltStack порт 4506

