#import "FSSwitchDataSource.h"
#import "FSSwitchPanel.h"
#import <notify.h>

static NSString * const kSwitchKey = @"SCisEnabled";
static void FSDataSwitchStatusDidChange(void);


@interface NoSlowAnimations_FlipSwitchSwitch : NSObject <FSSwitchDataSource>
@end


	static NSDictionary *preferences;
static void PreferencesChangedCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
	[preferences release];
	CFStringRef appID = CFSTR("com.marcosinghof.NoSlowAnimationsSettings");
	CFArrayRef keyList = CFPreferencesCopyKeyList(appID, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
	if (!keyList) {
		NSLog(@"There's been an error getting the key list!");
		return;
	}
	preferences = (NSDictionary *)CFPreferencesCopyMultiple(keyList, appID, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
	if (!preferences) {
		NSLog(@"There's been an error getting the preferences dictionary!");
	}
	CFRelease(keyList);
	
	
	
}



%ctor 
{
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)PreferencesChangedCallback, CFSTR("com.marcosinghof.NoSlowAnimationsSettings/settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	    PreferencesChangedCallback(NULL, NULL, NULL, NULL, NULL);
	}

%ctor 
{
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)FSDataSwitchStatusDidChange, CFSTR("com.marcosinghof.NoSlowAnimationsSettings/settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
}





@implementation NoSlowAnimations_FlipSwitchSwitch



- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier
{
    id existEnable = [preferences objectForKey:kSwitchKey];
    BOOL isEnabled = existEnable ? [existEnable boolValue] : YES;
    return isEnabled ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier
{
	

    switch (newState) {
        case FSSwitchStateIndeterminate:
            return;
        case FSSwitchStateOn:
		
		CFPreferencesSetValue(CFSTR("SCisEnabled"), kCFBooleanTrue, CFSTR("com.marcosinghof.NoSlowAnimationsSettings"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost);

            break;
        case FSSwitchStateOff:
		CFPreferencesSetValue(CFSTR("SCisEnabled"), kCFBooleanFalse, CFSTR("com.marcosinghof.NoSlowAnimationsSettings"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
            break;
    }

    notify_post("Flipswitch.settingschanged");
	 notify_post("com.marcosinghof.NoSlowAnimationsSettings/settingschanged");
}

@end

static void FSDataSwitchStatusDidChange(void)
{
    [[FSSwitchPanel sharedPanel] stateDidChangeForSwitchIdentifier:[NSBundle bundleForClass:[NoSlowAnimations_FlipSwitchSwitch class]].bundleIdentifier];
}