//
//  EmployeesViewController.m
//  Scaffold
//
//  Created by Idris SOP on 2017/08/31.
//  Copyright © 2017 Idris SOP. All rights reserved.
//

#import "EmployeesViewController.h"

@interface EmployeesViewController ()
@property (strong, nonatomic) IBOutlet UIBarButtonItem *refineBarButtonItem;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *resultBarButtonItem;

@end

@implementation EmployeesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *narBarImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 5, 40)];
    UIImage *narBarImage = [UIImage imageNamed:@"icon"];
    [narBarImageView setImage:narBarImage];
    [self.navigationItem setTitleView:narBarImageView];
    
    self.employeeArray = [[NSMutableArray alloc]init];
    [self.employeeTableView setDelegate:self];
    [self.employeeTableView setDataSource:self];
    [self.employeeTableView registerNib:[UINib nibWithNibName:@"EmployeeTableViewCell" bundle:nil] forCellReuseIdentifier:@"CellIdentifier"];
    [self.employeeTableView registerNib:[UINib nibWithNibName:@"EmployeeTableHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"HeaderIdentifier"];
    
    self.refineBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Refine" style:UIBarButtonItemStyleDone target:self action:@selector(refineList)];
    [self.refineBarButtonItem setTintColor:orangeColor()];
    [self.navigationItem setRightBarButtonItem:self.refineBarButtonItem];
    
    if (self.isInternetReachable) {
        [self showLoadingFromView:self.view];
        ScafflordAPI *api = [ScafflordAPI sharedScafflordAPI];
        NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
        [api getEmployeeWithParams:params withCompletion:^(BOOL success, NSMutableArray *employeeArray, NSString *message) {
            if (success) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.employeeArray = employeeArray;
                    [self.employeeTableView reloadData];
                    [self hideLoadingFromView:self.view];
                });
            } else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self hideLoadingFromView:self.view];
                    [self showAlertWithTitle:@"Invalid Login" andMessage:message];
                });
            }
        }];
    }
}

- (void)refineList {
    RefineViewController *refineVC = [[RefineViewController alloc]initWithNibName:@"RefineViewController" bundle:[NSBundle mainBundle]];
    [refineVC setDelegate:self];
    UINavigationController *navigationC = [[UINavigationController alloc]initWithRootViewController:refineVC];
    [self presentViewController:navigationC animated:YES completion:nil];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
}

- (void)doneRefiningEmployee:(RefineViewController *)refineViewController withFilterParams:(NSMutableDictionary *)filterParams {
    self.employeeArray = [[NSMutableArray alloc]init];
    if (self.isInternetReachable) {
        [self showLoadingFromView:self.view];
        ScafflordAPI *api = [ScafflordAPI sharedScafflordAPI];
        [api getEmployeeWithParams:filterParams withCompletion:^(BOOL success, NSMutableArray *employeeArray, NSString *message) {
            if (success) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.employeeArray = employeeArray;
                    [self.employeeTableView reloadData];
                    [self hideLoadingFromView:self.view];
                });
            } else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self hideLoadingFromView:self.view];
                    [self showAlertWithTitle:@"Invalid Login" andMessage:message];
                });
            }
        }];
    }
}

#pragma Mark - UITableView DataSource & Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.employeeArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"CellIdentifier";
    UITableViewCell *cell;
    
    EmployeeTableViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    [customCell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    NSDictionary *userDict = [[self.employeeArray objectAtIndex:indexPath.row] valueForKey:@"user"];
    [customCell.employeeName setText:[[[userDict valueForKey:@"first_name"] stringByAppendingString:@" "] stringByAppendingString:[userDict valueForKey:@"last_name"]]];
    [customCell.employeeGender setText:[self getValueNameFromValueId:[[self.employeeArray objectAtIndex:indexPath.row] valueForKey:@"gender"] andArray:genderArray()]];
    NSDictionary *positionDict = [[self.employeeArray objectAtIndex:indexPath.row] valueForKey:@"position"];
    [customCell.employeePosition setText:[positionDict valueForKey:@"name"]];
    cell = customCell;
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    [cell layoutSubviews];
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *selectEmployee = [self.employeeArray objectAtIndex:indexPath.row];
    EmployeeDetailsViewController *employeeDetailsVC = [[EmployeeDetailsViewController alloc]init];
    [employeeDetailsVC setEmployeeDetailsDict:selectEmployee];
    [self.navigationController pushViewController:employeeDetailsVC animated:YES];
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

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    CGRect frame;
    frame.origin.x = 0;
    frame.origin.y = 0;
    frame.size.width = self.employeeTableView.frame.size.width;
    frame.size.height = 40.0;
    
    self.employeeTableHeaderView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"HeaderIdentifier"];
    self.employeeTableHeaderView = [[EmployeeTableHeaderView alloc]initWithFrame:frame];
    [self.employeeTableHeaderView.resultFoundLbl setText:[NSString stringWithFormat:@"%lu Result(s) found", (unsigned long)self.employeeArray.count]];
    return self.employeeTableHeaderView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
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
