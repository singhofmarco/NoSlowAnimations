#import <UIKit/UIKit.h>

#define NSLog(LogContents, ...) NSLog((@"NoSlowAnimations: %s:%d " LogContents), __FUNCTION__, __LINE__, ##__VA_ARGS__)
#define NSAPreferencePath @"/User/Library/Preferences/com.marcosinghof.NoSlowAnimations.plist"

#ifndef kCFCoreFoundationVersionNumber_iOS_9_0
#define kCFCoreFoundationVersionNumber_iOS_9_0 1240.10
#endif

const double minimumHudSpeed = 0.15;

static BOOL SCisEnabled = YES;
static CGFloat Slider = 0.5;
static BOOL applyOnHUD = YES;


static void initPrefs() {
	NSDictionary *NSASettings = [NSDictionary dictionaryWithContentsOfFile:NSAPreferencePath];
	SCisEnabled = ([NSASettings objectForKey:@"SCisEnabled"] ? [[NSASettings objectForKey:@"SCisEnabled"] boolValue] : SCisEnabled);
	applyOnHUD = ([NSASettings objectForKey:@"applyOnHUD"] ? [[NSASettings objectForKey:@"applyOnHUD"] boolValue] : applyOnHUD);
	Slider = ([NSASettings objectForKey:@"Slider"] ? [[NSASettings objectForKey:@"Slider"] floatValue] : Slider);
}

%group iOS9Hook
%hook SBAnimationFactorySettings
-(BOOL) slowAnimations {
	return SCisEnabled;
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
	return SCisEnabled;
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
//Fix for flashing Lockscreen and also faster lock und unlock!
-(CGFloat) backlightFadeDuration {
	if (SCisEnabled) {
		if (Slider <= 0.30) 
		{
			return 0.1;
		} 
		else if (Slider <= 0.10) 
		{
			return 0.0;
		}
		else 
		{
			if(Slider < 0.80)
			{
				return Slider;
			}
			else
			{
				return 0.80;
			}
		}
	} 
	else 
	{
		return %orig();
	}
}
%end

%hook SBHUDController
-(void)presentHUDView:(id)arg1 autoDismissWithDelay:(double)arg2
{
	if(SCisEnabled && applyOnHUD)
	{
		//Workaround to set the minimum Speed of HUDs
		//Should be readable!
		if(Slider < minimumHudSpeed)
		{
			%orig(arg1, arg2 * minimumHudSpeed);
		}
		else
		{
			%orig(arg1, arg2 * Slider);
		}
	}
	else
	{
		%orig(arg1, arg2);
	}
}
%end

%ctor {
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)initPrefs, CFSTR("com.marcosinghof.NoSlowAnimations/settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
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