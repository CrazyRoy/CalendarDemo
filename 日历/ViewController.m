//
//  ViewController.m
//  日历
//
//  Created by wsj on 16/7/7.
//  Copyright © 2016年 wsj. All rights reserved.

#import "ViewController.h"

#import "CalendarVIew.h"
#import "WJHeader.h"
@interface ViewController ()
/**创建的label*/
@property(nonatomic,weak)UILabel *label;
@end

@implementation ViewController

#warning 备注 七秒小鱼儿著，专著请备注七秒记忆著。
/** 学习swfit可以关注主题
 *  http://www.jianshu.com/collection/e30d753afdee
 *  swfit交流群 群号：512847147
 *  html交流群  群号：446310206
 */
/* 参考资料
 *  http://my.oschina.net/yongbin45/blog/156181?fromerr=oC6C7zZR
 *  http://www.cnblogs.com/wujian1360/archive/2011/09/05/2168007.html
 *  http://www.jianshu.com/p/56da2abb39e3
 *  日历的第三方框架
 *  https://github.com/WenchaoD/FSCalendar
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    CalendarVIew *calendar = [[CalendarVIew alloc]initWithFrame:CGRectMake(0, 100,kWJScreenWidth , 300)];
    calendar.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:calendar];
    
    
}
#warning 下面为我自己的理解讲解的NSCalendar
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    // 1.0
//    /**
//     *  总体来说当前时间所在小的单元在大单元里面有多少个    注：单元（day week month years）
//     *
//     *  @param rangeOfUnit   小的单元
//     *  @param inUnit 大的单元
//     *
//     *  @return 反悔查找的结果
//     */
//    /*当前时间的月份里面有多少天*/
//    NSLog(@"%zd",[[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[NSDate  date]].length);
//    /**
//     *  总提来说就是当前的时间所在的小的单元（day week month years）所在大单元里面属于第几个
//     *
//     *  @param ordinalityOfUnit 小的单元
//     *  @param inUnit 大的单元
//     *
//     *  @return 返回你想要的
//     */
//    /*当前时间在这个月里是第几天*/
//    NSLog(@"%zd",[[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[NSDate  date]]);
//    /*当前时间所在的周在这一年中的第几周*/
//    NSLog(@"%zd",[[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitYear forDate:[NSDate date]]);
//    /**
//     2016-07-07 23:09:28.329 日历[18401:2543808] 31
//     2016-07-07 23:09:28.330 日历[18401:2543808] 7
//     2016-07-07 23:09:28.330 日历[18401:2543808] 27
//     */
//    
// 
//    /*创建个日历对象
//     * Identifier 表示是阳历还是阴历一类的
//     */
//    NSCalendar *caledar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
//    /*将日历上当前时间转化为可读的对象
//     * 理解为：将时间转化为可读的方式，components表示都转成什么样的方式
//     *       fromDate  你要转化的时间
//     */
//    NSDateComponents *dateComponents = [caledar components:NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond |NSCalendarUnitWeekday | NSCalendarUnitWeekOfMonth fromDate:[NSDate date]];
//    NSLog(@"year(年份): %zd", dateComponents.year);
//    NSLog(@"quarter(季度):%zd", dateComponents.quarter);
//    NSLog(@"month(月份):%zd", dateComponents.month);
//    NSLog(@"day(日期):%zd", dateComponents.day);
//    NSLog(@"hour(小时):%zd", dateComponents.hour);
//    NSLog(@"minute(分钟):%zd", dateComponents.minute);
//    NSLog(@"second(秒):%zd", dateComponents.second);
//    NSLog(@"weekOfMonth(第几周):%zd", dateComponents.weekOfMonth);
//    //    Sunday:1, Monday:2, Tuesday:3, Wednesday:4, Friday:5, Saturday:6
//    //    美国人写法  你是没办法改变的  星期天就是1
//    NSLog(@"weekday(星期):%zd ", dateComponents.weekday);
//    /*
//     2016-07-07 23:13:57.370 日历[18488:2548237] year(年份): 2016
//     2016-07-07 23:13:57.370 日历[18488:2548237] quarter(季度):9223372036854775807
//     2016-07-07 23:13:57.370 日历[18488:2548237] month(月份):7
//     2016-07-07 23:13:57.371 日历[18488:2548237] day(日期):7
//     2016-07-07 23:13:57.373 日历[18488:2548237] hour(小时):23
//     2016-07-07 23:13:57.373 日历[18488:2548237] minute(分钟):13
//     2016-07-07 23:13:57.373 日历[18488:2548237] second(秒):57
//     2016-07-07 23:13:57.373 日历[18488:2548237] weekOfMonth(第几周):2
//     2016-07-07 23:13:57.373 日历[18488:2548237] weekday(星期):5
//     */
//    
//    
//    
//    /*自定义个时间段*/
//    NSDateComponents *components = [[NSDateComponents alloc]init];
//    /*在NSDateComponents的设置时间点*/
//    [components setMonth:+1];
//    [components setYear:+1];
//    /*当前时间距离一月之后的时间*/
//    NSDate *date =  [caledar dateByAddingComponents:components toDate:[NSDate date] options:0];
//    /*将一年零一月后的时间转化为可读的对象*/
//     NSDateComponents *dateComponents_two = [caledar components:NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond |NSCalendarUnitWeekday |NSCalendarUnitEra fromDate:date];
//    
//    /*计算两个时间点间隔*/
//    NSDateComponents *dateComponent_three = [caledar components:NSCalendarUnitYear fromDate:[NSDate dateWithTimeIntervalSince1970:0] toDate:[NSDate date] options:0];
//    NSLog(@"year(年份): %zd %zd %zd", dateComponents.year,dateComponents_two.year,dateComponent_three.year);
//    NSLog(@"month(月份):%zd %zd", dateComponents.month,dateComponents_two.month);
//    //    Sunday:1, Monday:2, Tuesday:3, Wednesday:4, Thursday 5 Friday:6, Saturday:7
//    //    美国人写法  你是没办法改变的  星期天就是1
//    NSLog(@"weekday(星期):%zd %zd", dateComponents.weekday,dateComponents_two.weekday);
//    
//    /*
//     2016-07-07 23:13:57.374 日历[18488:2548237] year(年份): 2016 2017 46
//     2016-07-07 23:13:57.374 日历[18488:2548237] month(月份):7 8
//     2016-07-07 23:16:26.445 日历[18514:2550320] weekday(星期):5(周四) 2（周一）
//     */
//    
//    
//    NSDate *startDate = nil;// 开始的时间
//    NSTimeInterval TIOfMonth;// 距离现在的间隔时间
//    /** 我们大致可以理解为：“某个时间点”所在的“单元”的起始时间，以及起始时间距离“某个时间点”的时差
//     * startDate ：  开始时间
//     * rangeOfUnit ：所在的单元
//     * forDate 其实时间点
//     */
//    [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitMonth startDate:&startDate interval:&TIOfMonth forDate:[NSDate date]];
//    /*将日历上当前时间转化为可读的对象*/
//    NSDateComponents *dateComponents_four = [caledar components:NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond |NSCalendarUnitWeekday |NSCalendarUnitEra fromDate:startDate];
//    
//    NSLog(@"月份%zd 几号%zd 周几%zd %f",dateComponents_four.month,dateComponents_four.day,dateComponents_four.weekday,TIOfMonth);
//   // 2016-07-07 23:20:09.041 日历[18649:2554373] 月份7 几号1 周几6 2678400.000000}
//    // 注释的意思就是告诉你当前的所在的月份是七月，七月的1号是周五
}
@end
