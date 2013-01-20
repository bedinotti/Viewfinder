//
//  CDViewController.m
//  Viewfinder
//
//  Created by Chris Downie on 1/19/13.
//  Copyright (c) 2013 Chris Downie. All rights reserved.
//

#import "CDViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface CDViewController ()

@end

@implementation CDViewController

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *subview = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    subview.backgroundColor = [UIColor yellowColor];

    self.topView.backgroundColor = [UIColor redColor];
    self.bottomView.backgroundColor = [UIColor greenColor];
    [self.topView addSubview:subview];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tapGesture.cancelsTouchesInView = NO;
    [self.topView addGestureRecognizer:tapGesture];
}

- (void)viewTapped:(UIGestureRecognizer *)sender
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
