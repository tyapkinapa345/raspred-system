#!/bin/bash
exec > /home/devops/data_recovery_system/logfile.log 2>&1
echo "Резервное копирование началось в $(date)"

DATA_DIR="/home/devops/data_recovery_system/data"
BACKUP_DIR="/home/devops/data_recovery_system/backups"

# Функция для создания резервной копии
create_backup() {
    echo "Creating backup..."
    cp "$DATA_DIR/data.txt" "$BACKUP_DIR/data_backup_$(date +%Y%m%d_%H%M%S).txt"
    echo "Backup created successfully."
}

# Вызов функции создания резервной копии
create_backup
