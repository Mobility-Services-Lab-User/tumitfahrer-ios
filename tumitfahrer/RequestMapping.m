//
//  RequestMapping.m
//  tumitfahrer
//
//  Created by Pawel Kwiecien on 5/3/14.
//  Copyright (c) 2014 Pawel Kwiecien. All rights reserved.
//

#import "RequestMapping.h"
#import "StatusMapping.h"

@implementation RequestMapping

+(RKEntityMapping *)requestMapping {
    
    RKEntityMapping *requestMapping = [RKEntityMapping mappingForEntityForName:@"Request" inManagedObjectStore:[[RKObjectManager sharedManager] managedObjectStore]];
    requestMapping.identificationAttributes = @[@"requestId"];
    [requestMapping addAttributeMappingsFromDictionary:@{@"id": @"requestId",
                                                      @"ride_id":@"rideId",
                                                      @"passenger_id":@"passengerId",
                                                      @"requested_from":@"requestedFrom",
                                                      @"request_to":@"requestedTo",
                                                      @"ride_type":@"rideType",
                                                      @"created_at": @"createdAt",
                                                      @"updated_at": @"updatedAt"
                                                      }];
    return requestMapping;
}

+(RKResponseDescriptor *)postRequestResponseDescriptorWithMapping:(RKEntityMapping *)mapping {
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping                                                                                            method:RKRequestMethodPOST                                                                                       pathPattern:API_RIDES_REQUESTS                                                                                          keyPath:@"request"                                                                                       statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    return responseDescriptor;
}


+(RKObjectMapping *)putRequestMapping {
    RKObjectMapping *responseMapping = [RKObjectMapping mappingForClass:[StatusMapping class]];
    [responseMapping addAttributeMappingsFromDictionary:@{@"message":@"message"}];
    
    return responseMapping;
}

+(RKResponseDescriptor *)putRequestResponseDescriptorWithMapping:(RKObjectMapping *)mapping {
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping                                                                                            method:RKRequestMethodPUT                                                                                      pathPattern:API_RIDES_REQUEST                                                                                          keyPath:nil                                                                                       statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    return responseDescriptor;
}

+(RKResponseDescriptor *)getRequestResponseDescriptorWithMapping:(RKObjectMapping *)mapping {
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping                                                                                            method:RKRequestMethodGET                                                                                      pathPattern:API_RIDES_REQUEST                                                                                          keyPath:nil                                                                                       statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    return responseDescriptor;
}

@end
