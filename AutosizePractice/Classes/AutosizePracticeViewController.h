//
//  AutosizePracticeViewController.h
//  AutosizePractice
//
//  Created by Elias Wald on 6/3/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutosizePracticeViewController : UIViewController {
	IBOutlet UIButton *button1;
	IBOutlet UIButton *button2;
	IBOutlet UIButton *button3;
	IBOutlet UIButton *button4;
	IBOutlet UIButton *button5;
	IBOutlet UIButton *button6;
}

@property (nonatomic, retain) UIView *button1;
@property (nonatomic, retain) UIView *button2;
@property (nonatomic, retain) UIView *button3;
@property (nonatomic, retain) UIView *button4;
@property (nonatomic, retain) UIView *button5;
@property (nonatomic, retain) UIView *button6;

@end

