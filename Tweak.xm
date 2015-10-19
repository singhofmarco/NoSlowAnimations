#import <UIKit/UIKit.h>

#define NSLog(LogContents, ...) NSLog((@"NoSlowAnimations: %s:%d " LogContents), __FUNCTION__, __LINE__, ##__VA_ARGS__)
#define NSAPreferencePath @"/User/Library/Preferences/com.marcosinghof.NoSlowAnimationsSettings.plist"

#ifndef kCFCoreFoundationVersionNumber_iOS_9_0
#define kCFCoreFoundationVersionNumber_iOS_9_0 1240.10
#endif


static BOOL SCisEnabled;
static CGFloat Slider;


static void initPrefs() {
	NSDictionary *NSASettings = [NSDictionary dictionaryWithContentsOfFile:NSAPreferencePath];
	SCisEnabled = ([NSASettings objectForKey:@"SCisEnabled"] ? [[NSASettings objectForKey:@"SCisEnabled"] boolValue] : SCisEnabled);
	Slider = ([NSASettings objectForKey:@"Slider"] ? [[NSASettings objectForKey:@"Slider"] floatValue] : Slider);
}

%group iOS9Hook
%hook SBAnimationFactorySettings
-(BOOL) slowAnimations {
	if (SCisEnabled) {
		return 1;
	} else {
		return %orig();
	}
}
-(CGFloat) slowDownFactor {
	if (SCisEnabled) {
		return Slider;
	} else {
		return %orig();
	}
}
%end
%end

%group iOS78Hook
%hook SBFAnimationFactorySettings


-(BOOL) slowAnimations {
	if (SCisEnabled) {
		return 1;
	} else {
		return %orig();

	}
}

-(CGFloat) slowDownFactor {
	if (SCisEnabled) {
		return Slider;
	} else {
		return %orig();
	}

}
%end
%end

%hook SBFadeAnimationSettings
-(CGFloat) backlightFadeDuration {
	if (SCisEnabled) {
		if (Slider <= 0.30) {
			if (Slider <= 0.10) {
				return 0.0;
			} else {
				return 0.1;
			}
		} else {
			return 0.2;
		}
	} else {
		return %orig();
	}
}
%end

%ctor {
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)initPrefs, CFSTR("com.marcosinghof.NoSlowAnimationsSettings/settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	initPrefs();
	if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_9_0) {
		NSLog(@"CoreFoundation %f detected, appears to be iOS 9 or higher.", kCFCoreFoundationVersionNumber);
		%init(iOS9Hook);
	} else {
		NSLog(@"CoreFoundation %f detected, appears to be iOS 7/8.", kCFCoreFoundationVersionNumber);
		%init(iOS78Hook);
	}
	%init();
}