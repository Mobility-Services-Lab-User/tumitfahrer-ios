//
//  WebserviceRequest.h
//  tumitfahrer
//
//  Created by Pawel Kwiecien on 6/8/14.
//  Copyright (c) 2014 Pawel Kwiecien. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebserviceRequest : NSObject

+(void)getMessagesforRideId:(NSInteger)rideId block:(boolCompletionHandler)block;

@end