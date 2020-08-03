#!/bin/sh

java -jar ../runner.jar xcuitest \
 --apikey $DEMO_ACCESS_KEY \
 --app 1 \
 --test app/build/outputs/apk/androidTest/debug/app-debug-androidTest.apk \
 --datacenter US 

