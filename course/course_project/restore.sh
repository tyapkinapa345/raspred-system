#!/bin/bash

BACKUP_DIR="/home/devops/course_project/backup"

# Последняя резервная копия
LAST_BACKUP=$(ls -t $BACKUP_DIR | grep -v '/$' | head -n 1)

if [ -z "$LAST_BACKUP" ]; then
    echo "Нет резервных копий для восстановления."
    exit 1
fi

# Восстановление
TAR_FILE="$BACKUP_DIR/$LAST_BACKUP"
if [ ! -f "$TAR_FILE" ]; then
    echo "Файл резервной копии не найден или не является файлом."
    exit 1
fi

tar -xzf "$TAR_FILE" -C /home/devops/course_project/data

echo "Восстановление данных из резервной копии: $LAST_BACKUP"
