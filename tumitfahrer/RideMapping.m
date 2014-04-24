//
//  RideMapping.m
//  tumitfahrer
//
//  Created by Pawel Kwiecien on 4/11/14.
//  Copyright (c) 2014 Pawel Kwiecien. All rights reserved.
//

#import "RideMapping.h"
#import "UserMapping.h"

@implementation RideMapping

+(RKEntityMapping *)getRidesMapping {
    RKEntityMapping *rideMapping = [RKEntityMapping mappingForEntityForName:@"Ride" inManagedObjectStore:[[RKObjectManager sharedManager] managedObjectStore]];
    rideMapping.identificationAttributes = @[@"rideId"];
    [rideMapping addAttributeMappingsFromDictionary:@{@"id": @"rideId",
                                                      @"departure_place": @"departurePlace",
                                                      @"destination": @"destination",
                                                      @"meeting_point":@"meetingPoint",
                                                      @"departure_time":@"departureTime",
                                                      @"free_seats":@"freeSeats",
                                                      @"duration":@"duration",
                                                      @"distance":@"distance",
                                                      @"created_at": @"createdAt",
                                                      @"updated_at": @"updatedAt"
                                                      }];
    
    return rideMapping;
}

+(RKResponseDescriptor *)getRidesResponseDescriptorWithMapping:(RKEntityMapping *)mapping {
    // create response description for rides
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping                                                                                            method:RKRequestMethodGET pathPattern:@"/api/v2/rides" keyPath:@"rides"                                                                                       statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    return responseDescriptor;
}

+(RKEntityMapping *)postRideMapping {
    
    RKEntityMapping *rideMapping = [RKEntityMapping mappingForEntityForName:@"Ride" inManagedObjectStore:[[RKObjectManager sharedManager] managedObjectStore]];
    rideMapping.identificationAttributes = @[@"rideId"];
    [rideMapping addAttributeMappingsFromDictionary:@{@"id": @"rideId",
                                                      @"departure_place": @"departurePlace",
                                                      @"destination": @"destination",
                                                      @"meeting_point":@"meetingPoint",
                                                      @"departure_time":@"departureTime",
                                                      @"free_seats":@"freeSeats",
                                                      @"duration":@"duration",
                                                      @"distance":@"distance",
                                                      @"created_at": @"createdAt",
                                                      @"updated_at": @"updatedAt"
                                                      }];
    
    [rideMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"driver" toKeyPath:@"driver" withMapping:[UserMapping userMapping]]];
    
    [rideMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"passengers" toKeyPath:@"passengers" withMapping:[UserMapping userMapping]]];
    
    return rideMapping;
    
}

+(RKResponseDescriptor *)postRideResponseDescriptorWithMapping:(RKEntityMapping *)mapping {
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping method:RKRequestMethodPOST pathPattern:@"/api/v2/rides" keyPath:@"ride" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    return responseDescriptor;
}

@end
