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

-(NSDictionary*)fileInfo {
    
    int index = [self lastIndexOf:@"."];
    
    if (index == -1) {
        return nil;
    }
    
    return @{ @"base" : [self substringToIndex:index], @"extension" : [self substringFromIndex:index+1]};
}

-(NSString*)onlyNumbers {
    
    NSMutableString *strippedString = [NSMutableString
                                       stringWithCapacity:self.length];
    
    NSScanner *scanner = [NSScanner scannerWithString:self];
    NSCharacterSet *numbers = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    
    while ([scanner isAtEnd] == NO) {
        NSString *buffer;
        if ([scanner scanCharactersFromSet:numbers intoString:&buffer]) {
            [strippedString appendString:buffer];
        } else {
            [scanner setScanLocation:([scanner scanLocation] + 1)];
        }
    }
    
    return strippedString;
}

@end
