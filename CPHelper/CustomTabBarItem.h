//
//  CustomTabBarItem.h
//  RiderMel
//
//  Created by Collin on 2013-07-17.
//  Copyright (c) 2013 Niagara Research. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CustomTabBarItem : NSObject

-(id)initWithTitle:(NSString*)title
             image:(UIImage*)image
    viewController:(UIViewController*)viewController;

@property (readonly) NSString* title;
@property (readonly) UIImage* image;
@property (readonly) UIViewController* viewController;

@end
