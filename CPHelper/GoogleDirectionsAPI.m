//
//  GoogleDirectionsAPI.m
//  CPHelper
//
//  Created by Collin Price on 9/25/2013.
//  Copyright (c) 2013 Collin Price. All rights reserved.
//

#import "GoogleDirectionsAPI.h"
#import "NSURL+Helper.h"
#import "IOHelper.h"

@implementation GoogleDirectionsAPI

static NSString* googleDirectionURL = @"http://maps.googleapis.com/maps/api/directions/json";

+(NSDictionary*)directionsFromOrigin:(NSString*)address1
                       toDestination:(NSString*)address2 {
    
    NSDictionary* params = @{
                             @"origin" : address1,
                             @"destination" : address2,
                             @"sensor" : @"false"
                             };
    
    NSURL* url = [NSURL url:googleDirectionURL withParams:params];

    return [IOHelper requestJSONDictionary:url];
}

+(NSDictionary*)gpsDirectionsFromOrigin:(CLLocationCoordinate2D)loc1
                          toDestination:(CLLocationCoordinate2D)loc2 {
    
    NSDictionary* params = @{
                             @"origin" : [NSString stringWithFormat:@"%f,%f", loc1.latitude, loc1.longitude],
                             @"destination" : [NSString stringWithFormat:@"%f,%f", loc2.latitude, loc2.longitude],
                             @"sensor" : @"false"
                             };
    
    NSURL* url = [NSURL url:googleDirectionURL withParams:params];

    return [IOHelper requestJSONDictionary:url];
}

@end
