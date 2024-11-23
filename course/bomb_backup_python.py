import random
import time
import os

DATA_FILE = "/home/devops/backup_python/data_storage/test1.txt"

def write_data(value):
    with open(DATA_FILE, "a") as f:
        f.write(f"Запись: {value}\n")
    print(f"Данные записаны: {value}")

def simulate_failure():
    if random.random() < 0.2:  # 20% вероятность сбоя
        print("Сбой записи данных! Удаление файла...")
        os.remove(DATA_FILE)  # Удаляем файл для имитации сбоя
        raise Exception("Сбой записи данных!")

def main():
    for i in range(10):
        try:
            write_data(f"Запись номер {i + 1}")
            simulate_failure()
            time.sleep(1)
        except Exception as e:
            print(e)
            print("Восстановление данных...")
            # Здесь вы можете добавить код для восстановления данных
            break

    # Чтение данных
    if os.path.exists(DATA_FILE):
        print("Чтение данных:")
        with open(DATA_FILE, "r") as f:
            print(f.read())
    else:
        print("Ошибка: Файл данных не найден. Не удалось прочитать данные.")

if __name__ == "__main__":
    main()
