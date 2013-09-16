//
//  IOHelper.h
//  CPHelper
//
//  Created by Collin on 2013-08-02.
//  Copyright (c) 2013 Collin Price. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IOHelper : NSObject

+(NSArray*)readJSONArray:(NSString*)filename;
+(NSDictionary*)readJSONDictionary:(NSString*)filename;

@end
