//
//  RefineViewController.h
//  Scaffold
//
//  Created by Idris SOP on 2017/08/31.
//  Copyright © 2017 Idris SOP. All rights reserved.
//

#import "ScaffoldViewController.h"

@class RefineViewController;

@protocol RefineViewControllerDelegate <NSObject>

- (void)doneRefiningEmployee:(RefineViewController *)refineViewController withFilterParams:(NSMutableDictionary *)filterParams;

@end

@interface RefineViewController : UIViewController <UITextFieldDelegate, UIPickerViewDelegate>

@property (strong, nonatomic) NSMutableArray *startDateArray;
@property (strong, nonatomic) NSMutableArray *raceArray;
@property (strong, nonatomic) NSMutableArray *positionArray;
@property (strong, nonatomic) NSMutableArray *userArray;
@property (strong, nonatomic) NSMutableArray *birthdateArray;
@property (strong, nonatomic) NSMutableArray *genderArray;

@property (strong, nonatomic) IBOutlet UITextField *startDateTF;
@property (strong, nonatomic) IBOutlet UITextField *raceTF;
@property (strong, nonatomic) IBOutlet UITextField *emailContainTF;
@property (strong, nonatomic) IBOutlet UITextField *positionTF;
@property (strong, nonatomic) IBOutlet UITextField *userTF;
@property (strong, nonatomic) IBOutlet UITextField *birthDateTF;
@property (strong, nonatomic) IBOutlet UITextField *genderTF;

@property (strong, nonatomic) UIPickerView *startDatePicker;
@property (strong, nonatomic) UIPickerView *racePicker;
@property (strong, nonatomic) UIPickerView *positionPicker;
@property (strong, nonatomic) UIPickerView *userPicker;
@property (strong, nonatomic) UIPickerView *bithdatePicker;
@property (strong, nonatomic) UIPickerView *genderPicker;

@property (strong, nonatomic) UIBarButtonItem *cancel;
@property (strong, nonatomic) UIBarButtonItem *doneButton;
@property (strong, nonatomic) UIToolbar *toolBar;

@property (weak, nonatomic) id <RefineViewControllerDelegate> delegate;

@end
