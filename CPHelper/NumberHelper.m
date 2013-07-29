//
//  NumberHelper.m
//  RiderMel
//
//  Created by Collin on 2013-07-24.
//  Copyright (c) 2013 Niagara Research. All rights reserved.
//

#import "NumberHelper.h"
#include <stdlib.h>

@implementation NumberHelper

+(NSInteger)randomInt:(NSInteger)max {
    
    return arc4random() % max;
}

@end
