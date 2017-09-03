//
//  ProfileViewController.m
//  Scaffold
//
//  Created by Idris SOP on 2017/08/31.
//  Copyright © 2017 Idris SOP. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"My Profile";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    if (self.isInternetReachable) {
        [self showLoadingFromView:self.view];
        ScafflordAPI *api = [ScafflordAPI sharedScafflordAPI];
        NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
        [api getUserProfileWithParams:params withCompletion:^(BOOL success, NSDictionary *UserProfileDict, NSString *message) {
            if (success) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.employeeProfile = [[EmployeeProfile alloc]initWithFrame:self.view.frame];
                    [self.employeeProfile setUserDetails:UserProfileDict];
                    [self.view addSubview:self.employeeProfile];
                    [self hideLoadingFromView:self.view];
                });
            } else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self hideLoadingFromView:self.view];
                    [self showAlertWithTitle:@"Invalid Login" andMessage:message];
                });
            }
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
