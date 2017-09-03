//
//  ScaffoldViewController.m
//  Scaffold
//
//  Created by Idris SOP on 2017/08/31.
//  Copyright © 2017 Idris SOP. All rights reserved.
//

#import "ScaffoldViewController.h"

@interface ScaffoldViewController ()

@end

@implementation ScaffoldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    UIImageView *narBarImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
//    UIImage *narBarImage = [UIImage imageNamed:@"take4uIcon"];
//    [narBarImageView setImage:narBarImage];
//    [self.navigationItem setTitleView:narBarImageView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    
    //Change the host name here to change the server you want to monitor.
    NSString *remoteHostName = @"www.apple.com";
    NSString *remoteHostLabelFormatString = @"Remote Host label format string";
    
    self.hostReachability = [Reachability reachabilityWithHostName:remoteHostName];
    [self.hostReachability startNotifier];
    [self updateInterfaceWithReachability:self.hostReachability];
    
    self.internetReachability = [Reachability reachabilityForInternetConnection];
    [self.internetReachability startNotifier];
    [self updateInterfaceWithReachability:self.internetReachability];
}

#pragma mark - Reachability implementation

- (void) reachabilityChanged:(NSNotification *)note {
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    [self updateInterfaceWithReachability:curReach];
}


- (void)updateInterfaceWithReachability:(Reachability *)reachability {
    if (reachability == self.hostReachability) {
        NetworkStatus netStatus = [reachability currentReachabilityStatus];
        BOOL connectionRequired = [reachability connectionRequired];
        
        NSString* baseLabelText = @"";
        
        if (connectionRequired)
        {
            baseLabelText = @"Cellular data network is available.\nInternet traffic will be routed through it after a connection is established.";
        }
        else
        {
            baseLabelText = @"Cellular data network is active.\nInternet traffic will be routed through it.";
        }
    }
    
    if (reachability == self.internetReachability) {
        if (reachability.currentReachabilityStatus) {
            self.isInternetReachable = YES;
        } else {
            self.isInternetReachable = NO;
        }
        
    }
    NSLog(@"\nIsInternetReachable: %d", self.isInternetReachable);
    
}


- (void)configureTextField:(UITextField *)textField imageView:(UIImageView *)imageView reachability:(Reachability *)reachability {
    NetworkStatus netStatus = [reachability currentReachabilityStatus];
    BOOL connectionRequired = [reachability connectionRequired];
    NSString* statusString = @"";
    
    switch (netStatus) {
        case NotReachable:        {
            statusString = @"Access Not Available";
            imageView.image = [UIImage imageNamed:@"stop-32.png"] ;
            
            connectionRequired = NO;
            break;
        }
            
        case ReachableViaWWAN:        {
            statusString = @"Reachable WWAN";
            imageView.image = [UIImage imageNamed:@"WWAN5.png"];
            break;
        }
        case ReachableViaWiFi:        {
            statusString= @"Reachable WiFi";
            imageView.image = [UIImage imageNamed:@"Airport.png"];
            break;
        }
    }
    
    if (connectionRequired) {
        NSString *connectionRequiredFormatString = @"Connection Required";
        statusString= [NSString stringWithFormat:connectionRequiredFormatString, statusString];
    }
    textField.text= statusString;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
}

- (void)showLoadingFromView:(UIView *)view {
    [MBProgressHUD showHUDAddedTo:view animated:YES];
}

- (void)hideLoadingFromView:(UIView *)view {
    [MBProgressHUD hideHUDForView:view animated:YES];
}

- (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:title
                                                                        message:message
                                                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive
                                                        handler:^(UIAlertAction *action) {
                                                            NSLog(@"Dismiss button tapped!");
                                                        }];
    
    [controller addAction:alertAction];
    
    [self presentViewController:controller animated:YES completion:nil];
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
