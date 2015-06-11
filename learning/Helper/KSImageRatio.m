//
//  KSImageRatio.m
//  KeyShare
//
//  Created by gzc on 15/5/20.
//  Copyright (c) 2015年 Jaxus. All rights reserved.
//

#import "KSImageRatio.h"

static const CGFloat imageRatioHW16to9 = 9/16.0;


static const CGFloat imageRatioHW320to147 = 147/320.0; // 约为0.45


@implementation KSImageRatio

+ (CGFloat) toRatioImageWidth16to9:(CGFloat) imageHeight {
    return imageHeight / imageRatioHW16to9;
}

+ (CGFloat) toRatioImageHeight16to9:(CGFloat) imageWidth {
    return imageWidth * imageRatioHW16to9;
}

+ (CGFloat) imageRatioHW16to9 {
    return imageRatioHW16to9;
}

+ (CGFloat) toRatioImageWidth320to147:(CGFloat) imageHeight {
    return imageHeight / imageRatioHW320to147;
}

+ (CGFloat) toRatioImageHeight320to147:(CGFloat) imageWidth {
    return imageWidth * imageRatioHW320to147;
}

+ (CGFloat) imageRatioHW320to147 {
    return imageRatioHW320to147;
}

+ (CGFloat) toRatioImageWidth:(CGFloat) imageHeight imageRatioHtoW:(CGFloat) ratio{
    return imageHeight / ratio;
}

+ (CGFloat) toRatioImageHeight:(CGFloat) imageWidth imageRatioHtoW:(CGFloat) ratio{
    return imageWidth * ratio;
}

@end
