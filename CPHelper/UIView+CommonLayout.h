//
//  UIView+CommonLayout.h
//  RiderMel
//
//  Created by Collin on 2013-07-12.
//  Copyright (c) 2013 Niagara Research. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CommonLayout)

-(void)addBothFillConstraints:(UIView*)view;

-(void)addHorizontalFillConstraints:(UIView*)view;
-(void)addHorizontalFillConstraints:(UIView*)view withPadding:(NSInteger)padding;
-(void)addMultipleHorizontalFillConstraints:(NSArray*)views;

-(void)addVerticalFillConstraints:(UIView*)view;
-(void)addVerticalFillConstraints:(UIView*)view withPadding:(NSInteger)padding;
-(void)addMultipleVerticalFillConstraints:(NSArray*)views;

-(void)addEvenHorizontalConstraints:(NSArray*)views;

-(void)addCenterXConstraint:(UIView*)view;
-(void)addCenterYConstraint:(UIView*)view;

-(void)addAlignTopConstraint:(UIView*)view;
-(void)addAlignTopConstraint:(UIView*)view withPadding:(NSInteger)padding;

-(void)addAlignBottomConstraint:(UIView*)view;
-(void)addAlignBottomConstraint:(UIView*)view withPadding:(NSInteger)padding;

-(void)addAlignLeftConstraint:(UIView*)view;
-(void)addAlignLeftConstraint:(UIView*)view withPadding:(NSInteger)padding;

-(void)addAlignRightConstraint:(UIView*)view;
-(void)addAlignRightConstraint:(UIView*)view withPadding:(NSInteger)padding;

-(void)addWidthConstraint:(CGFloat)size;
-(void)addHeightConstraint:(CGFloat)size;

-(void)addAlign:(UIView*)left beside:(UIView*)right;
-(void)addAlign:(UIView*)left beside:(UIView*)right withPadding:(NSInteger)padding;

-(void)addAlign:(UIView*)top above:(UIView*)bottom;
-(void)addAlign:(UIView*)top above:(UIView*)bottom withPadding:(NSInteger)padding;

+(void)setAllTranslatesAutoresizingMaskIntoConstraintsToNO:(UIView*)view;
+(void)setMultipleTranslatesAutoresizingMaskIntoConstraintsToNO:(NSArray*)views;

@end
