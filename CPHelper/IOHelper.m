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

+(NSArray*)requestJSONArray:(NSURL*)url {
    
    return [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfURL:url]
                                           options:kNilOptions
                                             error:nil];
}

+(NSDictionary*)requestJSONDictionary:(NSURL*)url {
    
    return [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfURL:url]
                                           options:kNilOptions
                                             error:nil];
}

+(void)requestJSONDictionary:(NSURL*)url withBlock:(void (^)(NSDictionary* json))block {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        
        NSDictionary* data = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfURL:url]
                                        options:kNilOptions
                                          error:nil];
        block(data);
    });
}

+(NSString*)documentPath {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

+(void)saveToDisk:(NSString*)filename {
    
     [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:filename];
}

@end
