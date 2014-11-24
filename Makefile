APP_NAME=long-dream
PACKAGE=com.kt3k.app.ld
ACTIVITY=$(PACKAGE).BaseActivity
CORE_DIR=$(APP_NAME)-core

.PHONY: assets build clean debug-install device-launch-app device-logcat

device-debug: build debug-install device-launch-app device-logcat
	@echo

assets:
	cd bower_components/$(CORE_DIR) ; bundle install ; bundle exec middleman build

build:
	./gradlew build

clean:
	./gradlew clean

debug-install:
	adb install -r build/outputs/apk/$(APP_NAME)-android-debug-unaligned.apk

device-launch-app:
	adb shell am start -n $(PACKAGE)/$(ACTIVITY)

device-logcat:
	adb logcat *:E

bower_components:
	bower install
