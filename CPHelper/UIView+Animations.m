//
//  UIView+Animations.m
//  CPHelper
//
//  Created by Collin on 2013-08-01.
//  Copyright (c) 2013 Collin Price. All rights reserved.
//

#import "UIView+Animations.h"

@implementation UIView (Animations)

-(void)fadeIn {
    
    [self fadeWithDuration:1 toAlpha:1];
}

-(void)fadeInWithDuration:(float)duration {
    
    [self fadeWithDuration:duration toAlpha:1];
}

-(void)fadeOut {
    
    [self fadeWithDuration:1 toAlpha:0];
}

-(void)fadeOutWithDuration:(float)duration {
    
    [self fadeWithDuration:duration toAlpha:0];
}

-(void)fadeWithDuration:(float)duration toAlpha:(float)alpha {
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:duration];
    self.alpha = alpha;
    [UIView commitAnimations];
}

-(void)crossFadeWith:(UIView*)view {
    
    [self crossFadeWith:view withDuration:1 toAlpha:1];
}

-(void)crossFadeWith:(UIView*)view withDuration:(float)duration {
    
    [self crossFadeWith:view withDuration:duration toAlpha:1];
}

-(void)crossFadeWith:(UIView*)view withDuration:(float)duration toAlpha:(float)alpha {
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:duration];
    self.alpha = 0;
    view.alpha = alpha;
    [UIView commitAnimations];
}

@end
