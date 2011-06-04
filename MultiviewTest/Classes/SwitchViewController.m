    //
//  SwitchViewController.m
//  MultiviewTest
//
//  Created by Elias Wald on 6/3/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import "SwitchViewController.h"
#import "BlueViewController.h"
#import "YellowViewController.h"

@implementation SwitchViewController
@synthesize blueViewController, yellowViewController;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


- (void)viewDidLoad {
    BlueViewController *blueController = [[BlueViewController alloc] initWithNibName:@"BlueView" bundle:nil];
	self.blueViewController = blueController;
	[self.view insertSubview:blueController.view atIndex:0];
	[blueController release];
}

- (IBAction)switchViews:(id)sender
{
	if (self.yellowViewController == nil) {
		YellowViewController *yellowController = [[YellowViewController alloc] initWithNibName:@"YellowView" bundle:nil];
		self.yellowViewController = yellowController;
		[yellowController release];
	}
	
	[UIView beginAnimations:@"View Flip" context:nil];
	[UIView setAnimationDuration:1.25];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	
	if (self.blueViewController.view.superview == nil) {
		[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
		[blueViewController viewWillAppear:YES];
		[yellowViewController viewWillDisappear:YES];
		[yellowViewController.view removeFromSuperview];
		[self.view insertSubview:blueViewController.view atIndex:0];
		[yellowViewController viewDidDisappear:YES];
		[blueViewController viewDidAppear:YES];
	}
	else {
		[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
		[blueViewController viewWillDisappear:YES];
		[yellowViewController viewWillAppear:YES];
		[blueViewController.view removeFromSuperview];
		[self.view insertSubview:yellowViewController.view atIndex:0];
		[yellowViewController viewDidAppear:YES];
		[blueViewController viewDidDisappear:YES];
	}
	[UIView commitAnimations];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[blueViewController release];
	[yellowViewController release];
    [super dealloc];
}


@end
