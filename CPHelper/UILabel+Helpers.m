//
//  UILabel+Helpers.m
//  RiderMel
//
//  Created by Collin on 2013-07-18.
//  Copyright (c) 2013 Niagara Research. All rights reserved.
//

#import "UILabel+Helpers.h"

#import <QuartzCore/QuartzCore.h>

@implementation UILabel (Helpers)

-(void)addTextShadow {
    
    self.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.layer.shadowOffset = CGSizeMake(0.8, 0.8);
    self.layer.shadowRadius = 0.2;
    self.layer.shadowOpacity = 1.0;
}

@end
