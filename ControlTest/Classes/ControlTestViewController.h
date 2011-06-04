//
//  ControlTestViewController.h
//  ControlTest
//
//  Created by Elias Wald on 6/2/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kShowSegmentIndex 0
@interface ControlTestViewController : UIViewController <UIActionSheetDelegate> {
	IBOutlet UITextField *cityField;
	IBOutlet UITextField *stateField;/*
	IBOutlet UILabel *sliderLabel;
	IBOutlet UISwitch *leftSwitch;
	IBOutlet UISwitch *rightSwitch;
	IBOutlet UIView *switchView;*/
	IBOutlet UIButton *doSomethingButton;
	IBOutlet UITextView *scrollView;
}
@property (nonatomic, retain) UITextField *cityField;
@property (nonatomic, retain) UITextField *stateField;/*
@property (nonatomic, retain) UILabel *sliderLabel;
@property (nonatomic, retain) UISwitch *leftSwitch;
@property (nonatomic, retain) UISwitch *rightSwitch;
@property (nonatomic, retain) UIView *switchView;*/
@property (nonatomic, retain) UIButton *doSomethingButton;
@property (nonatomic, retain) UITextView *scrollView;

- (IBAction)textFieldDoneEditing:(id)sender;
- (IBAction)backgroundClick:(id)sender;/*
- (IBAction)sliderChanged:(id)sender;
- (IBAction)switchChanged:(id)sender;
- (IBAction)toggleShowHide:(id)sender;*/
- (IBAction)buttonClicked:(id)sender;

@end

