//
//  APIHelper.h
//  Scaffold
//
//  Created by Idris SOP on 2017/08/31.
//  Copyright © 2017 Idris SOP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface APIHelper : NSObject

+ (NSURL *)apiURLWithExtension: (NSString *)extension;
@end
