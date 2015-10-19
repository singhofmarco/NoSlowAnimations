THEOS_PACKAGE_DIR_NAME = debs
TARGET =: clang
ARCHS = armv7 armv7s arm64
DEBUG = 0
GO_EASY_ON_ME = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NoSlowAnimations

NoSlowAnimations_FILES = Tweak.xm
NoSlowAnimations_FRAMEWORKS = UIKit
NoSlowAnimations_LDFLAGS += -Wl,-segalign,4000
NoSlowAnimations_CFLAGS += -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += NoSlowAnimationsSettings

include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 backboardd"