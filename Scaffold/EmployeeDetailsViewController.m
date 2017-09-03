//
//  EmployeeDetailsViewController.m
//  Scaffold
//
//  Created by Idris SOP on 2017/09/03.
//  Copyright © 2017 Idris SOP. All rights reserved.
//

#import "EmployeeDetailsViewController.h"

@interface EmployeeDetailsViewController ()

@end

@implementation EmployeeDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Employee Details";
    self.employeeDetails = [[EmployeeDetails alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.employeeDetails];
}

- (void)setEmployeeDetailsDict:(NSDictionary *)employeeDetails {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSDictionary *userDict = [employeeDetails valueForKey:@"user"];
        [self.employeeDetails.employeeNameValue setText:[[[userDict valueForKey:@"first_name"] stringByAppendingString:@" "] stringByAppendingString:[userDict valueForKey:@"last_name"]]];
        [self.employeeDetails.emailValueLbl setText:[employeeDetails valueForKey:@"email"]];
        [self.employeeDetails.phoneValueLbl setText:[employeeDetails valueForKey:@"phone_number"]];
        [self.employeeDetails.gitHubUserValue setText:[employeeDetails valueForKey:@"github_user"]];
        [self.employeeDetails.dobValueLbl setText:[employeeDetails valueForKey:@"birth_date"]];
        [self.employeeDetails.yearsWorkedValueLbl setText:[[employeeDetails valueForKey:@"years_worked"] stringValue]];
        [self.employeeDetails.genderValueLbl setText:[self getValueNameFromValueId:[employeeDetails valueForKey:@"gender"] andArray:genderArray()]];
        [self.employeeDetails.raceValueLbl setText:[self getValueNameFromValueId:[employeeDetails valueForKey:@"race"] andArray:raceArray()]];
        NSDictionary *positionDict = [employeeDetails valueForKey:@"position"];
        [self.employeeDetails.positionValueLbl setText:[positionDict valueForKey:@"name"]];
        [self.employeeDetails.levelValueLbl setText:[positionDict valueForKey:@"level"]];
    });
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
