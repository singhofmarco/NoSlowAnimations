#import <UIKit/UIKit.h>

static BOOL SCisEnabled = YES; // Default value
static CGFloat Slider = 0.5;
static BOOL firstStart = YES;
static NSString * const PREF_PATH = @"/var/mobile/Library/Preferences/com.marcosinghof.NoSlowAnimationsSettings.plist";

static NSDictionary *preferences;
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
}

%ctor 
{
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)PreferencesChangedCallback, CFSTR("Flipswitch.settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	PreferencesChangedCallback(NULL, NULL, NULL, NULL, NULL);
}

%hook SpringBoard
-(void)applicationDidFinishLaunching:(id)application 
{
	%orig;
	NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:PREF_PATH];
	NSMutableDictionary *mutableDict = dict ? [[dict mutableCopy] autorelease] : [NSMutableDictionary dictionary];
	firstStart = ( [mutableDict objectForKey:@"firstStart"] ? [[mutableDict objectForKey:@"firstStart"] boolValue] : firstStart );
	if(firstStart == YES)
	{
		UIAlertView*theAlert = [[UIAlertView alloc] initWithTitle:@"Thanks for downloading NoSlowAnimations" message:@"To set your custom speed, go to the settings of NoSlowAnimations.\n\nPleas consider to make a donation via the PayPal link in the settings." delegate:self cancelButtonTitle:nil otherButtonTitles:@"Go away", nil];
		[theAlert show];
		[theAlert release];
		[mutableDict setValue:@NO forKey:@"firstStart"];
		[mutableDict writeToFile:PREF_PATH atomically:YES];
	}
}
%end

%hook SBAnimationFactorySettings
-(BOOL)slowAnimations
{
	if(SCisEnabled == YES)
	{
		return true;
	}
	else
	{
		return %orig;
	}

}

-(CGFloat)slowDownFactor
{
	if(SCisEnabled == YES)
	{
		return Slider;
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