//
//  FanRenViewController.m
//  FanRenEducation
//
//  Created by Ian on 11/2/13.
//  Copyright (c) 2013 fanren. All rights reserved.
//

#import "FanRenViewController.h"
#import "GADBannerView.h"
#import "GADRequest.h"

#define kSampleAdUnitID @"a1527472bc99984"


@interface FanRenViewController ()

@end

@implementation FanRenViewController

@synthesize adBanner = adBanner_;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"@hello world");
    
	// Do any additional setup after loading the view.
    
    // Initialize the banner at the bottom of the screen.
    CGPoint origin = CGPointMake(0.0,
                                 self.view.frame.size.height -
                                 CGSizeFromGADAdSize(kGADAdSizeBanner).height);
    
    // Use predefined GADAdSize constants to define the GADBannerView.
    self.adBanner = [[GADBannerView alloc] initWithAdSize:kGADAdSizeBanner
                                                    origin:origin];
    
    // Note: Edit SampleConstants.h to provide a definition for kSampleAdUnitID
    // before compiling.
    self.adBanner.adUnitID = kSampleAdUnitID;
    self.adBanner.delegate = self;
    [self.adBanner setRootViewController:self];
    [self.view addSubview:self.adBanner];
    self.adBanner.center =
    CGPointMake(self.view.center.x, self.adBanner.center.y);
    [self.adBanner loadRequest:[self createRequest]];
    
//    append image view
//    UIImage *image = [UIImage imageFromBarcode:[[NKDEAN13Barcode alloc] initWithContent:@“6917878002446”]];
//    
//    UIImageView *imageview = [[UIImageView alloc] initWithImage:image];
//    
//    imageview.frame = CGRectMake(10, 10, image.size.width,image.size.height*2);
//    
//    [self.view addSubview:imageview];
    
    UIImage * image_ = [UIImage imageNamed:@"pic1"];
    
    UIButton * imageButton_ = [UIButton buttonWithType:UIButtonTypeCustom];
    
    imageButton_.frame = CGRectMake(100, 100, 200, 200);
    
    [imageButton_ setBackgroundImage: image_ forState: UIControlStateNormal];
    
    [imageButton_ addTarget:self action:@selector(imageButtonTouchDown:) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:imageButton_];
    
    
    //change the root view controller
    // self.view.window.rootViewController =
}

//image touch, change root view
- (IBAction)imageButtonTouchDown : (UIButton *) button
{
    NSLog(@"image button touch: change root view");
    self.picListViewController_ = [[PicturesListViewController alloc] init];
    self.view.window.rootViewController = self.picListViewController_;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark GADRequest generation

// Here we're creating a simple GADRequest and whitelisting the application
// for test ads. You should request test ads during development to avoid
// generating invalid impressions and clicks.
- (GADRequest *)createRequest {
    GADRequest *request = [GADRequest request];
    
    // Make the request for a test ad. Put in an identifier for the simulator as
    // well as any devices you want to receive test ads.
    request.testDevices =
    [NSArray arrayWithObjects:@"asdf",
     // TODO: Add your device/simulator test identifiers here. They are
     // printed to the console when the app is launched.
     nil];
    return request;
}


- (void)willAnimateRotationToInterfaceOrientation:
(UIInterfaceOrientation)toInterfaceOrientation
                                         duration:(NSTimeInterval)duration
{
    if ( toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight){
        //we need to re-load a new kind of ad.
        self.adBanner.center =
        CGPointMake(self.view.center.x, 100);
        
    } else {
        NSLog(@"currently we only support landscape left and landscape right!");
    }
    
}

- (void)viewDidUnload {
    NSLog(@"view did unload");
}

@end
