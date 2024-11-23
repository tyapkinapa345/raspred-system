#!/bin/bash

# Директория с данными и директория для резервных копий
DATA_DIR=~/data_backup_system/data
BACKUP_DIR=~/data_backup_system/backup

# Создаем директорию для резервных копий, если она не существует
mkdir -p $BACKUP_DIR

# Создаем метку времени
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Копируем данные в резервную директорию с меткой времени
cp -r $DATA_DIR $BACKUP_DIR/data_$TIMESTAMP

echo "Резервная копия создана: data_$TIMESTAMP"


   echo "Это тестовый файл 1" > data/test1.txt
   echo "Это тестовый файл 2" > data/test2.txt
