//
//  UIView+Manipulate.h
//  CPHelper
//
//  Created by Collin on 2013-08-06.
//  Copyright (c) 2013 Collin Price. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Manipulate)

-(void)roundCorners:(UIRectCorner)corners withRadius:(float)radius;

-(void)rotate:(float)degrees;

@end
