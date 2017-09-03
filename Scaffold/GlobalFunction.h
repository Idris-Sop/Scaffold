//
//  GlobalFunction.h
//  Scaffold
//
//  Created by Idris SOP on 2017/08/31.
//  Copyright © 2017 Idris SOP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#ifndef GlobalFunction_h
#define GlobalFunction_h


static inline NSMutableArray *startDateArray() {
    return [NSMutableArray arrayWithArray:@[[NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"",
                                               @"valueName": @"Any date"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"1",
                                               @"valueName": @"Today"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"2",
                                               @"valueName": @"Past 7 days"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"3",
                                               @"valueName": @"This month"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"4",
                                               @"valueName": @"This year"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"5",
                                               @"valueName": @"Yesterday"}]
                                            ]];
}


static inline NSMutableArray *raceArray() {
    return [NSMutableArray arrayWithArray:@[[NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"",
                                               @"valueName": @"----------------"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"B",
                                               @"valueName": @"Black African"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"C",
                                               @"valueName": @"Coloured"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"I",
                                               @"valueName": @"Indian or Asian"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"W",
                                               @"valueName": @"White"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"N",
                                               @"valueName": @"None Dominant"}]
                                            ]];
}

static inline NSMutableArray *positionArray() {
    return [NSMutableArray arrayWithArray:@[[NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"",
                                               @"valueName": @"----------------"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"1",
                                               @"valueName": @"Front-end Developer - Senior"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"2",
                                               @"valueName": @"Back-end Developer - Junior"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"3",
                                               @"valueName": @"Project Manager - Senior"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"4",
                                               @"valueName": @"Project Manager - Junior"}]
                                             ]];
}

static inline NSMutableArray *userArray() {
    return [NSMutableArray arrayWithArray:@[[NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"",
                                               @"valueName": @"----------------"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"6",
                                               @"valueName": @"sue.beans"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"8",
                                               @"valueName": @"captain"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"10",
                                               @"valueName": @"employee2"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"11",
                                               @"valueName": @"employee4"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"2",
                                               @"valueName": @"james.dean"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"3",
                                               @"valueName": @"employee3"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"12",
                                               @"valueName": @"pravin.gordhan"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"5",
                                               @"valueName": @"admin"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"4",
                                               @"valueName": @"jacob.zuma"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"3",
                                               @"valueName": @"employee3"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"9",
                                               @"valueName": @"employee1"}]
                                            ]];
}

static inline NSMutableArray *birthdateArray() {
    return [NSMutableArray arrayWithArray:@[[NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"",
                                               @"valueName": @"Any date"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"1",
                                               @"valueName": @"Today"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"2",
                                               @"valueName": @"Past 7 days"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"3",
                                               @"valueName": @"This month"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"4",
                                               @"valueName": @"This year"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"5",
                                               @"valueName": @"Yesterday"}]
                                            ]];
}

static inline NSMutableArray *genderArray() {
    return [NSMutableArray arrayWithArray:@[[NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"",
                                               @"valueName": @"----------------"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"M",
                                               @"valueName": @"Male"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"F",
                                               @"valueName": @"Female"}]
                                            ]];
}

static inline NSMutableArray *reviewTypeArray() {
    return [NSMutableArray arrayWithArray:@[[NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"P",
                                               @"valueName": @"Performance Increase"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"F",
                                               @"valueName": @"Starting Salary"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"A",
                                               @"valueName": @"Annual Increase’"}],
                                            [NSMutableDictionary dictionaryWithDictionary:
                                             @{@"valueId": @"E",
                                               @"valueName": @"Expectation Review"}]
                                            ]];
}

static inline UIColor *appHighlightColor() {
    return [UIColor colorWithRed:241.0F / 255.0F green:90.0F / 255.0F blue:35.0F / 255.0F alpha:1.0];
}

static inline UIColor *tabBarSelectedItemTintColor() {
    return [UIColor colorWithRed:68/255.0 green:114/255.0 blue:196/255.0 alpha:1.0];
}

static inline UIColor *appBackgroundColor() {
    return [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
}

static inline UIColor *buttonBackgroundColor() {
    return [UIColor colorWithRed:1/255.0 green:140/255.0 blue:203/255.0 alpha:1.0];
}

static inline UIColor *orangeColor() {
    return [UIColor colorWithRed:237/255.0 green:125/255.0 blue:49/255.0 alpha:1.0];
}

static inline UIColor *blueColor() {
    return [UIColor colorWithRed:68/255.0 green:114/255.0 blue:196/255.0 alpha:1.0];
}


static inline float pointLength(CGPoint _vec) {
    return roundf(sqrtf(pow(_vec.x, 2) + pow(_vec.y, 2)));
}

static inline CGPoint pointAdd(CGPoint _a, CGPoint _b) {
    return CGPointMake(_a.x + _b.x, _a.y + _b.y);
}

static inline CGPoint pointSubtract(CGPoint _a, CGPoint _b) {
    return CGPointMake(_a.x - _b.x, _a.y - _b.y);
}

static inline CGPoint pointMultiply(CGPoint _a, CGPoint _b) {
    return CGPointMake(_a.x * _b.x, _a.y * _b.y);
}

static inline CGPoint pointDevide(CGPoint _a, CGPoint _b) {
    return CGPointMake(_a.x / _b.x, _a.y / _b.y);
}

static inline CGFloat degToRad(CGFloat _degrees) {
    return _degrees * M_PI / 180;
}

static inline CGPoint pointRotate(CGPoint _point, CGPoint _origin, CGFloat _degrees) {
    float x_origin = _origin.x;
    float y_origin = _origin.y;
    float rads = (M_PI / 180) * _degrees;
    float cos = cosf(rads);
    float sin = sinf(rads);
    float x_point = _point.x;
    float y_point = _point.y;
    float x_actual = x_origin + cos * (x_point - x_origin) - sin * (y_point - y_origin);
    float y_actual = y_origin + sin * (x_point - x_origin) + cos * (y_point - y_origin);
    return CGPointMake(x_actual, y_actual);
}

static inline float pointGetAngleAroundOrigin(CGPoint _a, CGPoint _b, CGPoint _origin) {
    float len_a = pointLength(pointSubtract(_a, _origin));
    float len_b = pointLength(pointSubtract(_a, _b));
    float len_c = pointLength(pointSubtract(_b, _origin));
    float cos_o = roundf((powf(len_a, 2) + powf(len_c, 2) - powf(len_b, 2)) / (2 * len_a * len_c));
    float angle = acosf(cos_o) / (M_PI / 180);
    if(((_a.x - _origin.x)*(_b.y - _origin.y) - (_a.y - _origin.y)*(_b.x - _origin.x)) <= 0) {
        angle = 360 - angle;
    }
    if (isnan(angle)) {
        angle = 0;
    }
    return angle;//roundf(angle);
}

static inline CGFloat topPaddingForTextInRect(NSString *_text, NSString *_font, CGFloat _fontSize, CGRect _rect) {
    UIFont *theFont = [UIFont fontWithName:_font size:_fontSize];
    CGSize textSize = [_text sizeWithAttributes: @{NSFontAttributeName: theFont}];
    //CGSize textSize = [_text sizeWithFont:theFont];
    return (_rect.size.height - textSize.height) / 2.0F;
}

static inline void logFrame(NSString *_name, CGRect _frame) {
    NSLog(@"Frame: %@\n Dimensions\nWidth:  %f\nHeight: %f\nX:      %f\nY:      %f", _name, _frame.size.width, _frame.size.height, _frame.origin.x, _frame.origin.y);
}

static inline void setBorderForView(UIView *theView, UIColor *theColor) {
    [theView.layer setBorderColor:[theColor CGColor]];
    [theView.layer setBorderWidth:2];
}

static inline UIColor *appHighlightColorWithAlpha(CGFloat _alpha) {
    return [UIColor colorWithRed:241.0F / 255.0F green:90.0F / 255.0F blue:35.0F / 255.0F alpha:_alpha];
}

static inline UIColor *appLowlightColor() {
    return [UIColor darkGrayColor];
}


static inline UIColor *appTextColor() {
    return [UIColor lightGrayColor];
}

static inline UIColor *appHighlightTextColor() {
    return [UIColor whiteColor];
}

static inline NSString *appFontName() {
    return @"Helvetica";
}

static inline NSString *appBoldFontName() {
    return @"Helvetica-Bold";
}

static inline NSArray *primaryGradientColors() {
    return [NSArray arrayWithObjects:
            (id)[UIColor colorWithWhite:1.0F alpha:0.025f].CGColor,
            (id)[UIColor colorWithWhite:1.0F alpha:0.05f].CGColor,
            (id)[UIColor colorWithWhite:1.0F alpha:0.1f].CGColor,
            (id)[UIColor colorWithWhite:1.0F alpha:0.0f].CGColor,
            nil];
}

static inline NSArray *primaryGradientPositions() {
    return [NSArray arrayWithObjects:
            [NSNumber numberWithFloat:0.0f],
            [NSNumber numberWithFloat:0.4f],
            [NSNumber numberWithFloat:0.5f],
            [NSNumber numberWithFloat:0.501f],
            nil];
}

static inline NSArray *seconaryGradientColorsLightToDark() {
    return [NSArray arrayWithObjects:
            (id)[UIColor colorWithWhite:1.0F alpha:0.1].CGColor,
            (id)[UIColor colorWithWhite:0.15F alpha:0.2].CGColor,
            nil];
}

static inline NSArray *seconaryGradientPositionsLightToDark() {
    return [NSArray arrayWithObjects:
            (id)[NSNumber numberWithFloat:0],
            (id)[NSNumber numberWithFloat:1],
            nil];
}

static inline NSArray *seconaryGradientColorsDarkToLight() {
    return [NSArray arrayWithObjects:
            (id)[UIColor colorWithWhite:0.15F alpha:0.2].CGColor,
            (id)[UIColor colorWithWhite:1.0F alpha:0.1].CGColor,
            nil];
}

static inline NSArray *seconaryGradientPositionsDarkToLight() {
    return [NSArray arrayWithObjects:
            (id)[NSNumber numberWithFloat:0],
            (id)[NSNumber numberWithFloat:1],
            nil];
}
#endif /* GlobalFunction_h */
