//
//  CustomSegmentedControl.m
//  RiderMel
//
//  Created by Collin on 2013-07-17.
//  Copyright (c) 2013 Niagara Research. All rights reserved.
//

#import "CustomSegmentedControl.h"

@implementation CustomSegmentedControl

- (id)initWithItems:(NSArray *)items
 selectedBackground:(UIImage*)selectedBg
   normalBackground:(UIImage*)normalBg
       noneSelected:(UIImage*)noDivider
       leftSelected:(UIImage*)leftDivider
      rightSelected:(UIImage*)rightDivider {
    
    self = [super initWithItems:items];
    if (self) {
        
        // Set divider images
        [self setDividerImage:noDivider
          forLeftSegmentState:UIControlStateNormal
            rightSegmentState:UIControlStateNormal
                   barMetrics:UIBarMetricsDefault];
        [self setDividerImage:leftDivider
          forLeftSegmentState:UIControlStateSelected
            rightSegmentState:UIControlStateNormal
                   barMetrics:UIBarMetricsDefault];
        [self setDividerImage:rightDivider
          forLeftSegmentState:UIControlStateNormal
            rightSegmentState:UIControlStateSelected
                   barMetrics:UIBarMetricsDefault];
        
        // Set background images
        [self setBackgroundImage:normalBg
                        forState:UIControlStateNormal
                      barMetrics:UIBarMetricsDefault];
        
        [self setBackgroundImage:selectedBg
                        forState:UIControlStateSelected
                      barMetrics:UIBarMetricsDefault];
    }
    return self;
}

@end
