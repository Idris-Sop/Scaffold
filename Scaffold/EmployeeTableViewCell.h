//
//  EmployeeTableViewCell.h
//  Scaffold
//
//  Created by Idris SOP on 2017/08/31.
//  Copyright © 2017 Idris SOP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmployeeTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *employeeName;
@property (strong, nonatomic) IBOutlet UILabel *employeeGender;
@property (strong, nonatomic) IBOutlet UILabel *employeePosition;


@end
