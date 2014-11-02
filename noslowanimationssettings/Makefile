export ARCHS = armv7 arm64
TARGET_IPHONEOS_DEPLOYMENT_VERSION = 8.1
TARGET_IPHONEOS_DEPLOYMENT_VERSION_arm64 = 8.1
SDKVERSION = 8.1


include theos/makefiles/common.mk

BUNDLE_NAME = NoSlowAnimationsSettings
NoSlowAnimationsSettings_FILES = NoSlowAnimationsSettings.mm
NoSlowAnimationsSettings_INSTALL_PATH = /Library/PreferenceBundles
NoSlowAnimationsSettings_FRAMEWORKS = UIKit
NoSlowAnimationsSettings_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/NoSlowAnimationsSettings.plist$(ECHO_END)
