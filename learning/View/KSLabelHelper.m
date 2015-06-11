//
//  KSLabelHelper.m
//  KeyShare
//
//  Created by gzc on 15/5/22.
//  Copyright (c) 2015年 Jaxus. All rights reserved.
//

#import "KSLabelHelper.h"

@implementation KSLabelHelper


//计算文字宽度时,如果有空格会有问题,此时建议换成字母"j"再测
+ (CGFloat)getTextWidthWithText:(NSString *)text Font:(UIFont *)font {
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName: font,
                                 };
    CGRect expectedLabelRect = [text boundingRectWithSize:(CGSize){CGFLOAT_MAX, CGFLOAT_MAX}
                                                  options:NSStringDrawingUsesLineFragmentOrigin
                                               attributes:attributes
                                                  context:nil];
    return CGRectGetWidth(expectedLabelRect);
    
}

//得到文字高度的函数有一个bug, 就是当第一行为回车时, 会没有计算第一行的高度, 以此类推
+ (CGFloat)getTextHeightWithText:(NSString *)text Font:(UIFont *)font Width:(CGFloat)width {
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName: font,
                                 };
    CGRect expectedLabelRect = [text boundingRectWithSize:(CGSize){width, CGFLOAT_MAX}
                                                  options:NSStringDrawingUsesLineFragmentOrigin
                                               attributes:attributes
                                                  context:nil];
    return CGRectGetHeight(expectedLabelRect);
    
}

//计算文字宽度时,如果有空格会有问题,此时建议换成字母"j"再测
+ (CGFloat)getTextWidthWithText:(NSMutableAttributedString *)text{
    
    if (text == nil){
        return 0;
    }
    
    CGRect expectedLabelRect = [text boundingRectWithSize:(CGSize){CGFLOAT_MAX,CGFLOAT_MAX} options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    
    return CGRectGetWidth(expectedLabelRect);
}

//得到文字高度的函数有一个bug, 就是当第一行为回车时, 会没有计算第一行的高度, 以此类推
+ (CGFloat)getTextHeightWithText:(NSMutableAttributedString *)text Width:(CGFloat)width{
    
    CGRect expectedLabelRect = [text boundingRectWithSize:(CGSize){width,CGFLOAT_MAX} options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    
    return CGRectGetHeight(expectedLabelRect);
}

+ (CGFloat)getTextSingleLineHeightWithFont:(UIFont *)font {
    NSDictionary *attributes = @{
                                 NSFontAttributeName: font,
                                 };
    
    NSString * text = @"我";
    
    CGRect expectedLabelRect = [text boundingRectWithSize:(CGSize){CGFLOAT_MAX, CGFLOAT_MAX}
                                                  options:NSStringDrawingUsesLineFragmentOrigin
                                               attributes:attributes
                                                  context:nil];
    
    return CGRectGetHeight(expectedLabelRect);
}

@end
