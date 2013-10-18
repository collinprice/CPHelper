//
//  CPLocationManager.m
//  CPHelper
//
//  Created by Collin Price on 9/17/2013.
//  Copyright (c) 2013 Collin Price. All rights reserved.
//

#import "CPLocationManager.h"
#import "NumberHelper.h"

@implementation CPLocationManager

-(id)init {
    
    self = [super init];
    if (self) {
        
        _locationManager = [[CLLocationManager alloc] init];
    }
    return self;
}

+(CPLocationManager*)sharedInstance {
    static dispatch_once_t pred;
	static CPLocationManager *sharedInstance = nil;
    
	dispatch_once(&pred, ^{ sharedInstance = [[self alloc] init]; });
	return sharedInstance;
}

-(void)clearRegions {
    
    NSArray* regions = [_locationManager.monitoredRegions allObjects];
    for (CLRegion* region in regions) {
        [_locationManager stopMonitoringForRegion:region];
    }
}

-(void)addRegionWithCenter:(CLLocationCoordinate2D)location
                    radius:(CLLocationDegrees)radius
                identifier:(NSString*)identifier {
    
    CLRegion* region;
    if ([CLCircularRegion class]) {
        region = [[CLCircularRegion alloc] initWithCenter:location radius:radius identifier:identifier];
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        region = [[CLRegion alloc] initCircularRegionWithCenter:location radius:radius identifier:identifier];
#pragma clang diagnostic pop
    }
    
    [_locationManager startMonitoringForRegion:region];
}

+(float)distanceBetweenLocation:(CLLocationCoordinate2D)location1 andLocation:(CLLocationCoordinate2D)location2 {
    
    NSInteger R = 6371; // km
    
    float dLat = [NumberHelper degreesToRadians:(location2.latitude - location1.latitude)];
    float dLon = [NumberHelper degreesToRadians:(location2.longitude - location1.longitude)];
    
    float lat1 = [NumberHelper degreesToRadians:location1.latitude];
    float lat2 = [NumberHelper degreesToRadians:location2.latitude];
    
    float a = sin(dLat / 2) * sin(dLat / 2) + sin(dLon / 2) * sin(dLon / 2) * cos(lat1) * cos(lat2);
    float c = 2 * atan2(sqrt(a), sqrt(1 - a));
    
    if (R * c > 9000) {
        NSLog(@"%f, %f", location2.latitude, location2.longitude);
        NSLog(@"%f, %f", location2.latitude, location2.longitude);
    }
    
    return R * c;
}

+(float)latitudeSphericalMercatorToWGS84:(float)y {
    return [NumberHelper radiansToDegrees:( 2 * atan(exp( y / 6378137.0 )) - M_PI_2 )];
}

+(float)longitudeSphericalMercatorToWGS84:(float)x {
    return [NumberHelper radiansToDegrees:(x / 6378137.0)];
}

@end
