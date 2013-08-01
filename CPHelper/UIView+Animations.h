//
//  UIView+Animations.h
//  CPHelper
//
//  Created by Collin on 2013-08-01.
//  Copyright (c) 2013 Collin Price. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Animations)

-(void)fadeIn;
-(void)fadeInWithDuration:(float)duration;

-(void)fadeOut;
-(void)fadeOutWithDuration:(float)duration;

-(void)fadeWithDuration:(float)duration toAlpha:(float)alpha;

-(void)crossFadeWith:(UIView*)view;
-(void)crossFadeWith:(UIView*)view withDuration:(float)duration;
-(void)crossFadeWith:(UIView*)view withDuration:(float)duration toAlpha:(float)alpha;

@end
