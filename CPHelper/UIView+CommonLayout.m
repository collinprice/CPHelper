//
//  UIView+CommonLayout.m
//  RiderMel
//
//  Created by Collin on 2013-07-12.
//  Copyright (c) 2013 Niagara Research. All rights reserved.
//

#import "UIView+CommonLayout.h"

@implementation UIView (CommonLayout)

-(void)addBothFillConstraints:(UIView*)view {
    [self addBothFillConstraints:view withPadding:0];
}

-(void)addBothFillConstraints:(UIView*)view withPadding:(NSInteger)padding {
    [self addHorizontalFillConstraints:view withPadding:padding];
    [self addVerticalFillConstraints:view withPadding:padding];
}

-(void)addMultipleHorizontalFillConstraints:(NSArray*)views {
    [self addMultipleHorizontalFillConstraints:views withPadding:0];
}

-(void)addMultipleHorizontalFillConstraints:(NSArray*)views withPadding:(NSInteger)padding {
    for (UIView* v in views) {
        [self addHorizontalFillConstraints:v withPadding:padding];
    }
}

-(void)addHorizontalFillConstraints:(UIView*)view {
    [self addHorizontalFillConstraints:view withPadding:0];
}

-(void)addHorizontalFillConstraints:(UIView*)view withPadding:(NSInteger)padding {
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"H:|-%d-[view]-%d-|", padding, padding] options:0 metrics:nil views:NSDictionaryOfVariableBindings(view)]];
}

-(void)addMultipleVerticalFillConstraints:(NSArray*)views {
    [self addMultipleVerticalFillConstraints:views withPadding:0];
}

-(void)addMultipleVerticalFillConstraints:(NSArray*)views withPadding:(NSInteger)padding {
    for (UIView* v in views) {
        [self addVerticalFillConstraints:v withPadding:padding];
    }
}

-(void)addVerticalFillConstraints:(UIView*)view {
    [self addVerticalFillConstraints:view withPadding:0];
}

-(void)addVerticalFillConstraints:(UIView*)view withPadding:(NSInteger)padding {
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"V:|-%d-[view]-%d-|", padding, padding] options:0 metrics:nil views:NSDictionaryOfVariableBindings(view)]];
}

-(void)addEvenHorizontalConstraints:(NSArray*)views {
    
    BOOL firstView = YES;
    NSString *hConstraint = @"H:|";
    NSMutableDictionary *viewsDict = [[NSMutableDictionary alloc] init];
    for (NSInteger i = 0; i < [views count]; ++i) {
        NSString *vName = [NSString stringWithFormat:@"btn%d",i];
        [viewsDict setObject:[views objectAtIndex:i] forKey:vName];
        if (firstView) {
            firstView = NO;
            hConstraint = [NSString stringWithFormat:@"%@[%@]",hConstraint,vName];
        } else {
            hConstraint = [NSString stringWithFormat:@"%@[%@(==btn%d)]",hConstraint,vName, (i-1)];
        }
    }
    hConstraint = [NSString stringWithFormat:@"%@|", hConstraint];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:hConstraint options:0 metrics:nil views:viewsDict]];
}

-(void)addCenterXConstraint:(UIView*)view {
    
    [self addCenterXConstraint:view withOffset:0];
}

-(void)addCenterXConstraint:(UIView *)view withOffset:(NSInteger)offset {
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1
                                                      constant:offset]];
}

-(void)addCenterYConstraint:(UIView*)view {
    
    [self addCenterYConstraint:view withOffset:0];
}

-(void)addCenterYConstraint:(UIView *)view withOffset:(NSInteger)offset {
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1
                                                      constant:offset]];
}

-(void)addAlignTopConstraint:(UIView*)view {
    [self addAlignTopConstraint:view withPadding:0];
}

-(void)addAlignTopConstraint:(UIView*)view withPadding:(NSInteger)padding {
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1
                                                      constant:padding]];
}

-(void)addAlignBottomConstraint:(UIView*)view {
    [self addAlignBottomConstraint:view withPadding:0];
}

-(void)addAlignBottomConstraint:(UIView*)view withPadding:(NSInteger)padding {
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1
                                                      constant:-padding]];
}

-(void)addAlignLeftConstraint:(UIView*)view {
    
    [self addAlignLeftConstraint:view withPadding:0];
}

-(void)addAlignLeftConstraint:(UIView*)view withPadding:(NSInteger)padding {
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1
                                                      constant:padding]];
}

-(void)addAlignRightConstraint:(UIView*)view {
    
    [self addAlignRightConstraint:view withPadding:0];
}

-(void)addAlignRightConstraint:(UIView *)view withPadding:(NSInteger)padding {
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1
                                                      constant:-padding]];
}

-(void)addWidthConstraint:(CGFloat)size {
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                    multiplier:1
                                                      constant:size]];
}

-(void)addHeightConstraint:(CGFloat)size {
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                    multiplier:1
                                                      constant:size]];
}

-(void)addAlign:(UIView*)left beside:(UIView*)right {
    
    
}

-(void)addAlign:(UIView*)left beside:(UIView*)right withPadding:(NSInteger)padding {
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:left
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:right
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1
                                                      constant:padding]];
}

-(void)addAlign:(UIView*)top above:(UIView*)bottom {
    
    [self addAlign:top above:bottom withPadding:0];
}

-(void)addAlign:(UIView*)top above:(UIView*)bottom withPadding:(NSInteger)padding; {
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:bottom
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:top
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1
                                                      constant:padding]];
}

-(void)addStackVerticallyConstraints:(NSArray*)views {
    
    NSString *hConstraint = @"V:|";
    NSMutableDictionary *viewsDict = [[NSMutableDictionary alloc] init];
    for (NSInteger i = 0; i < [views count]; ++i) {
        NSString *vName = [NSString stringWithFormat:@"btn%d",i];
        [viewsDict setObject:[views objectAtIndex:i] forKey:vName];
        hConstraint = [NSString stringWithFormat:@"%@[%@]",hConstraint,vName];
    }
    hConstraint = [NSString stringWithFormat:@"%@|", hConstraint];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:hConstraint options:0 metrics:nil views:viewsDict]];
}

-(void)addStackHorizontallyConstraints:(NSArray*)views {
    
    NSString *hConstraint = @"H:|";
    NSMutableDictionary *viewsDict = [[NSMutableDictionary alloc] init];
    for (NSInteger i = 0; i < [views count]; ++i) {
        NSString *vName = [NSString stringWithFormat:@"btn%d",i];
        [viewsDict setObject:[views objectAtIndex:i] forKey:vName];
        hConstraint = [NSString stringWithFormat:@"%@[%@]",hConstraint,vName];
    }
    hConstraint = [NSString stringWithFormat:@"%@|", hConstraint];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:hConstraint options:0 metrics:nil views:viewsDict]];
}


+(void)setAllTranslatesAutoresizingMaskIntoConstraintsToNO:(UIView*)view {
    
    [view setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSArray* viewBlackList = @[
                               [UISegmentedControl class],
                               [UIWebView class],
                               ];
    
    for (Class class in viewBlackList) {
        if ([view isKindOfClass:class]) return;
    }
    
    if ([view.subviews count] > 0) {
        for (UIView* v in view.subviews) {
            [UIView setAllTranslatesAutoresizingMaskIntoConstraintsToNO:v];
        }
    }
}

+(void)setMultipleTranslatesAutoresizingMaskIntoConstraintsToNO:(NSArray*)views {
    for (UIView* v in views) {
        [self setAllTranslatesAutoresizingMaskIntoConstraintsToNO:v];
    }
}


@end
