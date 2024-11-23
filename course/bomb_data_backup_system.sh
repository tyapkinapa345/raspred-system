#!/bin/bash

# Файл для хранения данных
DATA_FILE="/home/devops/data_backup_system/data/test1.txt"

# Функция для записи данных
write_data() {
    echo "Запись данных: $1" >> "$DATA_FILE"
    echo "Данные записаны: $1"
}

# Функция для имитации сбоя
simulate_failure() {
    if (( RANDOM % 5 == 0 )); then  # 20% вероятность сбоя
        echo "Сбой записи данных! Удаление файла..."
        rm -f "$DATA_FILE"  # Удаляем файл для имитации сбоя
        exit 1
    fi
}

# Основной цикл записи данных
for i in {1..10}; do
    write_data "Запись номер $i"
    simulate_failure
    sleep 1
done

# Чтение данных
if [[ -f "$DATA_FILE" ]]; then
    echo "Чтение данных:"
    cat "$DATA_FILE"
else
    echo "Ошибка: Файл данных не найден. Не удалось прочитать данные."
fi
