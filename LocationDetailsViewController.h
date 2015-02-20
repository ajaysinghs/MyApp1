//
//  LocationDetailsViewController.h
//  MyLocations
//
//  Created by Ajay Singh on 2/19/15.
//  Copyright (c) 2015 Ajay Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreLocation/CoreLocation.h>

@interface LocationDetailsViewController : UITableViewController

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) CLPlacemark *placemark;

@end
