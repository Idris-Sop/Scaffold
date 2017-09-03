//
//  EmployeeDetailsViewController.h
//  Scaffold
//
//  Created by Idris SOP on 2017/09/03.
//  Copyright © 2017 Idris SOP. All rights reserved.
//

#import "ScaffoldViewController.h"
#import "EmployeeDetails.h"

@interface EmployeeDetailsViewController : UIViewController

@property (nonatomic, strong) EmployeeDetails *employeeDetails;


- (void)setEmployeeDetailsDict:(NSDictionary *)employeeDetails;
@end
