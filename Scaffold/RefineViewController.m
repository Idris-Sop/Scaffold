//
//  RefineViewController.m
//  Scaffold
//
//  Created by Idris SOP on 2017/08/31.
//  Copyright © 2017 Idris SOP. All rights reserved.
//

#import "RefineViewController.h"

@interface RefineViewController ()
@property (strong, nonatomic) IBOutlet UIBarButtonItem *cancelBarButtonItem;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *submitBarButtonItem;
@end

@implementation RefineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationItem setTitle:@"Refine"];
    self.cancelBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(dismissViewController)];
    [self.cancelBarButtonItem  setTintColor:blueColor()];
    [self.navigationItem setLeftBarButtonItem:self.cancelBarButtonItem ];
    
    self.submitBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Submit" style:UIBarButtonItemStyleDone target:self action:@selector(refineList)];
    [self.submitBarButtonItem setTintColor:orangeColor()];
    [self.navigationItem setRightBarButtonItem:self.submitBarButtonItem];
    
    self.toolBar = [[UIToolbar alloc] initWithFrame: CGRectMake(0, 0, 320, 40)];
    [self.toolBar setBarStyle: UIBarStyleBlackTranslucent];
    UIBarButtonItem *fixedSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFixedSpace target: nil action:nil];
    self.doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemDone target: self action: @selector(done)];
    UIBarButtonItem *itemSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace target: nil action: nil];
    self.toolBar.items = @[fixedSpace, itemSpace, self.doneButton];
    [self.toolBar setTintColor: [UIColor whiteColor]];

    
    self.startDateArray = [[NSMutableArray alloc]init];
    self.raceArray = [[NSMutableArray alloc]init];
    self.positionArray = [[NSMutableArray alloc]init];
    self.userArray = [[NSMutableArray alloc]init];
    self.birthdateArray = [[NSMutableArray alloc]init];
    self.genderArray = [[NSMutableArray alloc]init];
    
    self.startDateArray = startDateArray();
    self.raceArray = raceArray();
    self.positionArray = positionArray();
    self.userArray = userArray();
    self.birthdateArray = birthdateArray();
    self.genderArray = genderArray();
    
    self.startDatePicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 200, self.view.bounds.size.width, 200)];
    [self.startDatePicker setDelegate:self];
    
    self.racePicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 200, self.view.bounds.size.width, 200)];
    [self.racePicker setDelegate:self];
    
    self.positionPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 200, self.view.bounds.size.width, 200)];
    [self.positionPicker setDelegate:self];
    
    self.userPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 200, self.view.bounds.size.width, 200)];
    [self.userPicker setDelegate:self];
    
    self.bithdatePicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 200, self.view.bounds.size.width, 200)];
    [self.bithdatePicker setDelegate:self];
    
    self.genderPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 200, self.view.bounds.size.width, 200)];
    [self.genderPicker setDelegate:self];
    
    [self.startDateTF setDelegate:self];
    self.startDateTF.inputAccessoryView = self.toolBar;
    self.startDateTF.inputView = self.startDatePicker;
    
    [self.raceTF setDelegate:self];
    self.raceTF.inputAccessoryView = self.toolBar;
    self.raceTF.inputView = self.racePicker;
    
    [self.positionTF setDelegate:self];
    self.positionTF.inputAccessoryView = self.toolBar;
    self.positionTF.inputView = self.positionPicker;

    [self.userTF setDelegate:self];
    self.userTF.inputAccessoryView = self.toolBar;
    self.userTF.inputView = self.userPicker;
    
    [self.birthDateTF setDelegate:self];
    self.birthDateTF.inputAccessoryView = self.toolBar;
    self.birthDateTF.inputView = self.bithdatePicker;
    
    [self.genderTF setDelegate:self];
    self.genderTF.inputAccessoryView = self.toolBar;
    self.genderTF.inputView = self.genderPicker;
    
    [self.startDateTF setText:[[self.startDateArray objectAtIndex:0] valueForKey:@"valueName"]];
    [self.raceTF setText:[[self.raceArray objectAtIndex:0] valueForKey:@"valueName"]];
    [self.positionTF setText:[[self.positionArray objectAtIndex:0] valueForKey:@"valueName"]];
    [self.userTF setText:[[self.userArray objectAtIndex:0] valueForKey:@"valueName"]];
    [self.birthDateTF setText:[[self.birthdateArray objectAtIndex:0] valueForKey:@"valueName"]];
    [self.genderTF setText:[[self.genderArray objectAtIndex:0] valueForKey:@"valueName"]];
}

- (void)done {
    [self.startDateTF resignFirstResponder];
    [self.raceTF resignFirstResponder];
    [self.positionTF resignFirstResponder];
    [self.userTF resignFirstResponder];
    [self.birthDateTF resignFirstResponder];
    [self.genderTF resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)refineList {
    NSMutableDictionary *filterParams = [[NSMutableDictionary alloc]init];
    
    if ([[self getValueIdFromValueName:self.raceTF.text andArray:self.raceArray] isEqualToString:@""]) {
        [filterParams setValue:@"" forKey:@"race"];
    } else {
        [filterParams setValue:[self getValueIdFromValueName:self.raceTF.text andArray:self.raceArray] forKey:@"race"];
    }
    
    if ([[self getValueIdFromValueName:self.positionTF.text andArray:self.positionArray] isEqualToString:@""]) {
        [filterParams setValue:@"" forKey:@"position"];
    } else {
        [filterParams setValue:[NSNumber numberWithInt:[[self getValueIdFromValueName:self.positionTF.text andArray:self.positionArray] intValue]] forKey:@"position"];
    }
    
    [filterParams setValue:[self getValueIdFromValueName:self.startDateTF.text andArray:self.startDateArray] forKey:@"start_date_range"];
    
    if ([[self getValueIdFromValueName:self.userTF.text andArray:self.userArray] isEqualToString:@""]) {
        [filterParams setValue:@"" forKey:@"user"];
    } else {
        [filterParams setValue:[NSNumber numberWithInt:[[self getValueIdFromValueName:self.userTF.text andArray:self.userArray] intValue]] forKey:@"user"];
    }
    
    [filterParams setValue:[self getValueIdFromValueName:self.genderTF.text andArray:self.genderArray] forKey:@"gender"];
    
   
    [filterParams setValue:[self getValueIdFromValueName:self.birthDateTF.text andArray:self.birthdateArray] forKey:@"birth_date_range"];
    
    [filterParams setValue:self.emailContainTF.text forKey:@"email__contains"];
    
    NSLog(@"Filter Params: %@", filterParams);
    
    if ([self.delegate respondsToSelector:@selector(doneRefiningEmployee:withFilterParams:)]) {
        [self.delegate doneRefiningEmployee:self withFilterParams:filterParams];
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
}

- (NSString *)getValueIdFromValueName:(NSString *)valueName andArray:(NSMutableArray *)mutableArray {
    NSString *valueId = @"";
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"valueName == %@", valueName];
    NSMutableArray * filteredarray  = [[NSMutableArray alloc]initWithArray:[mutableArray filteredArrayUsingPredicate:predicate]];
    if ([filteredarray count] > 0) {
        valueId = [[filteredarray objectAtIndex:0] valueForKey:@"valueId"];
    }
    return valueId;
}

#pragma Mark - UIPickerView Code
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    int rows = 1;
    if (pickerView == self.startDatePicker) {
        if (self.startDateArray) {
            rows = (int)(self.startDateArray.count);
        }
    } else if (pickerView == self.racePicker) {
        if (self.raceArray) {
            rows = (int)(self.raceArray.count);
        }
    } else if (pickerView == self.positionPicker) {
        if (self.positionArray) {
            rows = (int)(self.positionArray.count);
        }
    }
    else if (pickerView == self.userPicker) {
        if (self.userArray) {
            rows = (int)(self.userArray.count);
        }
    }
    else if (pickerView == self.bithdatePicker) {
        if (self.birthdateArray) {
            rows = (int)(self.birthdateArray.count);
        }
    }
    else if (pickerView == self.genderPicker) {
        if (self.genderArray) {
            rows = (int)(self.genderArray.count);
        }
    }
    return rows;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *titleText = @"";
    if (pickerView == self.startDatePicker){
        if (self.startDateArray) {
            titleText = [[self.startDateArray objectAtIndex:row] valueForKey:@"valueName"];
        }
    } else if (pickerView == self.racePicker){
        if (self.raceArray) {
            titleText = [[self.raceArray objectAtIndex:row] valueForKey:@"valueName"];
        }
    } else if (pickerView == self.positionPicker){
        if (self.positionArray) {
            titleText = [[self.positionArray objectAtIndex:row] valueForKey:@"valueName"];
        }
    } else if (pickerView == self.userPicker){
        if (self.userArray) {
            titleText = [[self.userArray objectAtIndex:row] valueForKey:@"valueName"];
        }
    } else if (pickerView == self.bithdatePicker){
        if (self.birthdateArray) {
            titleText = [[self.birthdateArray objectAtIndex:row] valueForKey:@"valueName"];
        }
    } else if (pickerView == self.genderPicker){
        if (self.genderArray) {
            titleText = [[self.genderArray objectAtIndex:row] valueForKey:@"valueName"];
        }
    }
    return titleText;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (pickerView == self.startDatePicker){
        if (row) {
            self.startDateTF.text = [[self.startDateArray objectAtIndex:row] valueForKey:@"valueName"];
        }
    } else if (pickerView == self.racePicker){
        if (row) {
            self.raceTF.text = [[self.raceArray objectAtIndex:row] valueForKey:@"valueName"];
        }
    } else if (pickerView == self.positionPicker){
        if (row) {
            self.positionTF.text = [[self.positionArray objectAtIndex:row] valueForKey:@"valueName"];
        }
    } else if (pickerView == self.userPicker){
        if (row) {
            self.userTF.text = [[self.userArray objectAtIndex:row] valueForKey:@"valueName"];
        }
    } else if (pickerView == self.bithdatePicker){
        if (row) {
            self.birthDateTF.text = [[self.birthdateArray objectAtIndex:row] valueForKey:@"valueName"];
        }
    } else if (pickerView == self.genderPicker){
        if (row) {
            self.genderTF.text = [[self.genderArray objectAtIndex:row] valueForKey:@"valueName"];
        }
    }
}


- (void)dismissViewController {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
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
