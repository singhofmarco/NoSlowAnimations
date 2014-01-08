/**
 * This header is generated by class-dump-z 0.1-11o.
 * class-dump-z is Copyright (C) 2009 by KennyTM~, licensed under GPLv3.
 */

#import "UIKit-Structs.h"
#import <UIKit/UIView.h>

@class NSMutableArray;

@interface UICompositeImageView : UIView {
	NSMutableArray* m_images;
}
-(id)initWithFrame:(CGRect)frame;
-(void)dealloc;
-(void)addImage:(id)image;
-(void)addImage:(id)image operation:(int)operation fraction:(float)fraction;
-(void)addImage:(id)image toRect:(CGRect)rect fromRect:(CGRect)rect3;
-(void)addImage:(id)image toRect:(CGRect)rect fromRect:(CGRect)rect3 operation:(int)operation fraction:(float)fraction;
-(void)removeAllImages;
-(void)drawRect:(CGRect)rect;
@end
