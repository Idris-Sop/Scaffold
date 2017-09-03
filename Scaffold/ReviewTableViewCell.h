//
//  ReviewTableViewCell.h
//  Scaffold
//
//  Created by Idris SOP on 2017/09/03.
//  Copyright © 2017 Idris SOP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReviewTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *dateValueLbl;
@property (strong, nonatomic) IBOutlet UILabel *salaryValueLbl;
@property (strong, nonatomic) IBOutlet UILabel *typeValueLbl;

@end
