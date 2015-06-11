//
//  KSStringUtil.h
//  KeyShare
//
//  Created by gzc on 15/4/7.
//  Copyright (c) 2015年 Jaxus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KSStringUtil : NSObject
/**
 把元转成相应的带2位数的字符串
 如传入1.23
 得到¥1.23
 
 如传入1
 得到 ¥1.00
 */
+ (NSString * )getYuanPriceString: (CGFloat)yuan;

/**
 得到大数据的中文显示
 
 10万以内显示具体数目，10万以上显示xx.x万（小数点四舍五入），过了亿显示xx.x亿（小数点四舍五入）。
 156948=15.7万
 
 99999=99999 100000=10万 100001=10万 103654=10.4万
 */
+ (NSString *) getLargeNumberZhString:(NSInteger) v;

/**
 *  得到类似99+的函数
 */
+ (NSString *) get99String:(NSInteger) v;

+ (NSString *) toString:(NSInteger) v;

+ (NSString *) NSDatatoString:(NSData *) data;

+ (NSData *) stringtoNSData:(NSString*) string;

+ (NSString *) limiteStringLength:(NSString*)text maxLength:(NSInteger)length;

+ (BOOL)stringHaveNotEnglishCharacter:(NSString *)text;

@end
