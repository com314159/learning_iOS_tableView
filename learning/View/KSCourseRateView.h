//
//  KSCourseRateView.h
//  KeyShare
//
//  Created by Singro on 12/12/14.
//  Copyright (c) 2014 Singro. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, KSRateType) {
    KSRateTypeNormal,
    KSRateTypeBig,
};

@interface KSCourseRateView : UIView

@property (nonatomic, assign) CGFloat rate; // 0 ~ 5
@property (nonatomic, assign) KSRateType type;

@property (nonatomic, assign, readonly) NSInteger intRate;

//@property (nonatomic, assign) NSInteger count;

@end
