//
//  BundleHelper.m
//  CPHelper
//
//  Created by Collin on 2013-08-02.
//  Copyright (c) 2013 Collin Price. All rights reserved.
//

#import "BundleHelper.h"

@implementation BundleHelper

+(NSString*)bundleName {
    
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"];
}

@end
