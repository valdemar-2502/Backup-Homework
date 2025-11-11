#!/bin/bash

SOURCE_DIR="$HOME"
BACKUP_DIR="/tmp/backup"
LOG_TAG="HOME_BACKUP"

mkdir -p "$BACKUP_DIR"

logger -t "$LOG_TAG" "Начало резервного копирования домашней директории $USER"

if rsync -av --delete "$SOURCE_DIR/" "$BACKUP_DIR/" > /dev/null 2>&1; then    
    logger -t "$LOG_TAG" "Резервное копирование успешно завершено"
    exit 0
else
    logger -t "$LOG_TAG" "ОШИБКА: Резервное копирование не удалось"
    exit 1
fi
