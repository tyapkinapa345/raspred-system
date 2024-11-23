   #!/bin/bash

   # Директории
   DATA_DIR="./data"
   BACKUP_DIR="./backups"

   # Дата и время
   TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
   BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

   # Создание резервной копии
   tar -czf "$BACKUP_FILE" -C "$DATA_DIR" .

   echo "Резервная копия создана: $BACKUP_FILE"
