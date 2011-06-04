//
//  Hello_WorldAppDelegate.h
//  Hello World
//
//  Created by Elias Wald on 4/26/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Hello_WorldViewController;

@interface Hello_WorldAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Hello_WorldViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Hello_WorldViewController *viewController;

@end

