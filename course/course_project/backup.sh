   #!/bin/bash
   exec > /home/devops/course_project/logfile.log 2>&1
   echo "Резервное копирование началось в $(date)"
   # Директории
   DATA_DIR="/home/devops/course_project/data"
   BACKUP_DIR="/home/devops/course_project/backups"

   # Дата и время
   TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
   BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

   mkdir -p "$BACKUP_FILE"
   # Создание резервной копии
   tar -czf "$BACKUP_FILE" -C "$DATA_DIR" .

   echo "Резервная копия создана: $BACKUP_FILE"