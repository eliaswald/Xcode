//
//  TwoButtonsViewController.m
//  TwoButtons
//
//  Created by Elias Wald on 6/2/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import "TwoButtonsViewController.h"

@implementation TwoButtonsViewController
@synthesize statusText;


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


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (IBAction)buttonPressed:(id)sender
{
	NSString *title = [sender titleForState:UIControlStateNormal];
	NSString *newText = [[NSString alloc] initWithFormat:@"%@ button pressed.", title];
	statusText.text = newText;
	[newText release];
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
	[statusText release];
    [super dealloc];
}

@end
