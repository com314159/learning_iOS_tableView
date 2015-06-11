//
//  KSLabelHelper.h
//  KeyShare
//
//  Created by gzc on 15/5/22.
//  Copyright (c) 2015年 Jaxus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KSLabelHelper : NSObject

#pragma mark - Text

+ (CGFloat)getTextWidthWithText:(NSString *)text Font:(UIFont *)font;

+ (CGFloat)getTextHeightWithText:(NSString *)text Font:(UIFont *)font Width:(CGFloat)width;

+ (CGFloat)getTextWidthWithText:(NSMutableAttributedString *)text;

+ (CGFloat)getTextHeightWithText:(NSMutableAttributedString *)text Width:(CGFloat)width;

/**
 *  得到该字体的一行的高度
 */
+ (CGFloat)getTextSingleLineHeightWithFont:(UIFont *)font;

@end
