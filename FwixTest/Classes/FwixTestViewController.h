//
//  FwixTestViewController.h
//  FwixTest
//
//  Created by Elias Wald on 6/1/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "fAPI.h"

@interface FwixTestViewController : UIViewController <UITextFieldDelegate> {
	
	IBOutlet UILabel *nameLabel;
	IBOutlet UIButton *imgButton;
	IBOutlet UITextView *infoText;
	IBOutlet UITextField *cityText;
	IBOutlet UITextField *stateText;
	fLocation *location;

}

@property (nonatomic, retain) IBOutlet UILabel *nameLabel;
@property (nonatomic, retain) IBOutlet UIButton *imgButton;
@property (nonatomic, retain) IBOutlet UITextView *infoText;
@property (nonatomic, retain) IBOutlet UITextField *cityText;
@property (nonatomic, retain) IBOutlet UITextField *stateText;
@property (nonatomic, retain) fLocation *location;


- (IBAction)showImage:(id)sender;
@end

