export ARCHS = armv7 arm64
TARGET_IPHONEOS_DEPLOYMENT_VERSION = 7.0
TARGET_IPHONEOS_DEPLOYMENT_VERSION_arm64 = 7.0
SDKVERSION = 7.0

TWEAK_NAME = NoSlowAnimations
NoSlowAnimations_FILES = Tweak.xm
NoSlowAnimations_FRAMEWORKS = Foundation



include theos/makefiles/common.mk
include theos/makefiles/tweak.mk

SUBPROJECTS += noslowanimationssettings
include theos/makefiles/aggregate.mk
after-install::
	install.exec "killall -9 SpringBoard"

