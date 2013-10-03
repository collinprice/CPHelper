//
//  NSURL+Helper.m
//  CPHelper
//
//  Created by Collin Price on 9/20/2013.
//  Copyright (c) 2013 Collin Price. All rights reserved.
//

#import "NSURL+Helper.h"

@implementation NSURL (Helper)

-(NSDictionary*)parseQuery {
    
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionary];
    
    NSArray* parts = [self.query componentsSeparatedByString:@"&"];
    for (NSString* part in parts) {
        NSArray* fragments = [part componentsSeparatedByString:@"="];
        if (fragments.count == 2) {
            dictionary[fragments[0]] = fragments[1];
        }
    }
    
    return dictionary;
}

+(NSURL*)url:(NSString*)url withParams:(NSDictionary*)params {
    
    NSMutableString* newURL = [[NSMutableString alloc] initWithString:url];
    [newURL appendString:@"?"];
    
    [params enumerateKeysAndObjectsUsingBlock:^(NSString* key, NSString* value, BOOL* stop) {
        [newURL appendFormat:@"%@=%@&", key, [value stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
    }];
    
    return [NSURL URLWithString:newURL];
}

@end
