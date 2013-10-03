//
//  UIImage+Helper.h
//  CPHelper
//
//  Created by Collin on 2013-09-05.
//  Copyright (c) 2013 Collin Price. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Helper)

-(UIImage*)convertToGrayscale;
-(UIImage*)convertToGrayscaleWithAlpha:(float)alpha;

+(UIImage*)fromDocumentDirectory:(NSString*)filename;
+(UIImage*)imageFromURL:(NSString*)url;


-(UIImage*)scaleToSize:(CGSize)newSize;
-(UIImage*)scaleByFactor:(float)factor;

@end
