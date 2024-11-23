import os
import shutil

# Директории для данных и резервных копий
DATA_DIR = "/home/devops/data_storage"
BACKUP_DIR = "/home/devops/data_backup"

def restore_backup():
    # Находим последнюю резервную копию
    backups = sorted(os.listdir(BACKUP_DIR), reverse=True)
    if not backups:
        print("Нет доступных резервных копий для восстановления.")
        return

    latest_backup = backups[0]
    latest_backup_path = os.path.join(BACKUP_DIR, latest_backup)

    # Восстанавливаем данные из последней резервной копии
    # Удаляем старые данные перед восстановлением
    if os.path.exists(DATA_DIR):
        shutil.rmtree(DATA_DIR)

    shutil.copytree(latest_backup_path, DATA_DIR)

    print(f"Данные восстановлены из резервной копии: {latest_backup}")

if __name__ == "__main__":
    restore_backup()
