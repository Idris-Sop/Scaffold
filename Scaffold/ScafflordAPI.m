//
//  ScafflordAPI.m
//  Scaffold
//
//  Created by Idris SOP on 2017/08/31.
//  Copyright © 2017 Idris SOP. All rights reserved.
//

#import "ScafflordAPI.h"

@implementation ScafflordAPI

+ (ScafflordAPI*)sharedScafflordAPI {
    static ScafflordAPI *sharedScafflordAPI;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedScafflordAPI = [[ScafflordAPI alloc] init];
    });
    return sharedScafflordAPI;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupNSURLConfig];
        self.requestQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    }
    return self;
}

- (void)setupNSURLConfig {
    self.sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.sessionConfig.allowsCellularAccess = YES;
    self.sessionConfig.timeoutIntervalForRequest = 60.0;
    self.sessionConfig.HTTPMaximumConnectionsPerHost = 5;
}

- (NSString *)buildFormParameters:(NSDictionary *)parameters {
    NSString * responseString = @"";
    BOOL shouldAddAnd = NO;
    for (NSString *key in parameters) {
        if (shouldAddAnd) {
            responseString = [NSString stringWithFormat:@"%@&", responseString];
        }
        responseString = [NSString stringWithFormat:@"%@%@=%@", responseString, key, [parameters valueForKey:key]];
        
        shouldAddAnd = YES;
    }
    return responseString;
}

- (void)authenticateUserWithParams:(NSMutableDictionary *)params withCompletion:(void (^)(BOOL, NSString *, NSString *))completion {
    NSURLSession *session = [NSURLSession sessionWithConfiguration:self.sessionConfig];
    
    NSMutableURLRequest *requestURL = [NSMutableURLRequest requestWithURL:[APIHelper apiURLWithExtension:@"api-token-auth/"]];
    requestURL.HTTPMethod = @"POST";
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:0 error: &error];
    [requestURL setHTTPBody:jsonData];
    [requestURL setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:requestURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *resp = (NSHTTPURLResponse *)response;
        NSLog(@"Response %ld", (long)resp.statusCode);
        if (!error && resp.statusCode == 200) {
            NSObject *JSONtoken = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            NSLog(@"JSONtoken: %@", JSONtoken);
            
            if ([JSONtoken valueForKey:@"token"] != nil) {
                NSString *authentication = [@"Token " stringByAppendingString:[JSONtoken valueForKey:@"token"]];
                [[NSUserDefaults standardUserDefaults] setValue:authentication forKey:@"token"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                completion (YES, authentication, nil);
            } else {
                NSString *responseBody = @"An error occured. Please check you internet connection and try again later.";
                completion(NO, nil, responseBody);
            }
        } else {
            NSObject *responseBody = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            NSLog(@"responseBody: %@", responseBody);
            NSArray *errorArray = [responseBody valueForKey:@"non_field_errors"];
            completion (NO, nil,[errorArray objectAtIndex:0]);
        }
    }];
    [dataTask resume];
}

- (void)getEmployeeWithParams:(NSMutableDictionary *)params withCompletion:(void (^)(BOOL, NSMutableArray *, NSString *))completion {
    NSURLSession *session = [NSURLSession sessionWithConfiguration:self.sessionConfig];
    
    NSMutableURLRequest *requestURL = [NSMutableURLRequest requestWithURL:[APIHelper apiURLWithExtension:[NSString stringWithFormat:@"api/employee/?%@", [self buildFormParameters:params]]]];
    requestURL.HTTPMethod = @"GET";
    [requestURL setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"token"] forHTTPHeaderField:@"Authorization"];
    NSLog(@"TOKEN: %@", [[NSUserDefaults standardUserDefaults] valueForKey:@"token"]);
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:requestURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *resp = (NSHTTPURLResponse *)response;
        NSLog(@"Response %ld", (long)resp.statusCode);
        if (!error && resp.statusCode == 200) {
            NSMutableArray *employeeArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            NSLog(@"employeeArray: %@", employeeArray);
            completion (YES, employeeArray, nil);
        } else {
            NSString *responseBody = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"responseBody: %@", responseBody);
            completion(NO, nil, responseBody);
        }
    }];
    [dataTask resume];
}

- (void)getUserProfileWithParams:(NSMutableDictionary *)params withCompletion:(void (^)(BOOL, NSDictionary *, NSString *))completion {
    NSURLSession *session = [NSURLSession sessionWithConfiguration:self.sessionConfig];
    
    NSMutableURLRequest *requestURL = [NSMutableURLRequest requestWithURL:[APIHelper apiURLWithExtension:@"api/employee/me/"]];
    requestURL.HTTPMethod = @"GET";
    [requestURL setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"token"] forHTTPHeaderField:@"Authorization"];
    NSLog(@"TOKEN: %@", [[NSUserDefaults standardUserDefaults] valueForKey:@"token"]);
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:requestURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *resp = (NSHTTPURLResponse *)response;
        NSLog(@"Response %ld", (long)resp.statusCode);
        if (!error && resp.statusCode == 200) {
            NSDictionary *employeeDetailsDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            NSLog(@"employeeDetailsDict: %@", employeeDetailsDict);
            completion (YES, employeeDetailsDict, nil);
        } else {
            NSString *responseBody = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"responseBody: %@", responseBody);
            completion(NO, nil, responseBody);
        }
    }];
    [dataTask resume];
}

@end
