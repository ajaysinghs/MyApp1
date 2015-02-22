//
//  HudView.m
//  MyLocations
//
//  Created by Ajay Singh on 2/20/15.
//  Copyright (c) 2015 Ajay Singh. All rights reserved.
//

#import "HudView.h"

@implementation HudView


+ (instancetype)hudInView:(UIView *)view animated:(BOOL)animated;
{
    HudView *hudView = [[HudView alloc] initWithFrame:view.bounds];
    
    hudView.opaque = NO;
    [view addSubview:hudView];
    view.userInteractionEnabled = NO;
    
    [hudView showAnimated:animated];
    
    //hudView.backgroundColor = [UIColor colorWithRed:1.0f green:0 blue:0 alpha:0.5f];
    
    return hudView;
}


-(void)drawRect:(CGRect)rect
{
    //to make hud rectangle
    const CGFloat boxWidth = 96.0f;
    const CGFloat boxHeight = 96.0f;
    
    CGRect boxRect = CGRectMake(roundf(self.bounds.size.width - boxWidth)/2.0f,
                                roundf(self.bounds.size.height - boxHeight)/2.0f,
                                boxWidth,
                                boxHeight);
    
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:boxRect cornerRadius:10.0f];
    //[[UIColor colorWithWhite:0.3f alpha:0.8f] setFill];
    [[UIColor colorWithRed:0.5f green:1.0f blue:0.5f alpha:0.8f] setFill];
    [roundedRect fill];
    
    //to add checkmark image in Hud
    UIImage *image = [UIImage imageNamed:@"Checkmark"];
    CGPoint imagePoint = CGPointMake(
                                     self.center.x - roundf(image.size.width / 2.0f),
                                     self.center.y - roundf(image.size.height / 2.0f) - boxHeight / 8.0f);
    [image drawAtPoint:imagePoint];
    
    
    //to add text in Hud
    NSDictionary *attributes = @{NSFontAttributeName : [UIFont systemFontOfSize:16.0f],
                                  NSForegroundColorAttributeName: [UIColor whiteColor]
                                 };
    CGSize textSize = [self.text sizeWithAttributes:attributes];
    
    CGPoint textPoint = CGPointMake(
                                    self.center.x - roundf(textSize.width /2.0f),
                                    self.center.y - roundf(textSize.height /2.0f) + boxHeight / 4.0f);
    [self.text drawAtPoint:textPoint withAttributes:attributes];

}



-(void)showAnimated:(BOOL)animated
{
    if (animated) {
        self.alpha = 0.0f;
        self.transform = CGAffineTransformMakeScale(2.0f, 2.0f);
        
        [UIView animateWithDuration:0.3 animations:^{
            self.alpha = 1.0f;
            self.transform = CGAffineTransformIdentity;
        }];
    
     }

}

@end






























