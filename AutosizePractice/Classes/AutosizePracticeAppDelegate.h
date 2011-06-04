//
//  AutosizePracticeAppDelegate.h
//  AutosizePractice
//
//  Created by Elias Wald on 6/3/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AutosizePracticeViewController;

@interface AutosizePracticeAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    AutosizePracticeViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet AutosizePracticeViewController *viewController;

@end

