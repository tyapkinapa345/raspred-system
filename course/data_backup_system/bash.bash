# Настройка рабочей директории
   mkdir ~/data_backup_system
   cd ~/data_backup_system
# Создайте структуру каталогов:
   mkdir data   
# Создайте тестовые файлы
   echo "Это тестовый файл 1" > data/test1.txt
   echo "Это тестовый файл 2" > data/test2.txt
# Создание механизма резервного копирования
   nano backup.sh
# Сделайте скрипт исполняемым:
   chmod +x backup.sh
# Запустите скрипт резервного копирования
   ./backup.sh
# Имитация отказа
   rm ~/data_backup_system/data/test1.txt
   ls ~/data_backup_system/data
# Создание механизма восстановления
   nano restore.sh
# Сделайте скрипт исполняемым:
   chmod +x restore.sh
# Запустите скрипт резервного копирования
   ./restore.sh
   
