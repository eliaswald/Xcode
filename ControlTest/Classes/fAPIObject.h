//
//  fAPIObject.h
//  FwixAPITest
//
//  Created by swapan on 4/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface fAPIObject : NSObject {
    
    NSString *key;
    NSString *userID;
    
}

@property (nonatomic,retain) NSString *key;
@property (nonatomic,retain) NSString *userID;

@end
