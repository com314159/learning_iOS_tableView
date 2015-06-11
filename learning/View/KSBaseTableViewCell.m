//
//  KSBaseTableViewCell.m
//  KeyShare
//
//  Created by Singro on 12/3/14.
//  Copyright (c) 2014 Singro. All rights reserved.
//

#import "KSBaseTableViewCell.h"
#import "Colors.h"
#import "Macros.h"
#import "KeyShare-Prefix.pch"

@interface KSBaseTableViewCell ()


@end

@implementation KSBaseTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.clipsToBounds = YES;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];

        _topLineHidden = YES;
        _bottomLineHidden = YES;
        
        _topLineColor = kLineColorBlackDark;
        _bottomLineColor = kLineColorBlackDark;
        
        _needsHighlighted = YES;

    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    if (!self.needsHighlighted) {
        return;
    }
    
    UIColor *backbroundColor = [UIColor whiteColor];
    if (selected) {
        
        backbroundColor = kCellSelectedColorDark;
        self.backgroundColor = backbroundColor;
        
    } else {
        
        [UIView animateWithDuration:0.3 animations:^{
            self.backgroundColor = backbroundColor;
        } completion:^(BOOL finished) {
            [self setNeedsLayout];
        }];
        
    }
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    
    if (!self.needsHighlighted) {
        return;
    }

    UIColor *backbroundColor = [UIColor whiteColor];
    if (highlighted) {
        backbroundColor = kCellSelectedColorDark;
    }
    [UIView animateWithDuration:0.1 animations:^{
        self.backgroundColor = backbroundColor;
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.topLineView.frame = (CGRect){self.topLineInsertLeft, 0, kScreenWidth - self.topLineInsertLeft - self.topLineInsertRight, 0.5};
    self.bottomLineView.frame = (CGRect){self.bottomLineInsertLeft, self.height - 0.5, kScreenWidth - self.bottomLineInsertLeft - self.bottomLineInsertRight, 0.5};
    [self bringSubviewToFront:self.topLineView];
    [self bringSubviewToFront:self.bottomLineView];
    
}

- (void)setTopLineHidden:(BOOL)topLineHidden {
    _topLineHidden = topLineHidden;
    if (self.topLineView) {
        if (topLineHidden) {
            self.topLineView.hidden = YES;
        } else {
            self.topLineView.hidden = NO;
            self.topLineView.backgroundColor = self.topLineColor;
        }
    } else {
        if (!topLineHidden) {
            self.topLineView = [[UIView alloc] initWithFrame:(CGRect){self.topLineInsertLeft, 0, kScreenWidth - self.topLineInsertLeft - self.topLineInsertRight, 0.5}];
            self.topLineView.backgroundColor = self.topLineColor;
            [self addSubview:self.topLineView];
        }
    }
}

- (void)setBottomLineHidden:(BOOL)bottomLineHidden {
    _bottomLineHidden = bottomLineHidden;
    if (self.bottomLineView) {
        if (bottomLineHidden) {
            self.bottomLineView.hidden = YES;
        } else {
            self.bottomLineView.hidden = NO;
            self.bottomLineView.backgroundColor = self.topLineColor;
        }
    } else {
        if (!bottomLineHidden) {
            self.bottomLineView = [[UIView alloc] initWithFrame:(CGRect){self.bottomLineInsertLeft, self.height - 0.5, kScreenWidth - self.bottomLineInsertLeft - self.bottomLineInsertRight, 0.5}];
            self.bottomLineView.backgroundColor = self.topLineColor;
            [self addSubview:self.bottomLineView];
        }
    }
}

- (void)setTopLineColor:(UIColor *)topLineColor {
    _topLineColor = topLineColor;
    self.topLineView.backgroundColor = topLineColor;
}

- (void)setBottomLineColor:(UIColor *)bottomLineColor {
    _bottomLineColor = bottomLineColor;
    self.bottomLineView.backgroundColor = bottomLineColor;
}

- (void)setTopLineInsertLeft:(CGFloat)topLineInsertLeft {
    _topLineInsertLeft = topLineInsertLeft;
    self.topLineView.frame = (CGRect){self.topLineInsertLeft, 0, kScreenWidth - self.topLineInsertLeft - self.topLineInsertRight, 0.5};
}

- (void)setTopLineInsertRight:(CGFloat)topLineInsertRight {
    _topLineInsertRight = topLineInsertRight;
    self.topLineView.frame = (CGRect){self.topLineInsertLeft, 0, kScreenWidth - self.topLineInsertLeft - self.topLineInsertRight, 0.5};
}

- (void)setBottomLineInsertLeft:(CGFloat)bottomLineInsertLeft {
    _bottomLineInsertLeft = bottomLineInsertLeft;
    self.bottomLineView.frame = (CGRect){self.bottomLineInsertLeft, self.height - 0.5, kScreenWidth - self.bottomLineInsertLeft - self.bottomLineInsertRight, 0.5};
}

- (void)setBottomLineInsertRight:(CGFloat)bottomLineInsertRight {
    _bottomLineInsertRight = bottomLineInsertRight;
    self.bottomLineView.frame = (CGRect){self.bottomLineInsertLeft, self.height - 0.5, kScreenWidth - self.bottomLineInsertLeft - self.bottomLineInsertRight, 0.5};
}

@end
