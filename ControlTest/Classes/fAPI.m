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

#import "fAPI.h"
#import "JSON.h"



@implementation fAPI

@synthesize key;
@synthesize userID;


-(id)initWithKey:(NSString *)fAPIKey userID:(NSString *)ID{

    
    if ((self = [super init])) {
        self.key = fAPIKey;
        self.userID = ID;
    }
    
    return self;
    
}






-(BOOL) updatePlace:(fPlace *)place error:(NSError **)error{
    

    
    NSString *url;
    if ([place.uuid length] >0) {
        url = [NSString stringWithFormat:@"http://geoapi.fwix.com/places/%@.json?api_key=%@",place.uuid,key];
        
    }
    else{
        url = [NSString stringWithFormat:@"http://geoapi.fwix.com/places.json?api_key=%@",key];
        
    }
        
    if ([userID length] >0) {
        url = [url stringByAppendingFormat:@"&user_id=%@",userID];
    }
    if (place.latitude > 0) {
        url = [url stringByAppendingFormat:@"&lat=%f",place.latitude];
        }
    if (place.longitude > 0) {
        url = [url stringByAppendingFormat:@"&lng=%f",place.longitude];
    }
    if ([place.name length]>0) {
        url = [url stringByAppendingFormat:@"&name=%@",place.name];
    }
    if ([place.phoneNumber length]>0) {
        url = [url stringByAppendingFormat:@"&phone_numer=%@",place.phoneNumber];
    }
    if ([place.url length]>0) {
        url = [url stringByAppendingFormat:@"&link=%@",place.url];
    }
    if ([place.location.country length]>0 ) {
        url = [url stringByAppendingFormat:@"&country=%@",place.location.country];
    }
    if ([place.location.locality length]>0 ) {
        url = [url stringByAppendingFormat:@"&locality=%@",place.location.locality];
    }
    if ([place.location.province length]>0 ) {
        url = [url stringByAppendingFormat:@"&province=%@",place.location.province];
    }
    if ([place.location.city length]>0 ) {
        url = [url stringByAppendingFormat:@"&city=%@",place.location.city];
    }
    if ([place.location.postalCode length]>0 ) {
        url = [url stringByAppendingFormat:@"&postal_code=%@",place.location.postalCode];
    }
    if ([place.location.address length]>0 ) {
        url = [url stringByAppendingFormat:@"&address=%@",place.location.address];
    }
   
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setTimeoutInterval:30];
    [request setURL:[NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]]];
    [request setHTTPMethod:@"POST"];
    
    
    
    NSData *responseDataSerial = [NSURLConnection sendSynchronousRequest:request returningResponse:nil  error:nil];
    
    
    NSString *responseString = [[NSString alloc] initWithData:responseDataSerial encoding:NSUTF8StringEncoding];
    
    [request release];
    
    NSRange textRange;
    textRange = [responseString rangeOfString:@"success"];
    if (textRange.location != NSNotFound) {
        
        if (error!=nil) {
            *error = nil;
        }
        
        return YES;
    }
    else{
        
        NSLog(@"error : %@",[[responseString JSONValue] objectForKey:@"message"]);
        
        if (error!=nil) {
            *error = [NSError errorWithDomain:[[responseString JSONValue] objectForKey:@"message"] code:0 userInfo:nil];
        }
        
        
        return NO;
    }
    
    
}

-(BOOL) deletePlace:(NSString *)uuid error:(NSError **)error{

    
    NSString *url = [NSString stringWithFormat:@"http://geoapi.fwix.com/places/%@.json?api_key=%@",uuid,key];
    
    
    if ([userID length] >0) {
        url = [url stringByAppendingFormat:@"&user_id=%@",userID];
    }
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setTimeoutInterval:30];
    [request setURL:[NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]]];
    [request setHTTPMethod:@"DELETE"];
    
    NSData *responseDataSerial = [NSURLConnection sendSynchronousRequest:request returningResponse:nil  error:nil];
    
    
    NSString *responseString = [[NSString alloc] initWithData:responseDataSerial encoding:NSUTF8StringEncoding];
    
    NSLog(@"string : %@",responseString);
    
    NSRange textRange;
    textRange = [responseString rangeOfString:@"Place delete suggestion submitted"];
    if (textRange.location != NSNotFound) {
        
        if (error!=nil) {
            *error = nil;
        }
        
        return YES;
    }
    else{
        
        NSLog(@"error : %@",[[responseString JSONValue] objectForKey:@"message"]);
        
        if (error!=nil) {
            *error = [NSError errorWithDomain:[[responseString JSONValue] objectForKey:@"message"] code:0 userInfo:nil];
        }
        
        
        return NO;
    }
    
    
}





-(NSArray *)getContentByCity:(NSString *)city province:(NSString *)province  types:(NSArray *)types country:(NSString *)country locality:(NSString *)locality  page:(int)page pageSize:(int)pageSize error:(NSError **)error{ 
    

    
    NSString *url = [NSString stringWithFormat:@"http://geoapi.fwix.com/content.json?api_key=%@&city=%@&province=%@",key,city,province];
    
    
    if ([userID length] >0) {
        url = [url stringByAppendingFormat:@"&user_id=%@",userID];
    }
    
    if ([country length] > 0) {
        url = [url stringByAppendingString:[NSString stringWithFormat:@"&country=%@",country]];
    }
    
    if ([locality length] > 0) {
        url = [url stringByAppendingString:[NSString stringWithFormat:@"&locality=%@",locality]];
    }
    


    
    if (page != 0) {
        url = [url stringByAppendingString:[NSString stringWithFormat:@"&page=%i",page]];
    }
    
    
    if (pageSize != 0) {
        url = [url stringByAppendingString:[NSString stringWithFormat:@"&page_size=%i",pageSize]];
    }
    if ([types count] == 0) {
        types = [NSArray arrayWithObjects:@"news",@"photos",@"reviews",@"critic_reviews",@"status_updates",@"events",@"real_estate",nil];
    }
    else{
        url = [url stringByAppendingString:[NSString stringWithFormat:@"&content_types="]];
        for (int i = 0; i < [types count] - 1; i++) {
            url = [url stringByAppendingFormat:@"%@,",[types objectAtIndex:i]];
        }
        url = [url stringByAppendingFormat:@"%@",[types lastObject]];
        
        
    }
    
    
    NSLog(@"url :%@", url);
    
    NSError *e;
    
    NSDictionary *resultDictionary = [self sendURL:url withError:&e];

    if (!e) {
        
        if (error!=nil) {
             *error = nil;
        }
       
    
        return [self parseDictContent:resultDictionary contentTypes:types];
    }
    else{
        
        if (error!=nil) {
            *error = e;
        }
        
        return nil;
    }
    
}

-(NSArray *)getContentByCity:(NSString *)city province:(NSString *)province types:(NSArray *)types country:(NSString *)country locality:(NSString *)locality error:(NSError **)error{
    
    NSError *e;
    NSArray *abc = [self getContentByCity:city province:province types:types country:country locality:locality page:0 pageSize:0 error:&e];
    
    if (!e) {
        
        if (error!=nil) {
            *error = nil;
        }
        *error = nil;
        return abc;
    }
    else{
        
        if (error!=nil) {
            *error = e;
        }
        
        return nil;
    }
    
    
}
-(NSArray *)getContentByCity:(NSString *)city province:(NSString *)province types:(NSArray *)types error:(NSError **)error{
    
    NSError *e;
    NSArray *abc = [[[NSArray alloc] init] autorelease];
    
    abc = [self getContentByCity:city province:province types:types country:nil locality:nil page:0 pageSize:0 error:&e];
    
    
    if (e == nil) {
        if (error!=nil) {
            *error = nil;
        }
        
        return abc;
    }
    else{
        
        if (error!=nil) {
            *error = e;
        }
        
        return nil;
    }
    
}

-(NSArray *)getContentByCity:(NSString *)city province:(NSString *)province types:(NSArray *)types page:(int)page pageSize:(int)pageSize error:(NSError **)error{
    
    NSError *e;
    NSArray *abc = [self getContentByCity:city province:province types:types country:nil locality:nil page:page pageSize:pageSize error:&e];
    
    if (!e) {
        if (error!=nil) {
            *error = nil;
        }
        
        return abc;
    }
    else{
        
        if (error!=nil) {
            *error = e;
        }
        
        return nil;
    }
    
}

-(NSArray *)getContentByLatitude:(float) latitude longitude:(float)longitude contentType:(NSArray *)types  page:(int)page pageSize:(int)pageSize  error:(NSError **)error{
    
    
    NSString *url;
    
    int arrayCount = [types count];


   
    
    if (arrayCount == 0) {
        url = [NSString stringWithFormat:@"http://geoapi.fwix.com/content.json?api_key=%@&lat=%f&lng=%f",key,latitude ,longitude];
        types = [NSArray arrayWithObjects:@"news",@"photos",@"reviews",@"critic_reviews",@"status_updates",@"events",@"real_estate",nil];
    }
    else{
    
        url = [url stringByAppendingString:[NSString stringWithFormat:@"&content_types="]];
        for (int i = 0; i < [types count] - 1; i++) {
            url = [url stringByAppendingFormat:@"%@,",[types objectAtIndex:i]];
        }
        url = [url stringByAppendingFormat:@"%@",[types lastObject]];
 
        
    }
    
    
    if ([userID length] >0) {
        url = [url stringByAppendingFormat:@"&user_id=%@",userID];
    }
    
    if (page != 0) {
        url = [url stringByAppendingString:[NSString stringWithFormat:@"&page=%i",page]];
    }
    
    
    if (pageSize != 0) {
        url = [url stringByAppendingString:[NSString stringWithFormat:@"&page_size=%i",pageSize]];
    }
    
    NSError *e;
    
    NSDictionary *resultDictionary = [self sendURL:url withError:&e];
    
    

    if (!e) {
        if (error!=nil) {
            *error = nil;
        }
        
        return [self parseDictContent:resultDictionary contentTypes:types];
    }
    else{
        
        if (error!=nil) {
            *error = e;
        }
        
        return nil;
    }
    
}

-(NSArray *)getContentByLatitude:(float) latitude longitude:(float)longitude contentType:(NSArray *)types error:(NSError **)error{
    
    NSError *e;
    NSArray *abc = [self getContentByLatitude:latitude longitude:longitude contentType:types page:0 pageSize:0 error:&e];
    
    if (!e) {
        if (error!=nil) {
            *error = nil;
        }
        
        return abc;
    }
    else{
        if (error!=nil) {
            *error = e;
        }
        
        return nil;
    }
    
    
}

-(NSArray *)parseDictContent:(NSDictionary *)resultDictionary contentTypes:(NSArray *)types{
    
    NSMutableArray *arrayOfContent = [[[NSMutableArray alloc] init] autorelease];
    
    for (int i=0; i< [types count]; i++) {
        
        
        for (int k = 0; k < [[resultDictionary objectForKey:[types objectAtIndex:i]] count]; k++) {
            fContent *content = [[fContent alloc] init] ;
            
            content = [self parseContent:[[resultDictionary objectForKey:[types objectAtIndex:i]] objectAtIndex:k] type:[types objectAtIndex:i]];
            
            [arrayOfContent addObject:content];
            
            [content release];
        }
    }
    
    return arrayOfContent;
    
}





-(fContent *)parseContent:(NSDictionary *)inputContent type:(NSString *) type{
    
    fContent *content = [[fContent alloc] init] ;
    
    content.contentType = type;
    content.uuid = [inputContent objectForKey:@"uuid"];
    content.latitude = [[inputContent objectForKey:@"lat"] floatValue];
    content.longitude = [[inputContent objectForKey:@"lng"] floatValue];
    content.title = [inputContent objectForKey:@"title"];
    content.body = [inputContent objectForKey:@"body"];
    content.author = [inputContent objectForKey:@"author"];
        
    
    if([inputContent objectForKey:@"published_at"] != [NSNull null] )  {
    
        content.publishedAt = [self dateFromString:[inputContent objectForKey:@"published_at"]] ;

    }
    content.link = [inputContent objectForKey:@"link"];
    content.source = [inputContent objectForKey:@"source"];
    content.url = [inputContent objectForKey:@"thumbnail"];
    content.image = [inputContent objectForKey:@"thumbnail"];
    
    content.thumbnail = [inputContent objectForKey:@"thumbnail"];
    content.rating = [[inputContent objectForKey:@"rating"] floatValue];
    if([inputContent objectForKey:@"start_time"] != [NSNull null] )  {
        
        content.localStartTime = [self dateFromString:[inputContent objectForKey:@"start_time"]] ;
        
    }

    if([inputContent objectForKey:@"end_time"] != [NSNull null] )  {
        
        content.localEndTime = [self dateFromString:[inputContent objectForKey:@"end_time"]] ;
        
    }
    
    content.price = [[inputContent objectForKey:@"price"] floatValue];
    content.numberOfBeds = [[inputContent objectForKey:@"number_of_beds"] floatValue];
    content.numberOfBaths  = [[inputContent objectForKey:@"number_of_baths"] floatValue];
    content.squareFeet = [[inputContent objectForKey:@"square_feet"] floatValue];
    content.propertyType  = [inputContent objectForKey:@"property_type"];
    return content;

    
}

-(NSDate *)dateFromString:(NSString *)stringdate{
   
    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *myDate = [[[NSDate alloc] init] autorelease];
    myDate = [dateFormatter dateFromString:stringdate];
    return myDate;
    
}

         

#pragma mark Get Places

-(NSArray *)getPlacesByCity:(NSString *)city province:(NSString *)province country:(NSString *)country locality:(NSString *)locality  page:(int)page pageSize:(int)pageSize  error:(NSError **)error{
    
    
    NSString *url = [NSString stringWithFormat:@"http://geoapi.fwix.com/places.json?api_key=%@&city=%@&province=%@",key,city,province];
    
    
    if ([userID length] >0) {
        url = [url stringByAppendingFormat:@"&user_id=%@",userID];
    }
    
    if ([country length] > 0) {
        url = [url stringByAppendingString:[NSString stringWithFormat:@"&country=%@",country]];
    }
    
    if ([locality length] > 0) {
        url = [url stringByAppendingString:[NSString stringWithFormat:@"&locality=%@",locality]];
    }
    
    
    if (page != 0) {
        url = [url stringByAppendingString:[NSString stringWithFormat:@"&page=%i",page]];
    }
    
    
    if (pageSize != 0) {
        url = [url stringByAppendingString:[NSString stringWithFormat:@"&page_size=%i",pageSize]];
    }

    
    NSLog(@"url :%@", url);
    
    NSError *e;
    
    NSDictionary *resultDictionary = [self sendURL:url withError:&e];
    
    if (!e) {
        if (error!=nil) {
            *error = nil;
        }
        
        return [self parseDictPlaces:resultDictionary];
    }
    else{
        
        if (error!=nil) {
            *error = e;
        }
        
        return nil;
    }
 
}


-(NSArray *)getPlacesByCity:(NSString *)city province:(NSString *)province country:(NSString *)country locality:(NSString *)locality error:(NSError **)error{
    
    
    
    NSError *e;
    NSArray *abc = [self getPlacesByCity:city province:province country:country locality:locality page:0 pageSize:0 error:&e];
    
    if (!e) {
        
        if (error!=nil) {
            *error = nil;
        }
        
        return abc;
    }
    else{
        
        if (error!=nil) {
            *error = e;
        }
        
        return nil;
        
    }
    
    
}

-(NSArray *)getPlacesByCity:(NSString *)city province:(NSString *)province error:(NSError **)error{
    
    NSError *e;
    NSArray *abc = [self getPlacesByCity:city province:province country:nil locality:nil page:0 pageSize:0 error:&e];
    
    if (!e) {
        if (error!=nil) {
            *error = nil;
        }
        
        return abc;
    }
    else{
        
        if (error!=nil) {
            *error = e;
        }
        
        return nil;
        
    }
    
    
}

-(NSArray *)getPlacesByCity:(NSString *)city province:(NSString *)province page:(int)page pageSize:(int)pageSize error:(NSError **)error{
    
    NSError *e;
    NSArray *abc = [self getPlacesByCity:city province:province country:nil locality:nil page:page pageSize:pageSize error:&e];
    
    if (!e) {
        if (error!=nil) {
            *error = nil;
        }
        
        return abc;
    }
    else{
        
        if (error!=nil) {
            *error = e;
        }
        
        return nil;
        
    }
    
    
}
                           

-(NSArray *)getPlacesByPostal:(NSString *)postalCode page:(int)page pageSize:(int)pageSize error:(NSError **)error{

    
   // NSString *key = [[NSUserDefaults standardUserDefaults] objectForKey:@"APIKey"];
   // NSString *userID = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserID"]; 

    
    NSString *url = [NSString stringWithFormat:@"http://geoapi.fwix.com/places.json?api_key=%@&postal_code=%@",key,postalCode];
    
    
    if ([userID length] >0) {
        url = [url stringByAppendingFormat:@"&user_id=%@",userID];
    }
    
    
    if (page != 0) {
        url = [url stringByAppendingString:[NSString stringWithFormat:@"&page=%i",page]];
    }
    
    
    if (pageSize != 0) {
        url = [url stringByAppendingString:[NSString stringWithFormat:@"&page_size=%i",pageSize]];
    }

    NSError *e;
    
    NSDictionary *resultDictionary = [self sendURL:url withError:&e];
    
    
    if (!e) {
        if (error!=nil) {
            *error = nil;
        }
        
        return [self parseDictPlaces:resultDictionary];
    }
    else{
        if (error!=nil) {
            *error = e;
        }
        
        
        return nil;
    }
    
    
}

-(NSArray *)getPlacesByPostal:(NSString *)postalCode error:(NSError **)error{
 
    
    NSError *e;
    NSArray *abc = [self getPlacesByPostal:postalCode page:0 pageSize:0 error:&e];
    
    if (!e) {
        if (error !=nil) {
            *error = nil;
        }
        
        return abc;
    }
    else{
        
        if (error!=nil) {
            *error = e;
        }
        
        return nil;
        
    }
    
}

-(fPlace *)getPlace:(NSString *)uuid  error:(NSError **)error{
    
 //   NSString *key = [[NSUserDefaults standardUserDefaults] objectForKey:@"APIKey"];
 //   NSString *userID = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserID"]; 

    
    NSString *url = [NSString stringWithFormat:@"http://geoapi.fwix.com/places/%@.json?api_key=%@",key,uuid];
    
    
    if ([userID length] >0) {
        url = [url stringByAppendingFormat:@"&user_id=%@",userID];
    }
    
    NSError *e;
    
    NSDictionary *resultDictionary = [self sendURL:url withError:&e];
    
        
    if (!e) {
        if (error != nil) {
            *error = nil;
        }
        
        return [self parsePlace:[resultDictionary objectForKey:@"place"]];
    }
    else{
        
        if (error!=nil) {
            *error = e;
        }
        
        return nil;
    }
    
    
    
}

-(NSArray *)getPlacesByLatitude:(float) latitude longitude:(float)longitude page:(int)page pageSize:(int)pageSize error:(NSError **)error{
   
    
  
    
//    NSString *key = [[NSUserDefaults standardUserDefaults] objectForKey:@"APIKey"];
 //   NSString *userID = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserID"]; 
    

    NSString *url = [NSString stringWithFormat:@"http://geoapi.fwix.com/places.json?api_key=%@&lat=%f&lng=%f",key,latitude ,longitude];
    
    if ([userID length] >0) {
        url = [url stringByAppendingFormat:@"&user_id=%@",userID];
    }
    
    if (page != 0) {
        url = [url stringByAppendingString:[NSString stringWithFormat:@"&page=%i",page]];
    }
    
    
    if (pageSize != 0) {
        url = [url stringByAppendingString:[NSString stringWithFormat:@"&page_size=%i",pageSize]];
    }
    
    NSLog(@"URL : %@",url);
    NSError *e;
    
    NSDictionary *resultDictionary = [self sendURL:url withError:&e];
    
    if (!e) {
        if (error !=nil) {
            *error = nil;
        }
        
        return [self parseDictPlaces:resultDictionary];
    }
    else   {
        if (error != nil) {
            *error = e;
        }
        
        return nil;
        
    }
    
}


-(NSArray *)getPlacesByLatitude:(float) latitude longitude:(float)longitude error:(NSError **)error{
    
    NSError *e;
    
    
    
    NSArray *abc = [self getPlacesByLatitude:latitude longitude:longitude page:0 pageSize:0 error:&e];
    
    if (!e) {
        if (error != nil) {
             *error = nil;
        }
       
        return abc;
    }
    else{
        if (error != nil) {
            *error = e;
        }
        
        return nil;
        
    }
    
    
}



-(NSArray *)parseDictPlaces:(NSDictionary *)resultDictionary{
    NSMutableArray *arrayOfPlaces = [[[NSMutableArray alloc] init] autorelease];
    
    for (int i = 0; i < [[resultDictionary objectForKey:@"places"] count]; i++) {
    
        fPlace *place = [[fPlace alloc] init];
        place = [self parsePlace:[[resultDictionary objectForKey:@"places"] objectAtIndex:i]];
        
        [arrayOfPlaces addObject:place];
        
        [place release];
        
    }
    
    return  arrayOfPlaces;
    
    
}

-(fPlace *)parsePlace:(NSDictionary *)inputPlace{
    
    fPlace *place = [[fPlace alloc] init];
    
    place.uuid = [inputPlace objectForKey:@"uuid"];
    place.name = [inputPlace objectForKey:@"name"];
    place.phoneNumber = [inputPlace objectForKey:@"phone_number"];
    place.latitude = [[inputPlace objectForKey:@"lat"] floatValue];
    place.longitude =[[inputPlace objectForKey:@"lng"] floatValue]; 
    place.location.address = [inputPlace objectForKey:@"address"];
    place.location.city = [inputPlace objectForKey:@"place"];
    place.location.country = [inputPlace objectForKey:@"country"];
    place.location.locality = [inputPlace objectForKey:@"locality"];
    place.location.province = [inputPlace objectForKey:@"province"];
    place.location.postalCode = [inputPlace objectForKey:@"postal_code"];
    place.url = [inputPlace objectForKey:@"link"];
    for (int i = 0; i < [[inputPlace objectForKey:@"categories"] count ]; i++) {
        fCategory *parseCategory = [[fCategory alloc] init];
        
        parseCategory.categoryID = [[[[inputPlace objectForKey:@"categories"] objectAtIndex:i]objectForKey:@"id"] intValue];
        parseCategory.name = [[[inputPlace objectForKey:@"categories"] objectAtIndex:i]objectForKey:@"name"];
        
        [place.category addObject:parseCategory];
        
      
        
        [parseCategory release];
        
        
    }

    

    return place;
    
    
}

#pragma mark Get Location

-(fLocation *)getLocation:(float) latitude longitude:(float) longitude error:(NSError **)error{
    
 //   NSString *key = [[NSUserDefaults standardUserDefaults] objectForKey:@"APIKey"];
  //  NSString *userID = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserID"]; 
    

    
    NSString *url = [NSString stringWithFormat:@"http://geoapi.fwix.com/location.json?api_key=%@&lat=%f&lng=%f",key,latitude ,longitude];

    if ([userID length] >0) {
        url = [url stringByAppendingFormat:@"&user_id=%@",userID];
    }
    
    NSError *e;
    
    NSDictionary *resultDictionary = [self sendURL:url withError:&e];

    
    
    if (!e) {
        fLocation *locationResult = [[fLocation alloc] init] ;
        
        locationResult.country = [resultDictionary objectForKey:@"country"];
        locationResult.city = [resultDictionary objectForKey:@"city"];
        locationResult.locality = [resultDictionary objectForKey:@"locality"];
        locationResult.province = [resultDictionary objectForKey:@"province"];
        
        if (error != nil) {
            *error = nil;
        }
        
        return locationResult;
    }
    else{
        if (error != nil) {
            *error = e;
        }
        
        
        return nil;
        
    }
    
    
    
    
}

#pragma mark Get Categories

-(NSArray *)getCategories:(NSError **)error{
    
  
  //  NSString *key = [[NSUserDefaults standardUserDefaults] objectForKey:@"APIKey"];
  //  NSString *userID = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserID"]; 
    
    
    NSString *url = [NSString stringWithFormat:@"http://geoapi.fwix.com/categories.json?api_key=%@",key];
    
    if ([userID length] >0) {
        url = [url stringByAppendingFormat:@"&user_id=%@",userID];
    }
    
    NSError *e;
    
    
    NSDictionary *resultDictionary = [self sendURL:url withError:&e];
    
    if (!e) {
        NSMutableArray *arrayOfCategories = [[[NSMutableArray alloc] init] autorelease];
        
        
        int count1 = [[resultDictionary objectForKey:@"categories"] count];
        
        for (int i = 0; i < count1; i++) {
            fCategory *category = [[fCategory alloc] init];
            
            category.categoryID = [[[[resultDictionary objectForKey:@"categories"] objectAtIndex:i] objectForKey:@"category_id"] intValue];
            category.name = [[[resultDictionary objectForKey:@"categories"] objectAtIndex:i] objectForKey:@"name"];
            category.parentID=0;
            
            
            
            
            [arrayOfCategories addObject:category];
            int count2 = [[[[resultDictionary objectForKey:@"categories"] objectAtIndex:i] objectForKey:@"categories"] count];
            
            for (int k = 0; k<count2; k++) {
                fCategory *category2 = [[fCategory alloc] init];
                
                category2.categoryID = [[[[[[resultDictionary objectForKey:@"categories"] objectAtIndex:i] objectForKey:@"categories"] objectAtIndex:k] objectForKey:@"category_id"] intValue];
                
                category2.name = [[[[[resultDictionary objectForKey:@"categories"] objectAtIndex:i] objectForKey:@"categories"] objectAtIndex:k] objectForKey:@"name"];
                
                category2.parentID = [[[[[[resultDictionary objectForKey:@"categories"] objectAtIndex:i] objectForKey:@"categories"] objectAtIndex:k] objectForKey:@"parent_id"] intValue];
                
                
                
                [arrayOfCategories addObject:category2];
                
                [category2 release];
            }
            
            
            [category release];
        }
        
        if (error !=nil) {
            *error = nil;
        }
        
        return arrayOfCategories;
        
    }
    else{
        
        if (error != nil) {
            *error = e;
        }
        
        
        return nil;
        
        
    }
    
    
    
}



#pragma mark Helper Functions



-(NSDictionary *)sendURL:(NSString *)jsonURL withError:(NSError **)error{
   
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
	[request setTimeoutInterval:30];
	[request setURL:[NSURL URLWithString:[jsonURL stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]]];
	//NSString *referer = [NSString stringWithFormat:@"Fwix.iPhone.Search.%@,%@",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"],[[UIDevice currentDevice] uniqueIdentifier]];
	//[request addValue:referer forHTTPHeaderField:@"Referer"];
	//[request addValue:@"text/xml" forHTTPHeaderField: @"Content-Type"];
    
    
    NSData *responseDataSerial = [NSURLConnection sendSynchronousRequest:request returningResponse:nil  error:nil];
        
    NSString *responseString = [[NSString alloc] initWithData:responseDataSerial encoding:NSUTF8StringEncoding];

    
    [request release];
    
    NSRange textRange;
    textRange = [responseString rangeOfString:@"message"];
    
    if (textRange.location != NSNotFound) {
       
        NSLog(@"error : %@",[[responseString JSONValue] objectForKey:@"message"]);
        
        *error = [NSError errorWithDomain:[[responseString JSONValue] objectForKey:@"message"] code:0 userInfo:nil];
        
        return nil;
        
    }
    else{
         *error = nil;
    }
   
    
    
    return [responseString JSONValue];
    
    
    
    
    
    
}



@end
