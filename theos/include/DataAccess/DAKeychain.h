/**
 * This header is generated by class-dump-z 0.2-1.
 * class-dump-z is Copyright (C) 2009 by KennyTM~, licensed under GPLv3.
 *
 * Source: /System/Library/PrivateFrameworks/DataAccess.framework/DataAccess
 */

#import <Foundation/NSObject.h>


@interface DAKeychain : NSObject {
}
+(id)sharedKeychain;
-(BOOL)saveKeychainInformationsForURL:(id)url andPassword:(id)password;
-(id)loadKeychainInformationsForURL:(id)url;
-(void)removeKeychainInformationsForURL:(id)url;
-(id)guessPasswordForURL:(id)url;
@end
