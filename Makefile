ARCHS = armv7 arm64
NoSlowAnimations_LDFLAGS += -Wl,-segalign,4000
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NoSlowAnimations
NoSlowAnimations_FILES = Tweak.xm
NoSlowAnimations_FRAMEWORKS = UIKit


include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += noslowanimationssettings
include $(THEOS_MAKE_PATH)/aggregate.mk
after-install::
	install.exec "killall -9 SpringBoard"

