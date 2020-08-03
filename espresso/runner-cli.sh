#!/bin/sh

java -jar ../runner.jar espresso \
 --apikey $DEMO_ACCESS_KEY \
 --app 1 \
 --test app/build/outputs/apk/androidTest/debug/app-debug-androidTest.apk \
 --datacenter US \
 --e annotation com.saucelabs.app.ArunAnnotation &

java -jar ../runner.jar espresso \
 --apikey $DEMO_ACCESS_KEY \
 --app 1 \
 --test app/build/outputs/apk/androidTest/debug/app-debug-androidTest.apk \
 --e annotation com.saucelabs.app.Arun2Annotation \
 --datacenter US &

