//
//  UserMapping.m
//  tumitfahrer
//
//  Created by Pawel Kwiecien on 4/11/14.
//  Copyright (c) 2014 Pawel Kwiecien. All rights reserved.
//

#import "UserMapping.h"
#import "StatusMapping.h"

@implementation UserMapping

+(RKEntityMapping *)userMapping {
    RKEntityMapping *userMapping = [RKEntityMapping mappingForEntityForName:@"User" inManagedObjectStore:[[RKObjectManager sharedManager] managedObjectStore]];
    userMapping.identificationAttributes = @[ @"userId" ];
    [userMapping addAttributeMappingsFromDictionary:@{
                                                         @"id":             @"userId",
                                                         @"first_name":     @"firstName",
                                                         @"last_name":      @"lastName",
                                                         @"email":          @"email",
                                                         @"is_student":     @"isStudent",
                                                         @"phone_number":   @"phoneNumber",
                                                         @"car":            @"car",
                                                         @"department":     @"department",
                                                         @"created_at":     @"createdAt",
                                                         @"updated_at":     @"updatedAt"}];
    
    return userMapping;
}

+(RKObjectMapping *)postUserMapping {
    RKObjectMapping *responseMapping = [RKObjectMapping mappingForClass:[StatusMapping class]];
    [responseMapping addAttributeMappingsFromDictionary:@{@"message":@"message"}];
    
    return responseMapping;
}

+(RKResponseDescriptor *)postUserResponseDescriptorWithMapping:(RKObjectMapping *)mapping {
    // create response description for user's session
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping                                                                                            method:RKRequestMethodPOST                                                                                       pathPattern:@"/api/v2/users"                                                                                           keyPath:nil                                                                                       statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    return responseDescriptor;
}

@end
