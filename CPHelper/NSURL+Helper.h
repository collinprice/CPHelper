//
//  NSURL+Helper.h
//  CPHelper
//
//  Created by Collin Price on 9/20/2013.
//  Copyright (c) 2013 Collin Price. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (Helper)

-(NSDictionary*)parseQuery;

+(NSURL*)url:(NSString*)url withParams:(NSDictionary*)params;

@end
