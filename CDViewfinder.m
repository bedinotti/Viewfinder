//
//  CDViewfinder.m
//  Viewfinder
//
//  Created by Chris Downie on 1/20/13.
//  Copyright (c) 2013 Chris Downie. All rights reserved.
//

#import "CDViewfinder.h"

@interface CDViewfinder ()

@property (weak) UIView *installedView;

@end

@implementation CDViewfinder

+ (CDViewfinder *)start
{
    static CDViewfinder *sharedInstance = nil;
    if (!sharedInstance) {
        sharedInstance = [[CDViewfinder alloc] init];
    }
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(screenTapped:)];
        tapGesture.delegate = self;
        tapGesture.cancelsTouchesInView = NO;
        self.installedView = [UIApplication sharedApplication].keyWindow.rootViewController.view;
        [self.installedView addGestureRecognizer:tapGesture];
    }
    return self;
}

- (void)screenTapped:(UIGestureRecognizer *)sender
{
    NSMutableArray *viewStack = @[].mutableCopy;
    CGPoint tapPoint = [sender locationOfTouch:0 inView:self.installedView];
    UIView *targetView = [self.installedView hitTest:tapPoint withEvent:nil];
    
    do {
        [viewStack addObject:targetView];
    } while ((targetView = targetView.superview));
    
    NSMutableString *indent = @"\n".mutableCopy;
    NSMutableString *output = @"".mutableCopy;
    for (int index = viewStack.count-1; index >= 0; index--) {
        UIView *v = [viewStack objectAtIndex:index];
        [output appendFormat:@"%@%@ - %@", indent, [v class], [[self viewControllerForView:v] class]];
        [indent appendString:@"   "];
    }
    
    NSLog(@"%@", output);
}

- (UIViewController *)viewControllerForView:(UIView *)view
{
    return [view valueForKey:@"_viewDelegate"];
}

#pragma mark - UIGestureRecognizer delegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}
@end
