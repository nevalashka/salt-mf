Вот готовый README.md для проекта:

# Configuration Policy for SaltStack

Этот каталог содержит Salt-состояния для управления конфигурацией для debian.

## 📁 Пример структуры каталогов

```
1_sssd/
├── files/
│ └── sssd.conf # Желаемый конфигурационный файл
├── backup.sls # Создание резервной копии текущего /etc/sssd/sssd.conf → /etc/sssd/sssd.conf.bak
├── config.sls # Применение нового конфига и перезапуск службы sssd
├── restore.sls # Восстановление конфига из резервной копии
└── init.sls # Комплекс: backup + config
```

## 🚀 Применение политики

Для применения новой конфигурации (включает создание бэкапа и установку нового файла):

```bash
sudo salt '*' state.apply 1_policy_name

⏪ Бекап

sudo salt '*' state.apply 1_policy_name.backup

⏪ Откат конфигурации

Для возврата старой конфигурации из бэкапа:

sudo salt '*' state.apply 1_policy_name.restore

Дока

https://docs.saltproject.io/salt/install-guide/en/latest/index.html

⸻
```
