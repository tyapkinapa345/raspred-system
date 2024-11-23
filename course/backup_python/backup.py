import os
import shutil
import datetime

# Директории для данных и резервных копий
DATA_DIR = "/home/devops/data_storage"
BACKUP_DIR = "/home/devops/data_backup"

def create_backup():
    # Создаем имя резервной копии с текущей датой и временем
    backup_name = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
    backup_path = os.path.join(BACKUP_DIR, f"backup_{backup_name}")

    # Создаем директорию для резервной копии
    os.makedirs(backup_path, exist_ok=True)

    # Копируем файлы из DATA_DIR в BACKUP_DIR
    for item in os.listdir(DATA_DIR):
        source = os.path.join(DATA_DIR, item)
        destination = os.path.join(backup_path, item)
        if os.path.isdir(source):
            shutil.copytree(source, destination)
        else:
            shutil.copy2(source, destination)

    print(f"Резервная копия создана: {backup_path}")

if __name__ == "__main__":
    create_backup()
