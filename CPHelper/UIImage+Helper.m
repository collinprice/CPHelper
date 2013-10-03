//
//  UIImage+Helper.m
//  CPHelper
//
//  Created by Collin on 2013-09-05.
//  Copyright (c) 2013 Collin Price. All rights reserved.
//

#import "UIImage+Helper.h"

@implementation UIImage (Helper)

typedef enum {
    ALPHA = 0,
    BLUE = 1,
    GREEN = 2,
    RED = 3
} PIXELS;

- (UIImage *)convertToGrayscaleWithAlpha:(float)alpha {
    CGFloat scale = [[UIScreen mainScreen] scale];
    
    CGSize size = [self size];
    int width = size.width *scale;
    int height = size.height *scale;
    
    // the pixels will be painted to this array
    uint32_t *pixels = (uint32_t *) malloc(width * height * sizeof(uint32_t));
    
    // clear the pixels so any transparency is preserved
    memset(pixels, 0, width * height * sizeof(uint32_t));
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    // create a context with RGBA pixels
    CGContextRef context = CGBitmapContextCreate(pixels, width, height, 8, width * sizeof(uint32_t), colorSpace,
                                                 kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedLast);
    
    CGContextSetAlpha(context, alpha);
    
    // paint the bitmap to our context which will fill in the pixels array
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), [self CGImage]);
    
    for(int y = 0; y < height; y++) {
        for(int x = 0; x < width; x++) {
            uint8_t *rgbaPixel = (uint8_t *) &pixels[y * width + x];
            
            // convert to grayscale using recommended method: http://en.wikipedia.org/wiki/Grayscale#Converting_color_to_grayscale
            uint32_t gray = 0.299 * rgbaPixel[RED] + 0.587 * rgbaPixel[GREEN] + 0.114 * rgbaPixel[BLUE];
            
            // set the pixels to gray
            rgbaPixel[RED] = gray;
            rgbaPixel[GREEN] = gray;
            rgbaPixel[BLUE] = gray;
        }
    }
    
    // create a new CGImageRef from our context with the modified pixels
    CGImageRef image = CGBitmapContextCreateImage(context);
    
    // we're done with the context, color space, and pixels
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    free(pixels);
    
    // make a new UIImage to return
    UIImage *resultUIImage = [UIImage imageWithCGImage:image scale:scale orientation:UIImageOrientationUp];
    
    // we're done with image now too
    CGImageRelease(image);
    
    
    return resultUIImage;
}

-(UIImage*)convertToGrayscale {
    return [self convertToGrayscaleWithAlpha:1.0];
}

+(UIImage*)fromDocumentDirectory:(NSString*)filename {
    
    NSString* documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [UIImage imageWithContentsOfFile:[documentDirectory stringByAppendingString:filename]];
}

+(UIImage*)imageFromURL:(NSString*)url {
    
    NSData* imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]]];
    return imageData ? [UIImage imageWithData: imageData] : nil;

}

-(UIImage*)scaleToSize:(CGSize)newSize {

    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

-(UIImage*)scaleByFactor:(float)factor {
    
    CGSize newSize = CGSizeMake(self.size.width*factor, self.size.height*factor);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
