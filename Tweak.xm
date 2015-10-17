#import <UIKit/UIKit.h>

static BOOL SCisEnabled
static CGFloat Slider;
static NSDictionary *preferences;
#ifndef kCFCoreFoundationVersionNumber_iOS_9_0
#define kCFCoreFoundationVersionNumber_iOS_9_0 1240.10
#endif

static void PreferencesChangedCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) 
{
	[preferences release];
	CFStringRef appID = CFSTR("com.marcosinghof.NoSlowAnimationsSettings");
	CFArrayRef keyList = CFPreferencesCopyKeyList(appID, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
	if (!keyList) {
		//NSLog(@"There's been an error getting the key list!");
		return;
	}
	preferences = (NSDictionary *)CFPreferencesCopyMultiple(keyList, appID, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
	if (!preferences) {
		//NSLog(@"There's been an error getting the preferences dictionary!");
	}
	CFRelease(keyList);
	SCisEnabled = ( [preferences objectForKey:@"SCisEnabled"] ? [[preferences objectForKey:@"SCisEnabled"] boolValue] : SCisEnabled );
	Slider = ( [preferences objectForKey:@"Slider"] ? [[preferences objectForKey:@"Slider"] floatValue] : Slider );
}

%ctor 
{
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)PreferencesChangedCallback, CFSTR("com.marcosinghof.NoSlowAnimationsSettings/settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	PreferencesChangedCallback(NULL, NULL, NULL, NULL, NULL);

	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)PreferencesChangedCallback, CFSTR("Flipswitch.settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	PreferencesChangedCallback(NULL, NULL, NULL, NULL, NULL);
	
	CFPreferencesAppSynchronize(CFSTR("com.marcosinghof.NoSlowAnimationsSettings"));
}



%hook SBAnimationFactorySettings
	(BOOL)slowAnimations
	{
		if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_9_0) {


		if(SCisEnabled == YES)
		{
			return true;
		}
		else
		{
			return %orig;
		}
	}
	else
	{
		return %orig;
	}
	}

	-(CGFloat)slowDownFactor
	{
	if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_9_0) {

		if(SCisEnabled == YES)
		{
			return Slider;
		}
		else
		{
			return %orig;
		}
	}
	else
	{
		return %orig;
	}
	}


	%end



%hook SBFAnimationFactorySettings
	-(BOOL)slowAnimations
	{
	if (kCFCoreFoundationVersionNumber < kCFCoreFoundationVersionNumber_iOS_9_0) {

		if(SCisEnabled == YES)
		{
			return true;
		}
		else
		{
			return %orig;
		}
	}
	else
	{
		return %orig;
	}

	}

	-(CGFloat)slowDownFactor
	{
		if (kCFCoreFoundationVersionNumber < kCFCoreFoundationVersionNumber_iOS_9_0) {

			if(SCisEnabled == YES)
			{
				return Slider;
			}
			else
			{
				return %orig;
			}
		}
		else
		{
			return %orig;
	}
	}
%end


%hook SBFadeAnimationSettings
	-(CGFloat)backlightFadeDuration
	{
		if(SCisEnabled == YES)
		{
			if(Slider <= 0.30)
			{
				if(Slider <= 0.10)
				{
					return 0.0;
				}
				else
				{
					return 0.1;
				}
			}
			else
			{
				return 0.2;
			}
		}
		else
		{
			return %orig;
		}
}
%end
