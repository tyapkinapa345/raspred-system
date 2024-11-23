#!/bin/bash

DATA_DIR="./data"
BACKUP_DIR="./backups"

# Функция для создания данных
create_data() {
    echo "Creating data file..."
    echo "This is some important data." > "$DATA_DIR/data.txt"
    echo "Data created successfully."
}

# Функция для создания резервной копии
create_backup() {
    echo "Creating backup..."
    cp "$DATA_DIR/data.txt" "$BACKUP_DIR/data_backup_$(date +%Y%m%d_%H%M%S).txt"
    echo "Backup created successfully."
}

# Функция для восстановления данных
restore_data() {
    echo "Restoring data from the latest backup..."
    latest_backup=$(ls -t "$BACKUP_DIR" | head -n 1)
    if [ -z "$latest_backup" ]; then
        echo "No backups found!"
        return
    fi
    cp "$BACKUP_DIR/$latest_backup" "$DATA_DIR/data.txt"
    echo "Data restored from $latest_backup."
}

# Функция для отображения всех резервных копий
list_backups() {
    echo "Available backups:"
    ls -l "$BACKUP_DIR"
}

# Основное меню
case $1 in
    create)
        create_data
        ;;
    backup)
        create_backup
        ;;
    restore)
        restore_data
        ;;
    list)
        list_backups
        ;;
    *)
        echo "Usage: $0 {create|backup|restore|list}"
        ;;
esac
