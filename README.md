# salt-mf

Структура файлов
sssd/
├── files/
│ └── sssd.conf # Желаемый конфигурационный файл
├── backup.sls # Сохраняет текущий /etc/sssd/sssd.conf → .bak
├── config.sls # Применяет новый конфиг, перезапускает службу
├── restore.sls # Возвращает .bak → /etc/sssd/sssd.conf
└── init.sls # Включает backup + config

Применить одну политику

sudo salt '\*' state.apply sssd

Откат (если нужно вернуть старый конфиг):

sudo salt '\*' state.apply sssd.restore
