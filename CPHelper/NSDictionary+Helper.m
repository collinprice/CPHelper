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
    
    return [NSString stringWithFormat:@"%@", [self objectForKey:key]];
}

@end
