//
//  LocationCell.h
//  MyLocations
//
//  Created by Ajay Singh on 2/22/15.
//  Copyright (c) 2015 Ajay Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, weak) IBOutlet UILabel *addressLabel;
@property (nonatomic, weak) IBOutlet UIImageView *photoImageView;
@end
