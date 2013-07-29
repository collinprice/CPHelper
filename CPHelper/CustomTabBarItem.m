//
//  CustomTabBarItem.m
//  RiderMel
//
//  Created by Collin on 2013-07-17.
//  Copyright (c) 2013 Niagara Research. All rights reserved.
//

#import "CustomTabBarItem.h"

@implementation CustomTabBarItem

-(id)initWithTitle:(NSString*)title
             image:(UIImage*)image
    viewController:(UIViewController*)viewController {
    
    self = [super init];
    if (self) {
        
        _title = title;
        _image = image;
        _viewController = viewController;
    }
    return self;
}

@end
