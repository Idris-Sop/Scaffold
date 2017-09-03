//
//  NextKindTableViewCell.h
//  Scaffold
//
//  Created by Idris SOP on 2017/09/03.
//  Copyright © 2017 Idris SOP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NextKindTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *nameValueLbl;
@property (strong, nonatomic) IBOutlet UILabel *relationshipValueLbl;
@property (strong, nonatomic) IBOutlet UILabel *phoneValueLbl;
@property (strong, nonatomic) IBOutlet UILabel *emailValueLbl;
@property (strong, nonatomic) IBOutlet UILabel *physicalAddressValueLbl;

@end
