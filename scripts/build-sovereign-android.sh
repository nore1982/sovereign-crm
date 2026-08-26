#!/bin/bash
set -e

echo "🚀 تجهيز بيئة البناء..."

# الانتقال لمجلد أندرويد
cd android

# التأكد من وجود ملف gradlew أو إنشائه عبر gradle إن لم يكن موجوداً
if [ ! -f "gradlew" ]; then
    echo "إنشاء ملفات التشغيل..."
    gradle wrapper
fi

chmod +x gradlew
./gradlew assembleDebug

echo "✅ تمت عملية البناء بنجاح!"
