#import <Foundation/Foundation.h>


static BOOL SCisEnabled = YES; // Default value
static CGFloat Slider = 0.5;

static void loadPrefs()
{
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.marcosinghof.NoSlowAnimationsSettings.plist"];
    if(prefs)
    {
        SCisEnabled = ( [prefs objectForKey:@"SCisEnabled"] ? [[prefs objectForKey:@"SCisEnabled"] boolValue] : SCisEnabled );
	Slider = ( [prefs objectForKey:@"Slider"] ? [[prefs objectForKey:@"Slider"] floatValue] : Slider );
    }
    [prefs release];
}

%ctor 
{
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.marcosinghof.NoSlowAnimationsSettings/settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
    loadPrefs();
}


%hook SBFAnimationFactorySettings
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


