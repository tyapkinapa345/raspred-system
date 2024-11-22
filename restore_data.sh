restore_data() {
    if [ -z "$2" ]; then
        echo "Please provide the backup file name."
        return
    fi
    echo "Restoring data from backup: $2..."
    if [ -f "$BACKUP_DIR/$2" ]; then
        cp "$BACKUP_DIR/$2" "$DATA_DIR/data.txt"
        echo "Data restored from $2."
    else
        echo "Backup file $2 not found!"
    fi
}
