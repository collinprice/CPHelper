//
//  UIView+Manipulate.m
//  CPHelper
//
//  Created by Collin on 2013-08-06.
//  Copyright (c) 2013 Collin Price. All rights reserved.
//

#import "UIView+Manipulate.h"
#import <QuartzCore/QuartzCore.h>

#define DegreesToRadians(x) ((x) * M_PI / 180.0)

@implementation UIView (Manipulate)

-(void)roundCorners:(UIRectCorner)corners withRadius:(float)radius {
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:corners
                                                         cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

-(void)rotate:(float)degrees {
    
    self.transform = CGAffineTransformMakeRotation(DegreesToRadians(degrees));
}

@end
