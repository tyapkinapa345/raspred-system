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
    if [ -z "$1" ]; then
        echo "Please provide the backup file name."
        return
    fi
    echo "Restoring data from backup: $1..."
    if [ -f "$BACKUP_DIR/$1" ]; then
        cp "$BACKUP_DIR/$1" "$DATA_DIR/data.txt"
        echo "Data restored from $1."
    else
        echo "Backup file $1 not found!"
    fi
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
        restore_data "$2"  # Передаем второй аргумент как имя резервной копии
        ;;
    list)
        list_backups
        ;;
    *)
        echo "Usage: $0 {create|backup|restore|list} [backup_file_name]"
        ;;
esac
