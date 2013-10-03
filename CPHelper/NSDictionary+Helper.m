//
//  NSDictionary+Helper.m
//  CPHelper
//
//  Created by Collin Price on 9/15/2013.
//  Copyright (c) 2013 Collin Price. All rights reserved.
//

#import "NSDictionary+Helper.h"

@implementation NSDictionary (Helper)

-(NSString*)stringFromKey:(NSString*)key {

    NSString* temp = [NSString stringWithFormat:@"%@", [self objectForKey:key]];
    return [temp isEqualToString:@"<null>"] ? nil : temp;
}

-(NSNumber*)intFromKey:(NSString*)key {

    NSString* temp = [NSString stringWithFormat:@"%@", [self objectForKey:key]];
    return [temp isEqualToString:@"<null>"] ? nil : [NSNumber numberWithInteger:[temp integerValue]];
}

-(NSNumber*)doubleFromKey:(NSString*)key {
    
    NSString* temp = [NSString stringWithFormat:@"%@", [self objectForKey:key]];
    return [temp isEqualToString:@"<null>"] ? nil : [NSNumber numberWithDouble:[temp doubleValue]];
}

@end
