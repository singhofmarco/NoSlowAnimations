include theos/makefiles/common.mk

TWEAK_NAME = NoSlowAnimations
NoSlowAnimations_FILES = Tweak.xm
NoSlowAnimations_FRAMEWORKS = UIKit


include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += noslowanimationssettings
SUBPROJECTS += noslowanimations_flipswitch
include $(THEOS_MAKE_PATH)/aggregate.mk
after-install::
	install.exec "killall -9 SpringBoard"

