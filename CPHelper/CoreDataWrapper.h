//
//  CoreDataWrapper.h
//  CPHelper
//
//  Created by Collin on 2013-08-02.
//  Copyright (c) 2013 Collin Price. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataWrapper : NSObject

-(BOOL)save;
-(void)clearStore;
-(NSManagedObjectContext*)managedObjectContext;

+(CoreDataWrapper*)sharedInstance;

@end
