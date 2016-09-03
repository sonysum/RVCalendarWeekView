//
//  MSAllDayViewCell.h
//  RVCalendarWeekView
//
//  Created by liuliangju on 9/3/16.
//  Copyright © 2016 revo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MSEvent;

@interface MSAllDayViewCell : UITableViewCell

- (void)setEventModel:(MSEvent *)model;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

+ (NSString *)identifier;


@end
