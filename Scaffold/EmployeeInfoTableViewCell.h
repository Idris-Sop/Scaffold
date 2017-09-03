//
//  EmployeeInfoTableViewCell.h
//  Scaffold
//
//  Created by Idris SOP on 2017/09/03.
//  Copyright © 2017 Idris SOP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmployeeInfoTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *employeeNameLbl;
@property (strong, nonatomic) IBOutlet UILabel *genderValueLbl;
@property (strong, nonatomic) IBOutlet UILabel *idNumberValueLbl;
@property (strong, nonatomic) IBOutlet UILabel *physicalAddressValueLbl;
@end
