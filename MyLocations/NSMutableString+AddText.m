//
//  NSMutableString+AddText.m
//  MyLocations
//
//  Created by Ajay Singh on 4/3/15.
//  Copyright (c) 2015 Ajay Singh. All rights reserved.
//

#import "NSMutableString+AddText.h"

@implementation NSMutableString (AddText)

- (void)addText:(NSString *)text withSeparator:(NSString *)separator
{
    if (text != nil) {
        if ([self length] > 0) {
            [self appendString:separator];
        }
        [self appendString:text];
    }
}

@end
