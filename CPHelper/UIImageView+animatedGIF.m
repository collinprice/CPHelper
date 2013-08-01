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
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:[imageName substringToIndex:index] withExtension:[imageName substringFromIndex:index+1]];
    return [[UIImageView alloc] initWithImage:[UIImage animatedImageWithAnimatedGIFURL:url]];
}

@end
