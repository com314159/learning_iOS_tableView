//
//  KSCourseListCell.m
//  KeyShare
//
//  Created by Singro on 12/3/14.
//  Copyright (c) 2014 Singro. All rights reserved.
//

#import "KSCourseListCell.h"

#import "KSCourseRateView.h"
#import "KSStringUtil.h"
#import "KSImageRatio.h"
#import "KSLabelHelper.h"
#import "UIImage+Tint.h"

#import "KSLayer.h"
#import "LPLabel.h"

#import "KeyShare-Prefix.pch"

#define kMiddleLineColor RGBA(0xf4f4f4, 1)
#define kProviderTextColor RGBA(0x999999, 1)
#define kSelectedBackgroundColor RGBA(0xf14d7e, 0.1)


@interface KSCourseListCell ()

@property (nonatomic, strong) UIView             *blankBackgroundView;
@property (nonatomic, strong) UIImageView        *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel            *enrollNumLabel;
@property (nonatomic, strong) UILabel   *providerLabel;
@property (nonatomic, strong) LPLabel            *listPriceLabel;
@property (nonatomic, strong) UILabel            *priceLabel;
@property (nonatomic, strong) UIImageView        *enrollImageView;
@property (nonatomic, strong) UIImageView        *markImageView;
@property (nonatomic, strong) UIView             *enrollBgView;


@property (nonatomic) CGFloat marginLeftRight;
@property (nonatomic) CGFloat courseIconHeight;
@property (nonatomic) CGFloat courseIconWidth;

@property (nonatomic, strong) KSLayer *kslayer;

@end

@implementation KSCourseListCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpViewSizes];
        [self configureViews];
        self.backgroundColor = [UIColor clearColor];
        _rankNumber = 0;
    }
    return self;
}

#pragma mark - Set up layer 

- (void)setUpLayer{
    
    self.kslayer = [[KSLayer alloc] initWithLayer:self.layer];
    
    UIColor *color = kCellSelectedColor;
    
    [self.kslayer setBackgroundLayerColor:color];
    [self.kslayer setCircleLayerColor:[UIColor colorWithWhite:0.45 alpha:0.5]];
    self.kslayer.ripplePercent = 0.5;
}

#pragma mark - Touch event

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    
    if (selected) {
    
         [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
             self.blankBackgroundView.backgroundColor = kSelectedBackgroundColor;
         }completion:nil];
    }
    else {
        [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.blankBackgroundView.backgroundColor = [UIColor whiteColor];
        }completion:nil];
    }
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    
    if (self.isSelected){
        return;
    }
    
    if (highlighted){
        [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.blankBackgroundView.backgroundColor = kSelectedBackgroundColor;
        }completion:nil];
    }
    else {
        [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.blankBackgroundView.backgroundColor = [UIColor whiteColor];
        }completion:nil];
    }
}

#pragma mark - Set up

- (void) setUpViewSizes {
    self.marginLeftRight = 10;
    self.courseIconHeight = 80;
    self.courseIconWidth = [KSImageRatio toRatioImageWidth16to9:self.courseIconHeight];
}

#pragma mark - Layout

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat marginTopBottom = 15;
    
    self.blankBackgroundView.frame = (CGRect){0, 0, self.width, self.height};
    self.iconImageView.frame       = (CGRect){self.marginLeftRight, marginTopBottom, self.courseIconWidth, self.courseIconHeight};
    
    self.markImageView.frame      = (CGRect){self.iconImageView.left, self.iconImageView.top, self.iconImageView.height * 1 / 2, self.iconImageView.height * 1 / 2};
    
    CGFloat marginIconRight = 10;
    CGFloat titleLabelWidth = self.blankBackgroundView.width - (self.iconImageView.right + marginIconRight) - 15;
    
    CGFloat titlesingleLineHeight = [KSLabelHelper getTextSingleLineHeightWithFont:self.titleLabel.font];
    
    self.titleLabel.frame          = (CGRect){self.iconImageView.right + marginIconRight, self.iconImageView.top,titleLabelWidth, 2 * titlesingleLineHeight};
    
    CGFloat wordWidth = [KSLabelHelper getTextWidthWithText:[KSStringUtil getLargeNumberZhString:12323] Font:self.enrollNumLabel.font];
    
    self.enrollBgView.frame = (CGRect){0,0,5 + 7.5 + 5 + wordWidth + 5,17.5};
    self.enrollBgView.right = self.iconImageView.right - 4;
    self.enrollBgView.bottom = self.iconImageView.bottom - 4;
    
    self.enrollImageView.frame = (CGRect){5,0,7.5,7.5};
    self.enrollImageView.centerY = self.enrollBgView.height / 2;

    [self.enrollNumLabel sizeToFit];
    self.enrollNumLabel.centerY = self.enrollBgView.height / 2;
    self.enrollNumLabel.right = self.enrollBgView.width - 5;
    
    [self.priceLabel sizeToFit];
    self.priceLabel.right = self.blankBackgroundView.width - 15;
    self.priceLabel.centerY = self.enrollBgView.centerY;
    
    [self.listPriceLabel sizeToFit];
    self.listPriceLabel.right = self.priceLabel.right;
    self.listPriceLabel.bottom = self.priceLabel.top;
    
    self.providerLabel.frame = (CGRect){self.titleLabel.left,0,self.priceLabel.left - self.titleLabel.left - 20,20};
    self.providerLabel.centerY = self.priceLabel.centerY;
 
    self.bottomLineInsertLeft = 10;
}

#pragma mark - Configure Views

- (void)configureViews {
    self.bottomLineColor = kTextColorBlackc;
    self.bottomLineInsertLeft = self.marginLeftRight;
    
    self.blankBackgroundView = [[UIView alloc] init];
    self.blankBackgroundView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.blankBackgroundView];
    
    self.iconImageView              = [[UIImageView alloc] init];
    self.iconImageView.backgroundColor = kCellSelectedColorDark;
    self.iconImageView.contentMode = UIViewContentModeCenter;
    self.iconImageView.clipsToBounds = YES;
    [self.blankBackgroundView addSubview:self.iconImageView];
    
    self.titleLabel                 = [[UILabel alloc] init];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.textAlignment   = NSTextAlignmentLeft;
    self.titleLabel.font            = [UIFont systemFontOfSize:15];
    self.titleLabel.numberOfLines = 2;
    self.titleLabel.textColor = kTextColorBlack3;
    [self.blankBackgroundView addSubview:self.titleLabel];
    
    self.providerLabel                 = [[UILabel alloc] init];
    self.providerLabel.textAlignment   = NSTextAlignmentLeft;
    self.providerLabel.font            = [UIFont systemFontOfSize:15];
    self.providerLabel.numberOfLines = 1;
    self.providerLabel.textColor = kTextColorBlack9;
    [self.blankBackgroundView addSubview:self.providerLabel];
    
    self.enrollBgView = [[UIView alloc] init];
    self.enrollBgView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.28f];
    self.enrollBgView.layer.cornerRadius = 1.5f;
    [self.blankBackgroundView addSubview:self.enrollBgView];
    
    self.enrollImageView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"course_student"] imageWithTintColor:[UIColor whiteColor]]];
    self.enrollImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.enrollBgView addSubview:self.enrollImageView];
    
    self.enrollNumLabel                 = [[UILabel alloc] init];
    self.enrollNumLabel.textAlignment   = NSTextAlignmentRight;
    self.enrollNumLabel.font            = [UIFont systemFontOfSize:17];
    self.enrollNumLabel.textColor = [UIColor whiteColor];
    [self.enrollBgView addSubview:self.enrollNumLabel];
    
    self.listPriceLabel = [[LPLabel alloc] init];
    self.listPriceLabel.textAlignment   = NSTextAlignmentRight;
    self.listPriceLabel.font            = [UIFont systemFontOfSize:14];
    self.listPriceLabel.strikeThroughEnabled = YES;
    self.listPriceLabel.strikeThroughColor = RGBA(0x5d5d5d, 1.0);
    self.listPriceLabel.textColor = kProviderTextColor;
    [self.blankBackgroundView addSubview:self.listPriceLabel];

    self.priceLabel                 = [[UILabel alloc] init];
    self.priceLabel.textAlignment   = NSTextAlignmentRight;
    self.priceLabel.font            = [UIFont systemFontOfSize:14];
    self.priceLabel.textColor       = kTextColorBlack9;
    [self.blankBackgroundView addSubview:self.priceLabel];
    
    self.markImageView              = [[UIImageView alloc] init];
    self.markImageView.contentMode = UIViewContentModeCenter;
    self.markImageView.clipsToBounds = YES;
    self.markImageView.hidden       = YES;
    [self.blankBackgroundView addSubview:self.markImageView];
    
    self.bottomLineHidden = NO;
    self.bottomLineColor = kLineColorBlackLight;
}

#pragma mark - Setter

- (void)setData{

    self.titleLabel.text = @"这是一门什么课?";
    
    self.iconImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.iconImageView.image = [UIImage imageNamed:@"default_image_large"];


    self.providerLabel.text = @"当一名好老师";
    self.enrollNumLabel.text = [KSStringUtil getLargeNumberZhString:122333];
    
    CGFloat price = 125;
    CGFloat listPrice = 134;

        if (price == 0) {
            self.priceLabel.textColor = kColorPurple;
            self.priceLabel.text = @"免费";
        } else {
            self.priceLabel.textColor = kColorPurple;
            self.priceLabel.text = [NSString stringWithFormat:@"¥%.2f", price / 100.0];
        }
        
        if (listPrice > price) {
            self.listPriceLabel.text = [NSString stringWithFormat:@"¥%.2f", listPrice / 100.0];
        } else {
            self.listPriceLabel.text = nil;
        }
    
    [self setNeedsLayout];
}


#pragma mark - Notifications

- (void)setProgress:(CGFloat )progress{
    
    _progress = progress;
    
    self.priceLabel.text = [NSString stringWithFormat:@"进度: %.0f%%",progress * 100];
    [self.priceLabel sizeToFit];
}

#pragma mark - Class Methods

+ (CGFloat)cellHeight {
    return 110;
}

@end
