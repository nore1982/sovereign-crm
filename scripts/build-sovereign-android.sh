#!/bin/bash
set -e

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; BLUE='\033[0;34m'; CYAN='\033[0;36m'; GOLD='\033[38;5;220m'; NC='\033[0m'

BUILD_TYPE="${1:-debug}"
echo -e "\n${GOLD}╔═══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GOLD}║${NC}  👑  ${CYAN}مسار السيادية — Android 13 (API 33) Builder${NC}"
echo -e "${GOLD}╚═══════════════════════════════════════════════════════════════╝${NC}\n"

echo -e "${BLUE}▶${NC} ${YELLOW}تثبيت الحزم...${NC}"
npm install
npm install @capacitor/android @capacitor/splash-screen @capacitor/status-bar @capacitor/keyboard --save

echo -e "${BLUE}▶${NC} ${YELLOW}بناء Production...${NC}"
npm run build:prod

echo -e "${BLUE}▶${NC} ${YELLOW}مزامنة Android...${NC}"
npx cap sync android

echo -e "${BLUE}▶${NC} ${YELLOW}ضبط Gradle...${NC}"
sed -i 's/compileSdk [0-9]*/compileSdk 33/g' android/app/build.gradle || true
sed -i 's/targetSdk [0-9]*/targetSdk 33/g' android/app/build.gradle || true

if [ "$BUILD_TYPE" == "release" ]; then
    echo -e "${BLUE}▶${NC} ${YELLOW}بناء Release APK...${NC}"
    cd android && ./gradlew assembleRelease
    APK="app/build/outputs/apk/release/app-release.apk"
else
    echo -e "${BLUE}▶${NC} ${YELLOW}بناء Debug APK...${NC}"
    cd android && ./gradlew assembleDebug
    APK="app/build/outputs/apk/debug/app-debug.apk"
fi

mkdir -p builds
cp "$APK" "../../builds/SovereignCRM-${BUILD_TYPE}-$(date +%Y%m%d-%H%M).apk"

echo -e "\n${GREEN}✓ تم البناء بنجاح!${NC}"
echo -e "${CYAN}📁 $APK${NC}"
echo -e "${GOLD}👑 Sovereign CRM — Built with Excellence${NC}\n"
