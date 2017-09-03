//
//  EmployeeProfile.m
//  Scaffold
//
//  Created by Idris SOP on 2017/09/03.
//  Copyright © 2017 Idris SOP. All rights reserved.
//

#import "EmployeeProfile.h"

@implementation EmployeeProfile

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                              owner:self
                                            options:nil] objectAtIndex:0];
        self.frame = frame;
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout {
    [self.employeeDetailsTableView setDelegate:self];
    [self.employeeDetailsTableView setDataSource:self];
    [self.employeeDetailsTableView sizeToFit];
    [self.employeeDetailsTableView setContentInset:UIEdgeInsetsMake(0, 20, 0, 20)];
    [self.employeeDetailsTableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    [self.employeeDetailsTableView registerNib:[UINib nibWithNibName:@"EmployeeInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"employeeInfoCell"];
    [self.employeeDetailsTableView registerNib:[UINib nibWithNibName:@"ContactTableViewCell" bundle:nil] forCellReuseIdentifier:@"contactCell"];
    [self.employeeDetailsTableView registerNib:[UINib nibWithNibName:@"AboutTableViewCell" bundle:nil] forCellReuseIdentifier:@"aboutCell"];
    [self.employeeDetailsTableView registerNib:[UINib nibWithNibName:@"ReviewTableViewCell" bundle:nil] forCellReuseIdentifier:@"reviewCell"];
    [self.employeeDetailsTableView registerNib:[UINib nibWithNibName:@"NextKindTableViewCell" bundle:nil] forCellReuseIdentifier:@"nextKindCell"];
}

- (void)setUserDetails:(NSDictionary *)userDetails {
    self.userProfileDict = userDetails;
    self.reviewArray = [userDetails valueForKey:@"employee_review"];
    self.nextKindArray = [userDetails valueForKey:@"employee_next_of_kin"];
    self.contentParts = [[NSMutableArray alloc]init];
    [self.contentParts addObject:@{@"title": @"Employee Profile", @"image": @"profile", @"items": @""}];
    [self.contentParts addObject:@{@"title": @"About", @"image": @"info", @"items": @""}];
    [self.contentParts addObject:@{@"title": @"Get in touch", @"image": @"contact", @"items": [NSMutableArray arrayWithArray:@[[NSMutableDictionary dictionaryWithDictionary:
                                                                                                                                @{@"image" : @"phone",
                                                                                                                                  @"label" : [userDetails valueForKey:@"phone_number"]}],
                                                                                                                               [NSMutableDictionary dictionaryWithDictionary:
                                                                                                                                @{@"image" : @"email",
                                                                                                                                  @"label" : [userDetails valueForKey:@"email"]}]
                                                                                                                               
                                                                                                                               ]]}];
    [self.contentParts addObject:@{@"title": @"Review", @"image": @"review", @"items": [NSMutableArray arrayWithArray:self.reviewArray]}];
    [self.contentParts addObject:@{@"title": @"Next Kind", @"image": @"nextKind", @"items": [NSMutableArray arrayWithArray:self.nextKindArray]}];
    
    NSLog(@"Content Part: %@", self.contentParts);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //NSLog(@"Number of section: %lu", (unsigned long)[self.contentParts count]);
    return [self.contentParts count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numberOfRows;
    if ([[(self.contentParts)[section] valueForKey:@"title"] isEqualToString:@"About"] || [[(self.contentParts)[section] valueForKey:@"title"] isEqualToString:@"Employee Profile"]) {
        numberOfRows = 1;
    } else {
        numberOfRows = [[(self.contentParts)[section] valueForKey:@"items"] count];
    }
    return numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    if ([[(self.contentParts)[indexPath.section] valueForKey:@"title"] isEqualToString:@"Employee Profile"]) {
        NSString *cellIdentifier = @"employeeInfoCell";
        EmployeeInfoTableViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        NSDictionary *userDict = [self.userProfileDict valueForKey:@"user"];
        [customCell.employeeNameLbl setText:[[[userDict valueForKey:@"first_name"] stringByAppendingString:@" "] stringByAppendingString:[userDict valueForKey:@"last_name"]]];
        [customCell.genderValueLbl setText:[self getValueNameFromValueId:[self.userProfileDict valueForKey:@"gender"] andArray:genderArray()]];
        [customCell.physicalAddressValueLbl setText:[self.userProfileDict valueForKey:@"physical_address"]];
        [customCell.idNumberValueLbl setText:[self.userProfileDict valueForKey:@"id_number"]];        [customCell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell = customCell;
        [cell setNeedsLayout];
        [cell layoutIfNeeded];
        [cell layoutSubviews];
        [cell setNeedsUpdateConstraints];
        [cell updateConstraintsIfNeeded];
    } else if ([[(self.contentParts)[indexPath.section] valueForKey:@"title"] isEqualToString:@"About"]) {
        NSString *cellIdentifier = @"aboutCell";
        AboutTableViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        NSDictionary *positionDict = [self.userProfileDict valueForKey:@"position"];
        [customCell.positionValueLbl setText:[positionDict valueForKey:@"name"]];
        [customCell.levelValueLbl setText:[positionDict valueForKey:@"level"]];
        [customCell.personalEmailValueLbl setText:[self.userProfileDict valueForKey:@"personal_email"]];
        [customCell.taxNumberValueLbl setText:[self.userProfileDict valueForKey:@"tax_number"]];
        [customCell.gitHubUserValueLbl setText:[self.userProfileDict valueForKey:@"github_user"]];
        [customCell.dobValueLbl setText:[self.userProfileDict valueForKey:@"birth_date"]];
        [customCell.raceValueLbl setText:[self getValueNameFromValueId:[self.userProfileDict valueForKey:@"race"] andArray:raceArray()]];
        [customCell.yearsWorkedValueLbl setText:[[self.userProfileDict valueForKey:@"years_worked"] stringValue]];
        [customCell.startDateValueLbl setText:[self.userProfileDict valueForKey:@"start_date"]];
        [customCell.isForeignerValueLbl setText:[[self.userProfileDict valueForKey:@"is_foreigner"] stringValue]];
        [customCell.leaveDayRemainValueLbl setText:[self.userProfileDict valueForKey:@"leave_remaining"]];
        [customCell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell = customCell;
        [cell setNeedsLayout];
        [cell layoutIfNeeded];
        [cell layoutSubviews];
        [cell setNeedsUpdateConstraints];
        [cell updateConstraintsIfNeeded];
    } else if ([[(self.contentParts)[indexPath.section] valueForKey:@"title"] isEqualToString:@"Get in touch"]) {
        NSMutableArray *items = [(self.contentParts)[indexPath.section] valueForKey:@"items"];
        NSString *cellIdentifier = @"contactCell";
        ContactTableViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        [customCell.contactIconImgView setImage:[UIImage imageNamed:[[items objectAtIndex:indexPath.row] valueForKey:@"image"]]];
        [customCell.contactLbl setText:[[items objectAtIndex:indexPath.row] valueForKey:@"label"]];
        [customCell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell = customCell;
        [cell setNeedsLayout];
        [cell layoutIfNeeded];
        [cell layoutSubviews];
        [cell setNeedsUpdateConstraints];
        [cell updateConstraintsIfNeeded];
    } else if ([[(self.contentParts)[indexPath.section] valueForKey:@"title"] isEqualToString:@"Review"]) {
        NSMutableArray *items = [(self.contentParts)[indexPath.section] valueForKey:@"items"];
        NSString *cellIdentifier = @"reviewCell";
        ReviewTableViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        [customCell.dateValueLbl setText:[[items objectAtIndex:indexPath.row] valueForKey:@"date"]];
        [customCell.salaryValueLbl setText:[[items objectAtIndex:indexPath.row] valueForKey:@"salary"]];
        [customCell.typeValueLbl setText:[self getValueNameFromValueId:[[items objectAtIndex:indexPath.row] valueForKey:@"type"] andArray:reviewTypeArray()]];
        [customCell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell = customCell;
        [cell setNeedsLayout];
        [cell layoutIfNeeded];
        [cell layoutSubviews];
        [cell setNeedsUpdateConstraints];
        [cell updateConstraintsIfNeeded];
    } else if ([[(self.contentParts)[indexPath.section] valueForKey:@"title"] isEqualToString:@"Next Kind"]) {
        NSMutableArray *items = [(self.contentParts)[indexPath.section] valueForKey:@"items"];
        NSString *cellIdentifier = @"nextKindCell";
        NextKindTableViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        [customCell.nameValueLbl setText:[[items objectAtIndex:indexPath.row] valueForKey:@"name"]];
        [customCell.relationshipValueLbl setText:[[items objectAtIndex:indexPath.row] valueForKey:@"relationship"]];
        [customCell.phoneValueLbl setText:[[items objectAtIndex:indexPath.row] valueForKey:@"phone_number"]];
        [customCell.emailValueLbl setText:[[items objectAtIndex:indexPath.row] valueForKey:@"email"]];
        [customCell.physicalAddressValueLbl setText:[[items objectAtIndex:indexPath.row] valueForKey:@"physical_address"]];
        [customCell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell = customCell;
        [cell setNeedsLayout];
        [cell layoutIfNeeded];
        [cell layoutSubviews];
        [cell setNeedsUpdateConstraints];
        [cell updateConstraintsIfNeeded];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat rowHeight = 0;
    if ([[(self.contentParts)[indexPath.section] valueForKey:@"title"] isEqualToString:@"Employee Profile"]) {
        rowHeight = 130;
    } else if ([[(self.contentParts)[indexPath.section] valueForKey:@"title"] isEqualToString:@"About"]) {
        rowHeight = 330;
    } else if ([[(self.contentParts)[indexPath.section] valueForKey:@"title"] isEqualToString:@"Get in touch"]) {
        rowHeight = 50;
    } else if ([[(self.contentParts)[indexPath.section] valueForKey:@"title"] isEqualToString:@"Review"]) {
        rowHeight = 105;
    } else if ([[(self.contentParts)[indexPath.section] valueForKey:@"Next Kind"] isEqualToString:@"Review"]) {
        rowHeight = 160;
    }
    return rowHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    CGRect frame;
    frame.origin.x = 0;
    frame.origin.y = 0;
    frame.size.width = self.employeeDetailsTableView.frame.size.width;
    frame.size.height = 40.0;
    
    EmployeeTableHeaderView *employeeTableHeaderView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"HeaderIdentifier"];
    employeeTableHeaderView = [[EmployeeTableHeaderView alloc]initWithFrame:frame];
    [employeeTableHeaderView.resultFoundLbl setText:[[self.contentParts objectAtIndex:section] valueForKey:@"title"]];
    [employeeTableHeaderView.iconImgView setImage:[UIImage imageNamed:[[self.contentParts objectAtIndex:section] valueForKey:@"image"]]];
    return employeeTableHeaderView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (NSString *)getValueNameFromValueId:(NSString *)valueId andArray:(NSMutableArray *)mutableArray {
    NSString *valueName = @"";
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"valueId == %@", valueId];
    NSMutableArray * filteredarray  = [[NSMutableArray alloc]initWithArray:[mutableArray filteredArrayUsingPredicate:predicate]];
    if ([filteredarray count] > 0) {
        valueName = [[filteredarray objectAtIndex:0] valueForKey:@"valueName"];
    }
    return valueName;
}

@end
