/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import "NSObject.h"

@class NSMutableDictionary;

@interface SBLockOverlayStylePropertiesFactory : NSObject
{
    NSMutableDictionary *_deviceQualityToProperties;
    unsigned int _style;
}

+ (id)overlayPropertiesFactoryWithStyle:(unsigned int)arg1;
@property(readonly, nonatomic) unsigned int style; // @synthesize style=_style;
- (id)_fetchAndCachePropsForDeviceQuality:(int)arg1;
- (id)propertiesWithGraphicsQuality:(int)arg1;
- (id)propertiesWithDeviceDefaultGraphicsQuality;
- (void)dealloc;
- (id)initWithStyle:(unsigned int)arg1;

@end
