//
//  SwitchViewController.h
//  MultiviewTest
//
//  Created by Elias Wald on 6/3/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BlueViewController;
@class YellowViewController;


@interface SwitchViewController : UIViewController {
	YellowViewController *yellowViewController;
	BlueViewController *blueViewController;
}

@property (nonatomic, retain) YellowViewController *yellowViewController;
@property (nonatomic, retain) BlueViewController *blueViewController;

- (IBAction)switchViews:(id)sender;

@end
