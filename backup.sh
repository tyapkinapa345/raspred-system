#!/bin/bash

DATA_DIR="./data"
BACKUP_DIR="./backups"

# Функция для создания резервной копии
create_backup() {
    echo "Creating backup..."
    cp "$DATA_DIR/data.txt" "$BACKUP_DIR/data_backup_$(date +%Y%m%d_%H%M%S).txt"
    echo "Backup created successfully."
}

# Вызов функции создания резервной копии
create_backup
