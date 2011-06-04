//
//  TwoButtonsAppDelegate.h
//  TwoButtons
//
//  Created by Elias Wald on 6/2/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TwoButtonsViewController;

@interface TwoButtonsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TwoButtonsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TwoButtonsViewController *viewController;

@end

