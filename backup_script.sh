#!/bin/bash

# تنظیمات
SOURCE_DIR="/home/shno/Desktop/backup/projects"       # پوشه‌ای که می‌خواهید از آن پشتیبان بگیرید
BACKUP_DIR="/home/shno/Desktop/backup/"        # پوشه‌ای که پشتیبان‌ها در آن ذخیره می‌شود
RETENTION_DAYS=7                    # تعداد روزهایی که فایل‌های پشتیبان باید نگه‌داری شوند

# تاریخ و زمان برای نام فایل پشتیبان
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
BACKUP_FILE="${BACKUP_DIR}/backup_${TIMESTAMP}.tar.gz"

# ایجاد پشتیبان
echo "ایجاد پشتیبان از ${SOURCE_DIR} ..."
tar -czf "${BACKUP_FILE}" -C "${SOURCE_DIR}" .

 # حذف فایل‌های پشتیبان قدیمی‌تر از RETENTION_DAYS روز
find "${BACKUP_DIR}" -name "backup_*.tar.gz" -type f -mtime +${RETENTION_DAYS} -exec rm {} \;

echo "پشتیبان‌گیری و مدیریت فایل‌ها به پایان رسید."
