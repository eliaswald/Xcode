//
//  ControlTestAppDelegate.h
//  ControlTest
//
//  Created by Elias Wald on 6/2/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ControlTestViewController;

@interface ControlTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ControlTestViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ControlTestViewController *viewController;

@end

