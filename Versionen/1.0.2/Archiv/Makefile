ARCHS = armv7 arm64
TARGET_IPHONEOS_DEPLOYMENT_VERSION = 7.0
include theos/makefiles/common.mk

TWEAK_NAME = NoSlowAnimations
NoSlowAnimations_FILES = Tweak.xm
NoSlowAnimations_FRAMEWORKS = Foundation

include $(THEOS_MAKE_PATH)/tweak.mk




after-install::
	install.exec "killall -9 SpringBoard"

