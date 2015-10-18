#import <Preferences/Preferences.h>

@interface NoSlowAnimationsSettingsListController: PSListController {
}
@end

@implementation NoSlowAnimationsSettingsListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"NoSlowAnimationsSettings" target:self] retain];
	}
	return _specifiers;
}

-(void) donate: (id)arg1 {
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=WPFPPMW6X9LH8"]];
}

-(void)twitter:(id)arg1 {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://twitter.com/marcosinghof"]];
    
}

-(void)github:(id)arg1 {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://github.com/singhofmarco/NoSlowAnimations"]];
    
}

-(void)respring:(id)arg1 {
system("killall SpringBoard");
    
}

-(void) sendEmailTo: (id)arg1 {
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:singhofmarco@gmail.com"]];
}



@end

// vim:ft=objc
