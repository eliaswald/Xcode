//
//  AutosizePracticeViewController.m
//  AutosizePractice
//
//  Created by Elias Wald on 6/3/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import "AutosizePracticeViewController.h"

@implementation AutosizePracticeViewController
@synthesize button1, button2, button3, button4, button5, button6;


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

- (void)willAnimateSecondHalfOfRotationFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation duration:(NSTimeInterval)duration
{

	UIInterfaceOrientation toOrientation = self.interfaceOrientation;
	[UIView beginAnimations:@"move buttons" context:nil];
	
	if (toOrientation == UIInterfaceOrientationPortrait
		|| toOrientation == UIInterfaceOrientationPortraitUpsideDown) {
		button1.frame = CGRectMake(20, 20, 125, 125);
		button2.frame = CGRectMake(175, 20, 125, 125);
		button3.frame = CGRectMake(20, 168, 125, 125);
		button4.frame = CGRectMake(175, 168, 125, 125);
		button5.frame = CGRectMake(20, 315, 125, 125);
		button6.frame = CGRectMake(175, 315, 125, 125);
	}
	else {
		button1.frame = CGRectMake(20, 20, 125, 125);
		button2.frame = CGRectMake(20, 155, 125, 125);
		button3.frame = CGRectMake(177, 20, 125, 125);
		button4.frame = CGRectMake(177, 155, 125, 125);
		button5.frame = CGRectMake(328, 20, 125, 125);
		button6.frame = CGRectMake(328, 155, 125, 125);
	}
	[UIView commitAnimations];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait ||
			interfaceOrientation == UIInterfaceOrientationLandscapeRight ||
			interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[button1 release];
	[button2 release];
	[button3 release];
	[button4 release];
	[button5 release];
	[button6 release];
    [super dealloc];
}

@end
