#!/bin/bash

chmod 750 /var/log
chown root:adm /var/log

# Защита важных логов
for f in /var/log/syslog /var/log/messages /var/log/auth.log /var/log/audit/audit.log; do
  if [ -f "$f" ]; then
    chown root:root "$f"
    chmod 640 "$f"
    chattr +a "$f" 2>/dev/null || true  # только append, если доступно
  fi
done