ARCHS = armv7 arm64
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NoSlowAnimations
NoSlowAnimations_FILES = Tweak.xm
NoSlowAnimations_FRAMEWORKS = UIKit
NoSlowAnimations_LDFLAGS += -Wl,-segalign,4000
NoSlowAnimations_CFLAGS += -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += noslowanimationssettings
include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 backboardd"