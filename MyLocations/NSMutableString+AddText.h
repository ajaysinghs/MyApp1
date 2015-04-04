//
//  NSMutableString+AddText.h
//  MyLocations
//
//  Created by Ajay Singh on 4/3/15.
//  Copyright (c) 2015 Ajay Singh. All rights reserved.
//


// This category is created to handle the "null" in street address

#import <Foundation/Foundation.h>

@interface NSMutableString (AddText)

- (void)addText:(NSString *)text withSeparator:(NSString *)separator;

@end
