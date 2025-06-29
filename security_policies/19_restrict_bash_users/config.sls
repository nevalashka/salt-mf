# Создаём группу с доступом к shell
create_bashusers_group:
  group.present:
    - name: bashusers

# Ограничиваем запуск оболочек только для группы bashusers
restrict_shells_execution:
  cmd.run:
    - name: |
        for shell in /bin/bash /bin/sh /bin/dash /bin/rbash /usr/bin/zsh; do
          if [ -f "$shell" ]; then
            chgrp bashusers "$shell"
            chmod 750 "$shell"
          fi
        done
    - require:
      - group: create_bashusers_group
