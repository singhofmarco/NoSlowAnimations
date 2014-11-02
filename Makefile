export ARCHS = armv7 arm64
TARGET_IPHONEOS_DEPLOYMENT_VERSION = 8.1
TARGET_IPHONEOS_DEPLOYMENT_VERSION_arm64 = 8.1
SDKVERSION = 8.1

TWEAK_NAME = NoSlowAnimations
NoSlowAnimations_FILES = Tweak.xm
NoSlowAnimations_FRAMEWORKS = Foundation, UIKit



include theos/makefiles/common.mk
include theos/makefiles/tweak.mk

SUBPROJECTS += noslowanimationssettings
SUBPROJECTS += noslowanimations_flipswitch
include theos/makefiles/aggregate.mk
after-install::
	install.exec "killall -9 SpringBoard"

