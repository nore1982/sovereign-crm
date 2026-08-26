#!/bin/bash
set -e

echo "🚀 بدء عملية بناء الأندرويد..."

# التحقق من مكان وجود ملفات بناء أندرويد وتوجيه Gradle إليها
if [ -d "android/app" ]; then
    cd android
    if [ -f "gradlew" ]; then
        chmod +x gradlew
        ./gradlew assembleDebug
    else
        gradle assembleDebug
    fi
else
    echo "⚠️ مجلد الأندرويد غير مكتمل، جارٍ البحث..."
    exit 1
fi

echo "✅ تم البناء بنجاح!"
