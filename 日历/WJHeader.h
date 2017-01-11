
//
//  WJHeader.h
//  日历
//
//  Created by wsj on 16/8/13.
//  Copyright © 2016年 wsj. All rights reserved.
//

#ifndef WJHeader_h
#define WJHeader_h
#define  padding  (kWJScreenWidth-40)/7
/*屏幕的宽度*/
#define kWJScreenWidth [UIScreen mainScreen].bounds.size.width
/*屏幕的高度*/
#define kWJScreenHeight  [UIScreen mainScreen].bounds.size.height

/**获取这个View的X轴的最大值*/
#define kGetMaxX(View) CGRectGetMaxX(View.frame)
/**获取这个View的X轴的中心值*/
#define kGetMidX(View) CGRectGetMidX(View.frame)
/**获取这个View的X轴的最小值*/
#define kGetMinX(View) CGRectGetMinX(View.frame)
/**获取这个View的Y轴的中心值*/
#define kGetMaxY(View) CGRectGetMaxY(View.frame)
/**获取这个View的Y轴的最大值*/
#define kGetMidY(View) CGRectGetMidY(View.frame)
/**获取这个View的Y轴的最小值*/
#define kGetMinY(View) CGRectGetMinY(View.frame)

#endif /* WJHeader_h */
