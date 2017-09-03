//
//  LoginViewController.m
//  Scaffold
//
//  Created by Idris SOP on 2017/08/31.
//  Copyright © 2017 Idris SOP. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.usernameTF setDelegate:self];
    [self.passwordTF setDelegate:self];
    [self.loginBtn.layer setCornerRadius:3.5];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)loginPressed:(id)sender {
    if (self.isInternetReachable) {
        if ([self validateEnteredDetails]) {
            [self showLoadingFromView:self.view];
            ScafflordAPI *api = [ScafflordAPI sharedScafflordAPI];
            NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
            [params setValue:self.usernameTF.text forKey:@"username"];
            [params setValue:self.passwordTF.text forKey:@"password"];
            
            [api authenticateUserWithParams:params withCompletion:^(BOOL success, NSString *token,NSString *message) {
                if (success) {
                    NSLog(@"Login Success");
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self hideLoadingFromView:self.view];
                        UIStoryboard *mainstoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                        ScafflordTabBarController *tabController = [mainstoryboard instantiateViewControllerWithIdentifier:@"tabController"];
                        [self showViewController:tabController sender:nil];
                    });
                } else {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self hideLoadingFromView:self.view];
                        [self showAlertWithTitle:@"Login" andMessage:message];
                    });
                }
            }];
        }
    }
}

-(BOOL)validateEnteredDetails{
    NSString *msg = @"";
    if ([[self.usernameTF.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""]) {
        //msg = @"Please enter Username";
        msg = @"Please enter Username";
    }
    else if([[self.passwordTF.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""]){
        //msg = @"Please enter Password";
        msg = @"Please enter Password";
        
    }
    if([msg isEqualToString:@""]) {
        return YES;
    } else {
        //show error msg
        [self showAlertWithTitle:@"Invalid Login" andMessage:msg];
        return NO;
    }
}
@end
