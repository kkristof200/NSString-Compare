//
//  NSString+Compare.h
//
//  Created by Kovács Kristóf on 08/08/2017.
//  Copyright © 2017 Kovács Kristóf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Compare)

/*
 Returns the number of differences(characters) between 2 NSStrings
 */
- (int)isSimilarToString:(NSString *)str;

@end
