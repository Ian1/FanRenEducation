//
//  FanRenViewController.h
//  FanRenEducation
//
//  Created by Ian on 11/2/13.
//  Copyright (c) 2013 fanren. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GADBannerViewDelegate.h"

#import "PicturesListViewController.h"

@class GADBannerView, GADRequest;

@interface FanRenViewController : UIViewController

<GADBannerViewDelegate> {
    GADBannerView *adBanner_;
}

@property (nonatomic, retain) PicturesListViewController * picListViewController_;

@property (nonatomic, retain) GADBannerView *adBanner;

- (GADRequest *)createRequest;

@end
