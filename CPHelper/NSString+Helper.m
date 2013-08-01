//
//  NSString+Helper.m
//  CPHelper
//
//  Created by Collin on 2013-08-01.
//  Copyright (c) 2013 Collin Price. All rights reserved.
//

#import "NSString+Helper.h"

@implementation NSString (Helper)

-(int)lastIndexOf:(NSString*)aString {
    
    NSRange range = [self rangeOfString:aString options:NSBackwardsSearch];
    
    if (range.location != NSNotFound) {
        return range.location;
    } else {
        return -1;
    }
}

@end
