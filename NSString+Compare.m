//
//  NSString+Compare.m
//
//  Created by Kovács Kristóf on 08/08/2017.
//  Copyright © 2017 Kovács Kristóf. All rights reserved.
//

#import "NSString+Compare.h"

@implementation NSString (Compare)

- (int)isSimilarToString:(NSString *)str {
    const char *char1 = [self UTF8String];
    const char *char2 = [str UTF8String];

    return levenshtein_distance(char1, (int)self.length, char2, (int)str.length);
}

// len_s and len_t are the number of characters in string s and t respectively
int levenshtein_distance(const char *s, int len_s, const char *t, int len_t) {
    int cost;

    /* base case: empty strings */
    if (len_s == 0) return len_t;

    if (len_t == 0) return len_s;

    /* test if last characters of the strings match */
    if (s[len_s - 1] == t[len_t - 1]) cost = 0;
    else cost = 1;

    /* return minimum of delete char from s, delete char from t, and delete char from both */
    return MIN(MIN(levenshtein_distance(s, len_s - 1, t, len_t) + 1,
                   levenshtein_distance(s, len_s, t, len_t - 1) + 1), levenshtein_distance(s, len_s - 1, t, len_t - 1) + cost);
}

@end
