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

+(BOOL)randomBOOL {
    return [NumberHelper randomInt:2] == 1;
}

+(float)degreesToRadians:(float)degrees {
    return degrees * (M_PI / 180);
}

+(float)radiansToDegrees:(float)radians {
    return radians * (180 / M_PI);
}


@end
