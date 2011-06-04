//
//  FwixTestViewController.m
//  FwixTest
//
//  Created by Elias Wald on 6/1/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import "FwixTestViewController.h"
#import "JSON.h"
#import "fAPI.h"

@implementation FwixTestViewController
@synthesize nameLabel, imgButton, infoText, location, cityText, stateText;


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		
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
	nameLabel.text = @"Places";
	
	cityText.text = @"Enter City Here";
	
	stateText.text - @"State";
	
	infoText.text = @"*Places Here*";
    [super viewDidLoad];
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
	[cityText resignFirstResponder];
	[stateText resignFirstResponder];
	return YES;
}

- (IBAction)showImage:(id)sender {
	
	NSString *city = cityText.text;
	NSString *state = stateText.text;
	
	@try {
		fPlace *fplace = [[fPlace alloc] init];
		
		nameLabel.text = city;
		
		fAPI *objAPI = [[fAPI alloc] initWithKey:@"00039d497003" userID:nil];
		
		NSArray *placesInCity = [[NSArray alloc] init];
		
		placesInCity = [objAPI getPlacesByCity:city province:state error:nil];
		
		NSString *place = @"";
		NSString *places = @"";
		
		for (int i=0; i<[placesInCity count]; i++) {
			fplace = [placesInCity objectAtIndex:i];
			place = [fplace.name stringByAppendingString:@"\n"];
			places = [places stringByAppendingString:place];
		}
		infoText.text = places;
	}
	@catch (NSException * e) {
		nameLabel.text = @"Places";
		cityText.text = @"Entery City Here";
		infoText.text = @"*Enter Correct City Information*";
		stateText.text = @"State";
	}
	@finally {
		cityText.text = @"Enter City Here";
		stateText.text = @"State";
	}
	
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
    [super dealloc];
}

@end
