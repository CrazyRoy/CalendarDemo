//
//  WjCalendarVIew.m
//  日历
//
//  Created by wsj on 16/8/13.
//  Copyright © 2016年 wsj. All rights reserved.

#warning  使用到了轮播图的机制来改变一直可以侧滑改变月份的。只要你懂轮播图就是可以看明白的

#import "WjCalendarVIew.h"
#import "UIView+VIewFrame.h"

#import "WJHeader.h"

@interface WjCalendarVIew ()<UIScrollViewDelegate>

@property(strong,nonatomic) UIScrollView *scrollView;
@property(strong,nonatomic) UIView *centerView;
@property(strong,nonatomic) UIView *rightView;
@property(strong,nonatomic) UIView *leftView;

/***/
@property(nonatomic,strong) NSDateComponents *dateComponents_four;
/**创建日历对象*/
@property(nonatomic,strong) NSCalendar *caledar;
/**顶一个时间段*/
@property(nonatomic,strong)NSDateComponents *components;

/**当前的button*/
@property(nonatomic,strong)UIButton *cuttent_button;

/**获取当前的日期*/
@property(nonatomic,assign)NSInteger date_count;

@end
@implementation WjCalendarVIew
{
    NSInteger _countMonth;
}
-( NSDateComponents *)components
{
    if (_components == nil) {
        _components = [[NSDateComponents alloc]init];
    }
    return _components;
}
-(NSCalendar *)caledar
{
    if (_caledar == nil) {
        _caledar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    }
    return _caledar;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 计算今天是几号
        NSDateComponents *dateComponents = [self.caledar components:NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond |NSCalendarUnitWeekday | NSCalendarUnitWeekOfMonth fromDate:[NSDate date]];
        self.date_count = dateComponents.day;
       
        [self addScrollView];
        
    }
    return self;
}
-(void)addScrollView
{
    _countMonth = 1;
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.self.width, self.height)];
    _scrollView.contentSize = CGSizeMake(3 * self.self.width, 0);
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.bounces = NO;
    _scrollView.contentOffset = CGPointMake(self.self.width, 0);
    [self addSubview:_scrollView];
    
    
    //初始化上一个视图
    _leftView = [[UIView alloc] init];
    [self addCalendarButtonWithAddView:_leftView andIndex:-1];
    _leftView.frame = CGRectMake(0, 0, self.width, self.height);
    _leftView.contentMode = UIViewContentModeCenter;
    [_scrollView addSubview:_leftView];
    
    //初始化当前视图
    _centerView = [[UIView alloc] init];
    [self addCalendarButtonWithAddView:_centerView andIndex:0];
    _centerView.frame = CGRectMake(self.width, 0, self.width, self.height);
    _centerView.contentMode = UIViewContentModeCenter;
    [_scrollView addSubview:_centerView];
    
    //初始化下一个视图
    _rightView = [[UIView alloc] init];
    [self addCalendarButtonWithAddView:_rightView andIndex:+1];
    _rightView.frame = CGRectMake(self.width * 2, 0, self.width, self.height);
    _rightView.contentMode = UIViewContentModeCenter;
    [_scrollView addSubview:_rightView];
}
-(void)addCalendarButtonWithAddView:(UIView *)addView andIndex:(NSInteger)index
{
    /*创建个日历对象
     * Identifier 表示是阳历还是阴历一类的
     */
//    NSCalendar *caledar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    
//    /*自定义个时间段*/
//    NSDateComponents *components = [[NSDateComponents alloc]init];
    /*在NSDateComponents的设置时间点  也就是间隔多长时间*/
    [self.components setMonth:index];

    /*当前时间距离间隔之后的时间*/
    NSDate *date =  [self.caledar dateByAddingComponents:self.components toDate:[NSDate date] options:0];
    
    // 获取间隔当前时间的月份有多少天
    NSInteger count = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date].length;
    
    /**计算当前实在在这个月的起始时间*/
    NSDate *startDate = nil;// 开始的时间
    NSTimeInterval TIOfMonth;// 距离现在的间隔时间
    [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitMonth startDate:&startDate interval:&TIOfMonth forDate:date];
    /*将日历上当前时间转化为可读的对象   也是当前月份第一天的日历*/
    self.dateComponents_four = [self.caledar components:NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond |NSCalendarUnitWeekday |NSCalendarUnitEra fromDate:startDate];
    // 当前月份第一天是周几
    NSInteger weekday  = self.dateComponents_four.weekday-1;
    
    
    
    /**下面就是个九宫格的计算，但是使用到了循环 自己慢慢看是可以看懂的，静下心看看*/
    for (NSInteger index = addView.subviews.count; index < count+weekday; index++) {
        UIButton *button = [[UIButton alloc]init];
        
        [addView addSubview:button];
    }
    for (NSInteger index = 0; index < addView.subviews.count; index++) {
        UIView *buttonView = addView.subviews[index];
        if ([buttonView isMemberOfClass:[UIButton class]]) {
            UIButton *caledarView = (UIButton *)buttonView;
            if (index < count) {
                caledarView.hidden = NO;
                CGFloat col = (index+weekday)/7;
                CGFloat row = (index+weekday)%7;
                caledarView.frame = CGRectMake(row*padding, col*padding, padding, padding);
                caledarView.selected = NO;
                if (index == self.date_count-1) {
                    self.cuttent_button = caledarView;
                    caledarView.selected = YES;
                }
                [caledarView setImage:[UIImage imageNamed:@"status_online_self"] forState:UIControlStateSelected];
                [caledarView addTarget:self action:@selector(calendarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
                [caledarView setTitle:@(index+1).stringValue forState:0];
            }else{
                caledarView.hidden = YES;
            }
        }
    }
    
}
-(void)calendarButtonClick:(UIButton *)button
{
    self.cuttent_button.selected = NO;
    button.selected = YES;
    self.cuttent_button = button;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageIndex= scrollView.contentOffset.x/scrollView.frame.size.width;
    
    if (pageIndex==2) {
        _countMonth++;
        
        [self addCalendarButtonWithAddView:_leftView andIndex:_countMonth-2];
        [self addCalendarButtonWithAddView:_centerView andIndex:_countMonth-1];
        [self addCalendarButtonWithAddView:_rightView andIndex:_countMonth];
        
        [_scrollView setContentOffset:CGPointMake(self.width, 0)];
        
    }else if(pageIndex==0){
        
        _countMonth--;
        [self addCalendarButtonWithAddView:_leftView andIndex:_countMonth-2];
        [self addCalendarButtonWithAddView:_centerView andIndex:_countMonth-1];
        [self addCalendarButtonWithAddView:_rightView andIndex:_countMonth];
        
        [_scrollView setContentOffset:CGPointMake(self.width, 0)];
    }
    
}
@end
