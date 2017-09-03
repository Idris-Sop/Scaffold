//
//  APIHelper.m
//  Scaffold
//
//  Created by Idris SOP on 2017/08/31.
//  Copyright © 2017 Idris SOP. All rights reserved.
//

#import "APIHelper.h"


@implementation APIHelper


+ (NSURL *)apiURLWithExtension:(NSString *)extension {
    NSString *baseURL = BASEURL;
    NSString * properlyEncodedString = [baseURL stringByAppendingString:[extension stringByAddingPercentEncodingWithAllowedCharacters: [NSCharacterSet URLFragmentAllowedCharacterSet]]];

    NSLog(@"properlyEncodedString: %@", properlyEncodedString);
    
    NSLog(@"properlyExncodedString URL: %@", [NSURL URLWithString:properlyEncodedString]);
    return [NSURL URLWithString:properlyEncodedString];
}

@end
