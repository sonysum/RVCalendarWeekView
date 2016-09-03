 //
//  MSAllDayView.h
//  RVCalendarWeekView
//
//  Created by liuliangju on 9/3/16.
//  Copyright © 2016 revo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSAllDayView : UICollectionReusableView

@property (nonatomic, strong) NSDate *day;
@property (nonatomic, assign) BOOL currentDay;


- (void)reloadTableViewWithAllDayDataSource:(NSArray *)allDaydataSource andSelectDate:(NSDate *)selectDate;

@end
