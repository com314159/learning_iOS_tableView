//
//  KSImageRatio.h
//  KeyShare
//
//  Created by gzc on 15/5/20.
//  Copyright (c) 2015年 Jaxus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KSImageRatio : NSObject

/**
 *
 * 通过图片高度计算一张16比9的宽度
 */
+ (CGFloat) toRatioImageWidth16to9:(CGFloat) imageHeight;

/**
 * 通过图片宽度计算一张16比9的高度
 */
+ (CGFloat) toRatioImageHeight16to9:(CGFloat) imageWidth;

/**
 *  得到一张16比9的比例
 */
+ (CGFloat) imageRatioHW16to9;

+ (CGFloat) toRatioImageWidth320to147:(CGFloat) imageHeight;

+ (CGFloat) toRatioImageHeight320to147:(CGFloat) imageWidth;

+ (CGFloat) imageRatioHW320to147;


+ (CGFloat) toRatioImageWidth:(CGFloat) imageHeight imageRatioHtoW:(CGFloat) ratio;
+ (CGFloat) toRatioImageHeight:(CGFloat) imageWidth imageRatioHtoW:(CGFloat) ratio;
@end
