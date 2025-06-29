#!/bin/bash

backup_file="/root/blocked_commands_permissions_backup.txt"

# Проверка существования бэкапа
if [ ! -f "$backup_file" ]; then
  echo "Файл бэкапа не найден!"
  exit 1
fi

# Восстановление прав доступа
while read -r line; do
  perms=$(echo "$line" | awk '{print $1}')
  file=$(echo "$line" | awk '{print $9}')

  # Преобразование прав из символьных (например, -rwxr-xr-x) в числовые (755)
  numeric_perms=$(echo "$perms" | sed 's/-//' | tr -d '\n' | awk '
    BEGIN { split("rwx", chars, ""); split("421", nums, ""); }
    {
      for (i=1;i<=length($0);i+=3) {
        sum = 0
        for (j=0;j<3;j++) {
          c = substr($0, i+j, 1)
          if (c != "-") sum += nums[j+1]
        }
        printf "%d", sum
      }
    }')

  if [ -f "$file" ]; then
    chmod "$numeric_perms" "$file"
    echo "Восстановлены права $numeric_perms для $file"
  fi
done < "$backup_file"
