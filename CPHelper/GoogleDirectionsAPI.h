//
//  GoogleDirectionsAPI.h
//  CPHelper
//
//  Created by Collin Price on 9/25/2013.
//  Copyright (c) 2013 Collin Price. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface GoogleDirectionsAPI : NSObject

+(NSDictionary*)directionsFromOrigin:(NSString*)address1
                       toDestination:(NSString*)address2;

+(NSDictionary*)gpsDirectionsFromOrigin:(CLLocationCoordinate2D)loc1
                          toDestination:(CLLocationCoordinate2D)loc2;

+(void)gpsDirectionsFromOrigin:(CLLocationCoordinate2D)loc1
                          toDestination:(CLLocationCoordinate2D)loc2
                           onCompletion:(void (^)(NSDictionary* directions))completion;

@end
