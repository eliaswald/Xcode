//
//  ControlTestViewController.m
//  ControlTest
//
//  Created by Elias Wald on 6/2/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import "ControlTestViewController.h"
#import "fAPI.h"

@implementation ControlTestViewController
@synthesize cityField, stateField, /*sliderLabel, leftSwitch, rightSwitch, switchView,*/ doSomethingButton, scrollView;

- (IBAction)buttonClicked:(id)sender
{
	UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Are you sure?" delegate:self cancelButtonTitle:@"Nope" destructiveButtonTitle:@"Yes, I'm sure" otherButtonTitles:nil];
	[actionSheet showInView:self.view];
	[actionSheet release];
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
	if (!(buttonIndex == [actionSheet cancelButtonIndex])) {
		NSString *msg = @"";
		NSString *place = @"";
		
		fAPI *myfAPI = [[fAPI alloc] initWithKey:@"00039d497003" userID:nil];
		fPlace *placeInput = [[fPlace alloc] init];
		NSArray *placesNearCity = [[NSArray alloc] init];
		placesNearCity = [myfAPI getPlacesByCity:cityField.text province:stateField.text error:nil];
		for (int i = 0; i<[placesNearCity count]; i++) {
			placeInput = [placesNearCity objectAtIndex:i];
			place = [placeInput.name stringByAppendingString:@"\n"];
			msg = [msg stringByAppendingString:place];
		}
		
		NSString *title = [[NSString alloc] initWithFormat:@"Places near %@", cityField.text];
		
		title = [title stringByAppendingString:@"\n"];
		title = [title stringByAppendingString:msg];
		
		scrollView.text = title;
		
		[fAPI dealloc];
		[title release];
		[place release];
		[msg release];
		[placeInput dealloc];
		[placesNearCity dealloc];
	}
}
/*
- (IBAction)switchChanged:(id)sender
{
	UISwitch *whichSwitch = (UISwitch *)sender;
	BOOL setting = whichSwitch.isOn;
	[leftSwitch setOn:setting animated:YES];
	[rightSwitch setOn:setting animated:YES];
}

- (IBAction)toggleShowHide:(id)sender
{
	UISegmentedControl *control = (UISegmentedControl *)sender;
	NSInteger segment = control.selectedSegmentIndex;
	
	if (segment == kShowSegmentIndex) {
		[switchView setHidden:NO];
	}
	else {
		[switchView setHidden:YES];
	}
}


- (IBAction)sliderChanged:(id)sender
{
	UISlider *slider = (UISlider *)sender;
	int progressAsInt = (int)(slider.value + .5);
	NSString *newText = [[NSString alloc] initWithFormat:@"%d", progressAsInt];
	sliderLabel.text = newText;
	[newText release];
}
*/
- (IBAction)textFieldDoneEditing:(id)sender
{
	[sender resignFirstResponder];
}

- (IBAction)backgroundClick:(id)sender
{
	[cityField resignFirstResponder];
	[stateField resignFirstResponder];
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
	[cityField release];
	[stateField release];
	[doSomethingButton release];
	[scrollView release];
    [super dealloc];
}

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


 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
	 UIImage *buttonImageNormal = [UIImage imageNamed:@"whiteButton.png"];
	 UIImage *stretchableButtonImageNormal = [buttonImageNormal stretchableImageWithLeftCapWidth:12 topCapHeight:0];
	 [doSomethingButton setBackgroundImage:stretchableButtonImageNormal forState:UIControlStateNormal];
	 
	 UIImage *buttonImagePressed = [UIImage imageNamed:@"blueButton.png"];
	 UIImage *stretchableButtonImagePressed = [buttonImagePressed stretchableImageWithLeftCapWidth:12 topCapHeight:0];
	 [doSomethingButton setBackgroundImage:stretchableButtonImagePressed forState:UIControlStateHighlighted];
	 [super viewDidLoad];
 }


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

@end
