//
//  RideRequestInformationCell.h
//  tumitfahrer
//
//  Created by Pawel Kwiecien on 5/31/14.
//  Copyright (c) 2014 Pawel Kwiecien. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RideRequestInformationCell : UITableViewCell

+(RideRequestInformationCell *)rideRequestInformationCell;

@property (weak, nonatomic) IBOutlet UILabel *requestInfoLabel;

@end
