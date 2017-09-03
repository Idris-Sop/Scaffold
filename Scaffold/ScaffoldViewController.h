//
//  ScaffoldViewController.h
//  Scaffold
//
//  Created by Idris SOP on 2017/08/31.
//  Copyright © 2017 Idris SOP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"

@interface ScaffoldViewController : UIViewController

@property (nonatomic) Reachability *hostReachability;
@property (nonatomic) Reachability *internetReachability;

@property (assign, nonatomic) BOOL isInternetReachable;
@property (assign, nonatomic) BOOL isHostReachable;

- (void)showLoadingFromView:(UIView *)view;
- (void)hideLoadingFromView:(UIView *)view;
- (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message;

@end
