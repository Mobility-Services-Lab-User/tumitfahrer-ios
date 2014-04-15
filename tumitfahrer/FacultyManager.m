//
//  Faculty.m
//  tumitfahrer
//
//  Created by Pawel Kwiecien on 4/13/14.
//  Copyright (c) 2014 Pawel Kwiecien. All rights reserved.
//

#import "FacultyManager.h"
#import "Faculty.h"

@interface FacultyManager ()

@property (nonatomic, strong) NSMutableArray *facultyArray;

@end

@implementation FacultyManager

+(instancetype)sharedInstance {
    static FacultyManager *sharedFaculty = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedFaculty = [[self alloc] init];
    });
    return sharedFaculty;
}

-(instancetype)init {
    self = [super init];
    if(self) {
        self.facultyArray = [[NSMutableArray alloc] init];
        [self initFaculties];
    }
    return self;
}

-(void)initFaculties {
    [self.facultyArray addObject:[[Faculty alloc] initWithName:@"Architecture" facultyId:0]];
    [self.facultyArray addObject:[[Faculty alloc] initWithName:@"Chemistry" facultyId:1]];
    [self.facultyArray addObject:[[Faculty alloc] initWithName:@"Civil, Geo, Env. Eng." facultyId:2]];
    [self.facultyArray addObject:[[Faculty alloc] initWithName:@"Electrical Engineering." facultyId:3]];
    [self.facultyArray addObject:[[Faculty alloc] initWithName:@"Informatics" facultyId:4]];
    [self.facultyArray addObject:[[Faculty alloc] initWithName:@"Life and Food Science" facultyId:5]];
    [self.facultyArray addObject:[[Faculty alloc] initWithName:@"Mathematics" facultyId:6]];
    [self.facultyArray addObject:[[Faculty alloc] initWithName:@"Mechnical Engineering" facultyId:7]];
    [self.facultyArray addObject:[[Faculty alloc] initWithName:@"Medicine" facultyId:8]];
    [self.facultyArray addObject:[[Faculty alloc] initWithName:@"Phisics" facultyId:9]];
    [self.facultyArray addObject:[[Faculty alloc] initWithName:@"Sport and Health Science" facultyId:10]];
    [self.facultyArray addObject:[[Faculty alloc] initWithName:@"TUM School of Education" facultyId:11]];
    [self.facultyArray addObject:[[Faculty alloc] initWithName:@"TUM School of Management" facultyId:12]];
}

-(NSArray *)allFaculties {
    return self.facultyArray;
}

-(NSString *)nameOfFacultyAtIndex:(NSInteger)index {
    Faculty *faculty = [self.facultyArray objectAtIndex:index];
    return faculty.name;
}

@end