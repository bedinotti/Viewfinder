//
//  CDAppDelegate.h
//  Viewfinder
//
//  Created by Chris Downie on 1/19/13.
//  Copyright (c) 2013 Chris Downie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDViewfinder.h"
@class CDViewController;

@interface CDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) CDViewController *viewController;

@end
