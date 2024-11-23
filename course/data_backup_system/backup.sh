#!/bin/bash
exec > /home/devops/data_backup_system/logfile.log 2>&1
echo "Резервное копирование началось в $(date)"
# Директория с данными и директория для резервных копий
DATA_DIR="/home/devops/data_backup_system/data"
BACKUP_DIR="/home/devops/data_backup_system/backup"

# Создаем директорию для резервных копий, если она не существует
mkdir -p $BACKUP_DIR

# Создаем метку времени
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Копируем данные в резервную директорию с меткой времени
cp -r "$DATA_DIR" "$BACKUP_DIR/data_$TIMESTAMP"

echo "Резервная копия создана: data_$TIMESTAMP"
