//
//  KSCourseListCell.h
//  KeyShare
//
//  Created by Singro on 12/3/14.
//  Copyright (c) 2014 Singro. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KSBaseTableViewCell.h"

@interface KSCourseListCell : KSBaseTableViewCell

@property (nonatomic, assign) NSInteger rankNumber;
@property (nonatomic, assign) CGFloat progress;

- (void)setData;

+ (CGFloat)cellHeight;

@end
