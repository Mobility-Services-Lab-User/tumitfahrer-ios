//
//  RideMapping.m
//  tumitfahrer
//
//  Created by Pawel Kwiecien on 4/11/14.
//  Copyright (c) 2014 Pawel Kwiecien. All rights reserved.
//

#import "RideMapping.h"
#import "UserMapping.h"
#import "RideSearch.h"
#import "RequestMapping.h"
#import "IdsMapping.h"
#import "StatusMapping.h"
#import "RatingMapping.h"
#import "ConversationMapping.h"

@implementation RideMapping

+(RKEntityMapping *)generalRideMapping {
    RKEntityMapping *rideMapping = [RKEntityMapping mappingForEntityForName:@"Ride" inManagedObjectStore:[[RKObjectManager sharedManager] managedObjectStore]];
    rideMapping.identificationAttributes = @[@"rideId"];
    
    [rideMapping addAttributeMappingsFromDictionary:@{@"id": @"rideId",
                                                      @"departure_place": @"departurePlace",
                                                      @"destination": @"destination",
                                                      @"departure_latitude": @"departureLatitude",
                                                      @"departure_longitude":@"departureLongitude",
                                                      @"destination_latitude" : @"destinationLatitude",
                                                      @"destination_longitude" : @"destinationLongitude",
                                                      @"meeting_point":@"meetingPoint",
                                                     
                                                      @"free_seats":@"freeSeats",
                                                      @"ride_type":@"rideType",
                                                      @"is_ride_request":@"isRideRequest",
                                                      @"price":@"price",
                                                      @"is_paid":@"isPaid",
                                                      @"car":@"car",
                                                      @"last_cancel_time":@"lastCancelTime",
                                                      @"regular_ride_id":@"regularRideId",@"departure_time":@"departureTime", @"created_at": @"createdAt",    @"updated_at": @"updatedAt"
                                                     
                                                      }];//

    
    [rideMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"ride_owner" toKeyPath:@"rideOwner" withMapping:[UserMapping userMapping]]];
    
   [rideMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"passengers" toKeyPath:@"passengers" withMapping:[UserMapping userMapping]]];
    
    [rideMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"requests" toKeyPath:@"requests" withMapping:[RequestMapping requestMapping]]];
    
    [rideMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"ratings" toKeyPath:@"ratings" withMapping:[RatingMapping ratingMapping]]];
    
    [rideMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"conversations" toKeyPath:@"conversations" withMapping:[ConversationMapping simpleConversationMapping]]];
    
    return rideMapping;
}

+(RKObjectMapping*)getRideIds {
    RKObjectMapping *responseMapping = [RKObjectMapping mappingForClass:[IdsMapping class]];
    [responseMapping addAttributeMappingsFromDictionary:@{@"ids":@"ids"}];
    return responseMapping;
}

+(RKResponseDescriptor *)getRideIdsresponseDescriptorWithMapping:(RKObjectMapping *)mapping {
    // create response description for user's session
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping                                                                                            method:RKRequestMethodGET                                                                                       pathPattern:@"/api/v3/rides/ids"                                                                                           keyPath:nil                                                                                     statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    return responseDescriptor;
}

+(RKResponseDescriptor *)getRidesResponseDescriptorWithMapping:(RKEntityMapping *)mapping {
    // create response description for rides
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping                                                                                            method:RKRequestMethodGET pathPattern:API_RIDES keyPath:@"rides"                                                                                       statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    return responseDescriptor;
}

+(RKResponseDescriptor *)getSimpleRidesResponseDescriptorWithMapping:(RKEntityMapping *)mapping {
    // create response description for rides
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping                                                                                            method:RKRequestMethodGET pathPattern:API_USERS_RIDES keyPath:@"rides"                                                                                       statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    return responseDescriptor;
}

+(RKResponseDescriptor *)getSingleRideResponseDescriptorWithMapping:(RKEntityMapping *)mapping {
    // create response description for rides
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping                                                                                            method:RKRequestMethodGET pathPattern:@"/api/v3/rides/:rideId" keyPath:@"ride"                                                                                      statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    return responseDescriptor;
}

+(RKEntityMapping *)postRideMapping {
    
    RKEntityMapping *rideMapping = [self generalRideMapping];
    return rideMapping;
}

+(RKResponseDescriptor *)postRideResponseDescriptorWithMapping:(RKEntityMapping *)mapping {
    
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor
                                                responseDescriptorWithMapping:mapping method:RKRequestMethodPOST pathPattern:API_USERS_RIDES keyPath:@"ride" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    return responseDescriptor;
}

+(RKResponseDescriptor *)postRegularRideResponseDescriptorWithMapping:(RKEntityMapping *)mapping {
    
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor
                                                responseDescriptorWithMapping:mapping method:RKRequestMethodPOST pathPattern:API_USERS_RIDES keyPath:@"rides" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    return responseDescriptor;
}

+(RKObjectMapping *)putRideMapping {
    RKObjectMapping *responseMapping = [RKObjectMapping mappingForClass:[StatusMapping class]];
    [responseMapping addAttributeMappingsFromDictionary:@{@"message":@"message"}];
    
    return responseMapping;
}

+(RKResponseDescriptor *)putRideResponseDescriptorWithMapping:(RKObjectMapping *)mapping {
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping                                                                                            method:RKRequestMethodPUT                                                                                      pathPattern:API_PUT_USERS_RIDES                                                                                          keyPath:nil                                                                                       statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    return responseDescriptor;
}



@end
