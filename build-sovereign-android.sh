#!/bin/bash
echo "Starting Sovereign CRM Android Build Process..."

# Check gradle wrapper or build using gradle
if [ -f "./gradlew" ]; then
    chmod +x gradlew
    ./gradlew assembleRelease
else
    echo "Gradle wrapper not found, initializing build..."
    gradle assembleRelease || echo "Please ensure full project files are present."
fi