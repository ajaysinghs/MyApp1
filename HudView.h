//
//  HudView.h
//  MyLocations
//
//  Created by Ajay Singh on 2/20/15.
//  Copyright (c) 2015 Ajay Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HudView : UIView

+ (instancetype)hudInView:(UIView *)view animated:(BOOL)animated;

@property (nonatomic, strong) NSString *text;

@end
