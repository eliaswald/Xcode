//
//  TwoButtonsViewController.h
//  TwoButtons
//
//  Created by Elias Wald on 6/2/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwoButtonsViewController : UIViewController {
	IBOutlet UILabel *statusText;
}
@property (nonatomic, retain) UILabel *statusText;

- (IBAction)buttonPressed:(id)sender;

@end

