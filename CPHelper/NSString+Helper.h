//
//  NSString+Helper.h
//  CPHelper
//
//  Created by Collin on 2013-08-01.
//  Copyright (c) 2013 Collin Price. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Helper)

-(int)lastIndexOf:(NSString*)aString;

-(NSDictionary*)fileInfo;

-(NSString*)onlyNumbers;
-(NSString*)trim;

-(NSString*)truncateTo:(NSInteger)length;
-(NSString*)truncateTo:(NSInteger)length withEllipsis:(BOOL)ellipsis;

@end
