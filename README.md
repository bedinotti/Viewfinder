Viewfinder
==========

An Objective-C class that helps you debug by showing the view hierarchy of whatever you tap on.

Usage
==========
In your app delegate, include "CDViewfinder.h". After [self.window makeKeyAndVisible] add the following line:

[CDViewfinder start]

That's it! Now whenever someone taps on the screen, the console's log will show a concise description of the view hierarchy leading to that view, and which UIViewControllers are responsible for each of those views:

UIWindow - (null)
   UILayoutContainerView - ABCNavigationController
      UINavigationTransitionView - ABCNavigationController
         UIViewControllerWrapperView - ABCNavigationController
            UIView - ABCBrowseViewController
               UIScrollView - ABCBrowseViewController
                  UITableView - ABCBrowseTableViewController

