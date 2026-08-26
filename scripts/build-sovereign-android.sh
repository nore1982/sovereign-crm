#!/bin/bash
set -e

echo "🔨 بدء بناء ملف الـ APK بواسطة Gradle مباشرة..."

# الانتقال إلى مجلد أندرويد
cd android

# إعطاء صلاحية التنفيذ لملف الـ gradlew
chmod +x gradlew

# بناء نسخة الـ Debug APK
./gradlew assembleDebug

echo "✅ تم بناء ملف الـ APK بنجاح!"
