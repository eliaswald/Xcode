//
//  FwixTestAppDelegate.h
//  FwixTest
//
//  Created by Elias Wald on 6/1/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FwixTestViewController;

@interface FwixTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    FwixTestViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet FwixTestViewController *viewController;

@end

