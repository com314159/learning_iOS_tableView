//
//  KSBaseTableViewCell.h
//  KeyShare
//
//  Created by Singro on 12/3/14.
//  Copyright (c) 2014 Singro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSBaseTableViewCell : UITableViewCell

@property (nonatomic, strong) UIView *topLineView;
@property (nonatomic, strong) UIView *bottomLineView;

@property (nonatomic, assign, getter = isTopLineHidden) BOOL topLineHidden;
@property (nonatomic, copy  ) UIColor *topLineColor;
@property (nonatomic, assign) CGFloat topLineInsertLeft;
@property (nonatomic, assign) CGFloat topLineInsertRight;

@property (nonatomic, assign, getter = isBottomLineHideen) BOOL bottomLineHidden;
@property (nonatomic, copy  ) UIColor *bottomLineColor;
@property (nonatomic, assign) CGFloat bottomLineInsertLeft;
@property (nonatomic, assign) CGFloat bottomLineInsertRight;

@property (nonatomic, assign) BOOL needsHighlighted;

@end
