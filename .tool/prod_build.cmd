#!/bin/bash
cd android
./gradlew clean
cd ..
flutter clean
flutter build appbundle --obfuscate --split-debug-info=/museum_tour/split-debug
flutter build apk --obfuscate --split-debug-info=/museum_tour/split-debug