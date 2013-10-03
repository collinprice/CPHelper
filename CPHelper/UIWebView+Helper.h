//
//  UIWebView+Helper.h
//  CPHelper
//
//  Created by Collin on 2013-08-29.
//  Copyright (c) 2013 Collin Price. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (Helper)

+(UIWebView*)fromFile:(NSString*)filename;

-(void)loadFromFile:(NSString*)filename;
-(float)contentHeight;

@end
