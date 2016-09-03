//
//  MSAllDayView.m
//  RVCalendarWeekView
//
//  Created by liuliangju on 9/3/16.
//  Copyright © 2016 revo. All rights reserved.
//

#import "MSAllDayView.h"
#import "MSAllDayViewCell.h"
#import "MSEvent.h"
#define MAS_SHORTHAND
#import "Masonry.h"
#import "UIColor+HexString.h"

#define screenWidth  [UIScreen mainScreen].bounds.size.width
#define WS(weakSelf) __weak __typeof(&*self)weakSelf = self;

static const NSInteger kMSAllDayHeight = 56;
static const NSInteger kMSAllDayLeftMargin = 50;

@interface MSAllDayView ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UILabel *dayTitle;
@property (nonatomic, strong) UILabel *weekTitle;
@property (nonatomic, strong) UIView *dateView;

@end
@implementation MSAllDayView

- (void)setDay:(NSDate *)day{
    _day = day;
    
    static NSDateFormatter *dateFormatter;
    static NSDateFormatter *weekdateFormatter;
    
    if (!dateFormatter) {
        dateFormatter = [NSDateFormatter new];
        weekdateFormatter = [NSDateFormatter new];
        dateFormatter.dateFormat = @"d";
        weekdateFormatter.dateFormat = @"EE";
    }
    self.dayTitle.text = [dateFormatter stringFromDate:day];
    self.weekTitle.text = [weekdateFormatter stringFromDate:day];
    
    [self setNeedsLayout];
}


- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp{
    
    WS(ws);
    
    UIEdgeInsets padding = UIEdgeInsetsMake(8, 8, 8, 8);
    
    self.dateView =  [[UIView alloc]initWithFrame:CGRectMake(0, 0, kMSAllDayLeftMargin, kMSAllDayHeight)];
    self.dateView.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.dateView];
    [self addSubview:self.tableView];
    [self.dateView addSubview:self.dayTitle];
    [self.dateView addSubview:self.weekTitle];

    [self.dayTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws.self.dateView.mas_centerY).offset(-padding.left);
        make.left.mas_equalTo(ws.self.dateView.mas_left).offset(2.5 * padding.left);
    }];
    
    [self.weekTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws.self.dateView.mas_centerY).offset(padding.left);
        make.left.mas_equalTo(ws.self.dateView.mas_left).offset(2 * padding.left);
    }];

}


#pragma mark tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
    //    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *identifier = [MSAllDayViewCell identifier];
    MSAllDayViewCell *cell = [tableView  dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[MSAllDayViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    MSEvent *model = self.dataSource[indexPath.row];
    [cell setEventModel:model];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"didSelect the cell");
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kMSAllDayHeight;
}

- (void)reloadTableViewWithAllDayDataSource:(NSArray *)allDaydataSource andSelectDate:(NSDate *)selectDate{
    
    
}


- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(kMSAllDayLeftMargin , 0, screenWidth - kMSAllDayLeftMargin, kMSAllDayHeight) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (void)setCurrentDay:(BOOL)currentDay{
    _currentDay = currentDay;
    
    if (currentDay) {
        self.dayTitle.textColor                    = [UIColor redColor];
        self.dayTitle.font                         = [UIFont boldSystemFontOfSize:16.0];
        self.dayTitle.backgroundColor              = [UIColor clearColor];
        self.weekTitle.font                         = [UIFont systemFontOfSize:16.0];
        self.weekTitle.textColor                    = [UIColor redColor];
        self.weekTitle.backgroundColor              = [UIColor clearColor];
    } else {
        self.dayTitle.font                         = [UIFont systemFontOfSize:16.0];
        self.dayTitle.textColor                    = [UIColor blackColor];
        self.dayTitle.backgroundColor              = [UIColor clearColor];
        self.weekTitle.font                         = [UIFont systemFontOfSize:16.0];
        self.weekTitle.textColor                    = [UIColor blackColor];
        self.weekTitle.backgroundColor              = [UIColor clearColor];
    }
}

- (UILabel *)dayTitle{
    if (!_dayTitle) {
        _dayTitle = [[UILabel alloc]init];
    }
    return _dayTitle;
}

- (UILabel *)weekTitle{
    if (!_weekTitle) {
        _weekTitle = [[UILabel alloc]init];
    }
    return _weekTitle;
}






@end
