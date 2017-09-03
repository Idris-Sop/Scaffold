//
//  EmployeeProfile.h
//  Scaffold
//
//  Created by Idris SOP on 2017/09/03.
//  Copyright © 2017 Idris SOP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmployeeInfoTableViewCell.h"
#import "ContactTableViewCell.h"
#import "AboutTableViewCell.h"
#import "EmployeeTableHeaderView.h"
#import "ReviewTableViewCell.h"
#import "NextKindTableViewCell.h"

@interface EmployeeProfile : UIView <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *employeeDetailsTableView;
@property (strong, nonatomic) NSMutableArray *contentParts;
@property (strong, nonatomic) NSMutableArray *reviewArray;
@property (strong, nonatomic) NSMutableArray *nextKindArray;
@property (strong, nonatomic) NSDictionary *userProfileDict;

- (void)setUserDetails:(NSDictionary *)userDetails;
@end
