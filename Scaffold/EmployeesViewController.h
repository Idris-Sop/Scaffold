//
//  EmployeesViewController.h
//  Scaffold
//
//  Created by Idris SOP on 2017/08/31.
//  Copyright © 2017 Idris SOP. All rights reserved.
//

#import "ScaffoldViewController.h"
#import "EmployeeTableViewCell.h"
#import "RefineViewController.h"
#import "EmployeeTableHeaderView.h"
#import "EmployeeDetailsViewController.h"

@interface EmployeesViewController : ScaffoldViewController <UITableViewDelegate, UITableViewDataSource, RefineViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UITableView *employeeTableView;
@property (strong, nonatomic) NSMutableArray *employeeArray;
@property (strong, nonatomic) EmployeeTableHeaderView *employeeTableHeaderView;
@end
