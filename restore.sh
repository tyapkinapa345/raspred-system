#!/bin/bash

# Директория для резервных копий
BACKUP_DIR=~/data_backup_system/backup
DATA_DIR=~/data_backup_system/data

# Находим последнюю резервную копию
LATEST_BACKUP=$(ls -t $BACKUP_DIR | head -n 1)

if [ -z "$LATEST_BACKUP" ]; then
    echo "Нет доступных резервных копий для восстановления."
    exit 1
fi

# Восстанавливаем данные из последней резервной копии
cp -r $BACKUP_DIR/$LATEST_BACKUP/* $DATA_DIR

echo "Данные восстановлены из резервной копии: $LATEST_BACKUP"
