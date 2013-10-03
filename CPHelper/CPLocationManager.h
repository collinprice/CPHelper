//
//  CPLocationManager.h
//  CPHelper
//
//  Created by Collin Price on 9/17/2013.
//  Copyright (c) 2013 Collin Price. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface CPLocationManager : NSObject

@property (nonatomic, strong) CLLocationManager* locationManager;

+(CPLocationManager*)sharedInstance;

-(void)clearRegions;
-(void)addRegionWithCenter:(CLLocationCoordinate2D)location
                    radius:(CLLocationDegrees)radius
                identifier:(NSString*)identifier;

+(float)distanceBetweenLocation:(CLLocationCoordinate2D)location1 andLocation:(CLLocationCoordinate2D)location2;

+(float)latitudeSphericalMercatorToWGS84:(float)y;
+(float)longitudeSphericalMercatorToWGS84:(float)x;

@end
