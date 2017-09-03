//
//  LoginViewController.h
//  Scaffold
//
//  Created by Idris SOP on 2017/08/31.
//  Copyright © 2017 Idris SOP. All rights reserved.
//

#import "ScaffoldViewController.h"
#import "ScafflordTabBarController.h"

@interface LoginViewController : ScaffoldViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *usernameTF;
@property (strong, nonatomic) IBOutlet UITextField *passwordTF;
@property (strong, nonatomic) IBOutlet UIButton *loginBtn;
- (IBAction)loginPressed:(id)sender;
@end
