#import <Preferences/Preferences.h>

#define NSAPreferencePath @"/User/Library/Preferences/com.marcosinghof.NoSlowAnimations.plist"

@interface NoSlowAnimationsSettingsListController : PSListController {
}
@end

@implementation NoSlowAnimationsSettingsListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"NoSlowAnimations" target:self] retain];
	}
	return _specifiers;
}

-(id) bundle {
	return [NSBundle bundleForClass:[self class]];
}

-(id) readPreferenceValue:(PSSpecifier*)specifier {
	NSDictionary *NSASettings = [NSDictionary dictionaryWithContentsOfFile:NSAPreferencePath];
	if (!NSASettings[specifier.properties[@"key"]]) {
		return specifier.properties[@"default"];
	}
	return NSASettings[specifier.properties[@"key"]];
}

-(void) setPreferenceValue:(id)value specifier:(PSSpecifier*)specifier {
	NSMutableDictionary *defaults = [NSMutableDictionary dictionary];
	[defaults addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:NSAPreferencePath]];
	[defaults setObject:value forKey:specifier.properties[@"key"]];
	[defaults writeToFile:NSAPreferencePath atomically:YES];
	CFStringRef NSAPost = (CFStringRef)specifier.properties[@"PostNotification"];
	CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), NSAPost, NULL, NULL, YES);
}

-(void) donate:(id)arg1 {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=WPFPPMW6X9LH8"]];
}

-(void) twitter:(id)arg1 {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://twitter.com/marcosinghof"]];
}

-(void) github:(id)arg1 {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/singhofmarco/NoSlowAnimations"]];
}

-(void) sendEmailTo:(id)arg1 {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:singhofmarco@gmail.com"]];
}
@end