//
//  PicturesListViewController.m
//  FanRenEducation
//
//  Created by Ian on 11/3/13.
//  Copyright (c) 2013 fanren. All rights reserved.
//

#import "PicturesListViewController.h"

@interface PicturesListViewController ()

@end

@implementation PicturesListViewController

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
	// Do any additional setup after loading the view.
    
    //add a uinavigation controller
    
    [self loadNavigationBar];
    
    [self loadSegmentControl];
}

- (void) loadNavigationBar
{
    UINavigationBar * navigationBar = [ [UINavigationBar alloc] init];
    
    UIBarButtonItem * leftButton = [[UIBarButtonItem alloc] init];
    leftButton.title = @"Back";
    [leftButton setTarget:self];
    leftButton.action = @selector(doBack);
    UINavigationItem * navigationItem = [ [UINavigationItem alloc] init];
    navigationItem.leftBarButtonItem = leftButton;
    
    
    UIBarButtonItem * rightButton = [ [UIBarButtonItem alloc] init];
    rightButton.target = self;
    rightButton.action = @selector(goHome);
    UIImage * image_ = [UIImage imageNamed:@"home"];
    rightButton.image = image_;
    navigationItem.rightBarButtonItem = rightButton;
    
    
    [navigationBar pushNavigationItem:navigationItem animated:false];
    
    
    navigationBar.frame = CGRectMake(0, 20, self.view.bounds.size.width
                                     , 50);
    [self.view addSubview:navigationBar];
}

- (void) loadSegmentControl
{
    NSArray * items_ = [NSArray arrayWithObjects:@"Pictures List", @"My Pictures", Nil];
    UISegmentedControl * segmentControl_ = [ [UISegmentedControl alloc] initWithItems:items_];
    segmentControl_.frame = CGRectMake(0, self.view.bounds.size.height - 50, self.view.bounds.size.width
                                       , 50);
    segmentControl_.tag = 1;
    segmentControl_.selectedSegmentIndex = 0;
    
    [segmentControl_ addTarget:self
                         action:@selector(segmentValueChange)
               forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:segmentControl_];
}

- (void) segmentValueChange
{
    UISegmentedControl * segmentedControl_ = (UISegmentedControl *) [self.view viewWithTag:1];
    int selectedIndex = segmentedControl_.selectedSegmentIndex;
    
    if (selectedIndex == 0){
        [self loadPictureList];
    } else {
        [self loadMyPictureList];
    }
}

- (void) loadPictureList
{
    UICollectionView * spCollectionView_ = [ [UICollectionView alloc] init];
    spCollectionView_.frame = CGRectMake(0, 50, self.view.bounds.size.width, self.view.bounds.size.height - 120);
    spCollectionView_.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:spCollectionView_];
    
    NSLog(@"load system picture");
}

- (void) loadMyPictureList
{
    NSLog(@"load my picture");
}

- (void) doBack
{
    NSLog(@"do back");
}

- (void) goHome
{
    NSLog(@"go home");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
