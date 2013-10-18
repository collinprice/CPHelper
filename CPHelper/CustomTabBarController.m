//
//  CustomTabBarController.m
//  RiderMel
//
//  Created by Collin on 2013-07-15.
//  Copyright (c) 2013 Niagara Research. All rights reserved.
//

#import "CustomTabBarController.h"
#import "CustomTabBarItem.h"

@implementation CustomTabBarController

-(id)initWithBackground:(UIImage*)background andTabBarItems:(NSArray*)items {
    
    self = [super init];
    if (self) {
        
        for (id obj in items) {
            if (![obj isKindOfClass:[CustomTabBarItem class]]) {
                [NSException raise:@"CustomTabBar Exception" format:@"TabBarItems must be of type CustomTabBarItem. Encountered class: %@", [obj class]];
            }
        }
        
        [self.tabBar setBackgroundImage:background];
        
        NSMutableArray* viewControllers = [NSMutableArray array];
        for (CustomTabBarItem* cTabBarItem in items) {
            [viewControllers addObject:cTabBarItem.viewController];
        }
        [self setViewControllers:viewControllers];
        
        for (NSInteger i = 0; i < [self.tabBar.items count]; ++i) {
            UITabBarItem* item = self.tabBar.items[i];
            CustomTabBarItem* cItem = items[i];
            
            if ([item respondsToSelector:@selector(setFinishedSelectedImage:withFinishedUnselectedImage:)]) {
                item.title = cItem.title;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
                [item setFinishedSelectedImage:cItem.image withFinishedUnselectedImage:cItem.image];
#pragma clang diagnostic pop
            } else {
                item = [[UITabBarItem alloc] initWithTitle:cItem.title image:cItem.image selectedImage:cItem.image];
            }
        }
    }
    return self;
}

@end
