//
//  UIImageView+animatedGIF.m
//  CPHelper
//
//  Created by Collin on 2013-08-01.
//  Copyright (c) 2013 Collin Price. All rights reserved.
//

#import "UIImageView+animatedGIF.h"
#import "UIImage+animatedGIF.h"
#import "NSString+Helper.h"

@implementation UIImageView (animatedGIF)

+(UIImageView*)animatedView:(NSString*)imageName {
    
    int index = [imageName lastIndexOf:@"."];
    
    if (index == -1) {
        return nil;
    }
    
    NSDictionary* fileinfo = [imageName fileInfo];
    
    if (fileinfo) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:fileinfo[@"base"] withExtension:fileinfo[@"extension"]];
        return [[UIImageView alloc] initWithImage:[UIImage animatedImageWithAnimatedGIFURL:url]];
    } else {
        return nil;
    }
}

@end
