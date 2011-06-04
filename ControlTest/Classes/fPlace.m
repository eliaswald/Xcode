/*
 * Copyright 2011 Fwix, Inc
 *
 * Permission to use, copy, modify, distribute, and sell this software
 * and its documentation for any purpose is hereby granted without fee,
 * provided that the above copyright notice appears in all copies and that
 * both that copyright notice and this permission notice appear in
 * supporting documentation, and that the name of Fwix, Inc
 * not be used in advertising or publicity
 * pertaining to distribution of the software without specific, written
 * prior permission.  Fwix, Inc makes no representations about the 
 * suitability of this software for any
 * purpose.  It is provided "as is" without express or implied warranty.
 *
 * Fwix, Inc disclaims all warranties with regard to this software, 
 * including all implied warranties of merchantability and fitness, 
 * in no event shall Fwix, Inc be liable for any special, indirect or
 * consequential damages or any damages whatsoever resulting from loss of
 * use, data or profits, whether in an action of contract, negligence or
 * other tortious action, arising out of or in connection with the use or
 * performance of this software.
 *
 *
 */

#import "fPlace.h"


@implementation fPlace

@synthesize uuid;
@synthesize name;
@synthesize latitude;
@synthesize longitude;
@synthesize phoneNumber;
@synthesize location;
@synthesize url;
@synthesize category;
@synthesize facebookID;
@synthesize twitterID;



-(id)init{
    
    
    if ((self = [super init])) {
        category = [[NSMutableArray alloc] init];
    }
    
    return self;
}




-(void)dealloc{
    
    [category release];
    [super dealloc];
    
    
}

@end
