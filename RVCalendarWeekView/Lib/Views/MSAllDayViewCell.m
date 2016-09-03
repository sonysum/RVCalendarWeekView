//
//  MSAllDayViewCell.m
//  RVCalendarWeekView
//
//  Created by liuliangju on 9/3/16.
//  Copyright © 2016 revo. All rights reserved.
//

#import "MSAllDayViewCell.h"
#define MAS_SHORTHAND
#import "Masonry.h"
#import "UIColor+HexString.h"
#define WS(weakSelf) __weak __typeof(&*self)weakSelf = self;

@interface MSAllDayViewCell ()

@property (nonatomic, strong) UIView *cellContentView;
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *subTitle;

@end

@implementation MSAllDayViewCell

- (void)setEventModel:(MSEvent *)model{
    self.title.text = @"Title";
    self.subTitle.text = @"SubTile";
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUp];
    }
    return self;
}

- (void)setUp{
    WS(ws);
    _cellContentView = [[UIView alloc]init];
    _cellContentView.backgroundColor = [UIColor whiteColor];
    
    UIEdgeInsets padding = UIEdgeInsetsMake(8, 0, 8, 0);
    
    [self.contentView addSubview:_cellContentView];
    [_cellContentView addSubview:self.title];
    [_cellContentView addSubview:self.subTitle];
    
    [_cellContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.contentView).insets(padding);
    }];
    
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.cellContentView.mas_top).offset(padding.left);
        make.left.mas_equalTo(ws.cellContentView.mas_left).offset(0);
        make.right.mas_equalTo(ws.cellContentView.mas_right).offset(0);
    }];
    
    [self.subTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.title.mas_bottom).offset(padding.left);
        make.left.mas_equalTo(ws.cellContentView.mas_left).offset(0);
        make.right.mas_equalTo(ws.cellContentView.mas_right).offset(0);
    }];
}

- (UILabel *)title{
    if (!_title) {
        _title = [[UILabel alloc]init];
        _title.textAlignment = NSTextAlignmentLeft;
        _title.lineBreakMode = NSLineBreakByTruncatingTail;//lineBreakMode Optional
    }
    return _title;
}

- (UILabel *)subTitle{
    if (!_subTitle) {
        _subTitle = [[UILabel alloc]init];
        _subTitle.font = [UIFont systemFontOfSize:16];
        _subTitle.textColor = [UIColor grayColor];
        _subTitle.textAlignment = NSTextAlignmentLeft;
        _title.lineBreakMode = NSLineBreakByTruncatingTail;//lineBreakMode Optional
    }
    return _subTitle;
}

+ (NSString *)identifier {
    return @"MSAllDayViewCell_identifier";
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
