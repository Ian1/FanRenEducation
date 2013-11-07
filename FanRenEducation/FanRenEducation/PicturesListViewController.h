//
//  PicturesListViewController.h
//  FanRenEducation
//
//  Created by Ian on 11/3/13.
//  Copyright (c) 2013 fanren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PicturesListViewController : UIViewController

- (void) loadNavigationBar;

- (void) loadSegmentControl;

- (void) segmentValueChange;

- (void) loadPictureList;

- (void) loadMyPictureList;

- (void) doBack;

- (void) goHome;
@end
