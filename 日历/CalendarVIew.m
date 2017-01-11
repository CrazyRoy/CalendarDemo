//
//  CalendarVIew.m
//  日历
//
//  Created by wsj on 16/8/13.
//  Copyright © 2016年 wsj. All rights reserved.
//

#import "CalendarVIew.h"
#import "WjCalendarVIew.h"
#import "WJHeader.h"
#import "UIView+VIewFrame.h"
@implementation CalendarVIew

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addCalendar];
    }
    return self;
}
-(void)addCalendar
{
    /**创建日历上面的周几*/
    for (NSInteger index = 0; index<7; index++) {
        UILabel *label = [[UILabel alloc]init];
        label.frame = CGRectMake(index*padding+20, 0, padding, 25);
        label.textAlignment = NSTextAlignmentCenter;
        switch (index) {
            case 0:
                label.text = @"日";
                break;
            case 1:
                label.text = @"一";
                break;
            case 2:
                label.text = @"二";
                break;
            case 3:
                label.text = @"三";
                break;
            case 4:
                label.text = @"四";
                break;
            case 5:
                label.text = @"五";
                break;
            case 6:
                label.text = @"六";
                break;
                
            default:
                break;
        }
        [self addSubview:label];
    }
    
    
    /**创建日历试图*/
    WjCalendarVIew *wj_calendar = [[WjCalendarVIew alloc]initWithFrame:CGRectMake(20,25, self.width-40, self.width-40)];

    [self addSubview:wj_calendar];
}
@end
