// FRAMWEORKS
#import <Foundation/Foundation.h>
#import <SpringBoard/SpringBoard.h>

%hook SBFAnimationFactorySettings
-(BOOL)slowAnimations
{
return true;
}
-(float)slowDownFactor
{
return 0.5;
}

%end

%hook SBFadeAnimationSettings
-(float)backlightFadeDuration
{
return 0.2;
}
%end
