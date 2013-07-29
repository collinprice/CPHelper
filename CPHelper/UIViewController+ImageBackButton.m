//
//  UIViewController+ImageBackButton.m
//  RiderMel
//
//  Created by Collin on 2013-07-22.
//  Copyright (c) 2013 Niagara Research. All rights reserved.
//

#import "UIViewController+ImageBackButton.h"

@implementation UIViewController (ImageBackButton)

- (void)setUpImageBackButton:(UIImage*)image {
    
    if (self != [self.navigationController.viewControllers objectAtIndex:0]) {
        UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 34, 26)];
        [backButton setBackgroundImage:image forState:UIControlStateNormal];
        UIBarButtonItem *barBackButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        [backButton addTarget:self action:@selector(popCurrentViewController) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem = barBackButtonItem;
        self.navigationItem.hidesBackButton = YES;
    }
}

- (void)popCurrentViewController {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
