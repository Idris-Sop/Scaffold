//
//  ScafflordAPI.h
//  Scaffold
//
//  Created by Idris SOP on 2017/08/31.
//  Copyright © 2017 Idris SOP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScafflordAPI : NSObject

@property (strong, nonatomic) NSURLSessionConfiguration *sessionConfig;
@property (atomic, strong) dispatch_queue_t requestQueue;
+ (ScafflordAPI *)sharedScafflordAPI;


- (void)authenticateUserWithParams:(NSMutableDictionary *)params withCompletion:(void (^) (BOOL success, NSString *token, NSString *message))completion;
- (void)getEmployeeWithParams:(NSMutableDictionary *)params withCompletion:(void (^) (BOOL success,NSMutableArray *employeeArray, NSString *message))completion;
- (void)getUserProfileWithParams:(NSMutableDictionary *)params withCompletion:(void (^) (BOOL success,NSDictionary *UserProfileDict, NSString *message))completion;
@end
