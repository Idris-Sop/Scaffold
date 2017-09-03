//
//  EmployeeTableHeaderView.m
//  Scaffold
//
//  Created by Idris SOP on 2017/09/02.
//  Copyright © 2017 Idris SOP. All rights reserved.
//

#import "EmployeeTableHeaderView.h"

@implementation EmployeeTableHeaderView

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
        [self.contentView setBackgroundColor:appBackgroundColor()];
    }
    return self;
}


@end
