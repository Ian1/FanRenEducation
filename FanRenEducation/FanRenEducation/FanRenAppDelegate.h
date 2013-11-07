//
//  FanRenAppDelegate.h
//  FanRenEducation
//
//  Created by Ian on 11/2/13.
//  Copyright (c) 2013 fanren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FanRenViewController.h"
#import "PicturesListViewController.h"
@interface FanRenAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic) FanRenViewController * rootControlelr;
@property (strong, nonatomic) PicturesListViewController * fakeRootControlelr;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
