//
//  KSCourseRateView.m
//  KeyShare
//
//  Created by Singro on 12/12/14.
//  Copyright (c) 2014 Singro. All rights reserved.
//

#import "KSCourseRateView.h"
#import "ViewFrameAccessor.h"

static CGFloat const kRateViewHeightNormal = 13.0f;
static CGFloat const kRateViewHeightBig = 35.0f;

@interface KSCourseRateView ()

@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, assign, readwrite) NSInteger intRate;

@end

@implementation KSCourseRateView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.clipsToBounds = NO;
        
        NSMutableArray *arr = [NSMutableArray new];
        for (int i = 0; i < 5; i ++) {
            UIImageView *imageView = [UIImageView new];
            [self addSubview:imageView];
            [arr addObject:imageView];
        }
        
        self.imageArray = arr;
        self.type = KSRateTypeNormal;
        
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
}

#pragma mark - Setter

- (void)setType:(KSRateType)type {
    _type = type;
    
    CGFloat rateHeight = 0;
    if (type == KSRateTypeBig) {
        rateHeight = kRateViewHeightBig;
    } else {
        rateHeight = kRateViewHeightNormal;
    }
    
    for (int i = 0; i < 5; i ++) {
        UIImageView *imageView = (UIImageView *)self.imageArray[i];
        imageView.frame = (CGRect){i * rateHeight, 0, rateHeight, rateHeight};
    }

    self.height = rateHeight;
    self.width = rateHeight * 5;

}

- (void)setRate:(CGFloat)rate {
    _rate = rate;
    
    if (self.type == KSRateTypeBig) {
        for (int i = 0; i < 5; i ++) {
            UIImageView *imageView = (UIImageView *)self.imageArray[i];
            if (rate - i > 0) {
                imageView.image = [UIImage imageNamed: @"course_star_big_highlighted"];
            } else {
                imageView.image = [UIImage imageNamed: @"course_star_big_normal"];
            }
        }
    } else {
        for (int i = 0; i < 5; i ++) {
            UIImageView *imageView = (UIImageView *)self.imageArray[i];
            if (rate < 0.1) {
                imageView.image = [UIImage imageNamed: @"course_star_fade"];
                continue;
            }
            if (rate - i > 0.95) {
                imageView.image = [UIImage imageNamed: @"course_star_highlighted"];
            } else if (rate - i > 0.45) {
                imageView.image = [UIImage imageNamed: @"course_star_half"];
            } else {
                imageView.image = [UIImage imageNamed: @"course_star_normal"];
            }
        }
    }

}

//- (void)setCount:(NSInteger)count {
//    _count = count;
//    
//    if (!count && self.type == KSRateTypeNormal) {
//        for (int i = 0; i < 5; i ++) {
//            UIImageView *imageView = (UIImageView *)self.imageArray[i];
//            imageView.image = [UIImage imageNamed: @"course_star_fade"];
//        }
//    }
//    
//}

- (NSInteger)intRate {
    NSInteger rate = 0;
    if (self.type == KSRateTypeBig) {
        for (int i = 0; i < 5; i ++) {
            if (self.rate - i >= -0.001) {
                rate++;
            }
        }
    }
    return rate;
}

@end
