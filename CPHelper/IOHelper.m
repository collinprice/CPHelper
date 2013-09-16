//
//  IOHelper.m
//  CPHelper
//
//  Created by Collin on 2013-08-02.
//  Copyright (c) 2013 Collin Price. All rights reserved.
//

#import "IOHelper.h"
#import "NSString+Helper.h"

@implementation IOHelper

+(NSArray*)readJSONArray:(NSString*)filename {

    NSDictionary* fileInfo = [filename fileInfo];
    
    NSError* err = nil;
    NSString* dataPath = [[NSBundle mainBundle] pathForResource:fileInfo[@"base"] ofType:fileInfo[@"extension"]];
    NSArray* datas = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:dataPath]
                                                     options:kNilOptions
                                                       error:&err];
    
    if (err) {
        NSLog(@"IOHelper Error: %@", err.description);
        return nil;
    } else {
        return datas;
    }
}

+(NSDictionary*)readJSONDictionary:(NSString*)filename {
    
    NSDictionary* fileInfo = [filename fileInfo];
    
    NSError* err = nil;
    NSString* dataPath = [[NSBundle mainBundle] pathForResource:fileInfo[@"base"] ofType:fileInfo[@"extension"]];
    NSDictionary* datas = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:dataPath]
                                                     options:kNilOptions
                                                       error:&err];
    
    if (err) {
        return nil;
    } else {
        return datas;
    }
}

@end
