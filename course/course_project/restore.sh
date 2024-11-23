   #!/bin/bash

   BACKUP_DIR="/home/devops/data_recovery_system/backups"

   # Последняя резервная копия
   LAST_BACKUP=$(ls -t $BACKUP_DIR | head -n 1)

   if [ -z "$LAST_BACKUP" ]; then
       echo "Нет резервных копий для восстановления."
       exit 1
   fi

   # Восстановление
   TAR_FILE="$BACKUP_DIR/$LAST_BACKUP"
   tar -xzf "$TAR_FILE" -C ./data

   echo "Восстановление данных из резервной копии: $LAST_BACKUP"
