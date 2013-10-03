//
//  UIView+Spinner.m
//  CPHelper
//
//  Created by Collin Price on 9/18/2013.
//  Copyright (c) 2013 Collin Price. All rights reserved.
//

#import "UIView+Spinner.h"
#import "UIView+CommonLayout.h"

NSInteger const spinnerViewTag = 763568;

@implementation UIView (Spinner)


-(void)startSpinning {
    
    UIActivityIndicatorView* activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityView.tag = spinnerViewTag;
    [activityView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:activityView];
    
    [self addCenterXConstraint:activityView];
    [self addCenterYConstraint:activityView];
    
    [activityView startSpinning];
}

-(void)stopSpinning {
    
    UIActivityIndicatorView* activityView = (UIActivityIndicatorView*)[self viewWithTag:spinnerViewTag];
    
    [activityView stopSpinning];
    [activityView removeFromSuperview];
}


@end
