//
//  CustomSegmentedControl.h
//  RiderMel
//
//  Created by Collin on 2013-07-17.
//  Copyright (c) 2013 Niagara Research. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomSegmentedControl : UISegmentedControl

- (id)initWithItems:(NSArray *)items
 selectedBackground:(UIImage*)selectedBg
   normalBackground:(UIImage*)normalBg
       noneSelected:(UIImage*)noDivider
       leftSelected:(UIImage*)leftDivider
      rightSelected:(UIImage*)rightDivider;

@end
