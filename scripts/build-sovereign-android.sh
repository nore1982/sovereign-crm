#!/bin/bash
set -e

echo "🚀 بدء عملية بناء الأندرويد من مجلد التطبيق..."

# الانتقال المباشر لمجلد أندرويد الفرعي حيث توجد ملفات البناء الحقيقية
cd android/app

# التحقق من وجود ملفات البناء أو إنشاء التوافقية وتشغيل بناء الـ Debug
if [ -f "../gradlew" ]; then
    ../gradlew assembleDebug
else
    gradle assembleDebug
fi

echo "✅ تم البناء بنجاح وتوليد ملف APK!"
