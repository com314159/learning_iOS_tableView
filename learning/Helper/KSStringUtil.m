//
//  KSStringUtil.m
//  KeyShare
//
//  Created by gzc on 15/4/7.
//  Copyright (c) 2015年 Jaxus. All rights reserved.
//

#import "KSStringUtil.h"

@implementation KSStringUtil

+ (NSString * )getYuanPriceString: (CGFloat)yuan{
    return [NSString stringWithFormat:@"¥%.2f", yuan];
}

+ (NSString *) getLargeNumberZhString:(NSInteger) v {
    NSInteger target = -1;
    NSString *stringvalue = nil;
    if (v > 100000000) {
        target = 100000000;
        stringvalue = @"亿";
    } else if (v > 100000){
        target = 10000;
        stringvalue = @"万";
    }
    
    if (target == -1) {
        return [NSString stringWithFormat:@"%zd",v];
    } else {
        CGFloat finalValue = v/(double)target;
        
        NSInteger valueTemp = finalValue * 10;
        NSInteger isZerovalue = valueTemp % 10; //取个位数,如果个位数为0,就去掉
        
        NSString *temps = nil;
        if (isZerovalue == 0) {
            temps = [NSString stringWithFormat:@"%.0f",finalValue];
        } else {
            temps = [NSString stringWithFormat:@"%.1f",finalValue];
        }
        
        return [temps stringByAppendingString:stringvalue];
    }
}

+ (NSString *) get99String:(NSInteger) v {
    if (v >= 100) {
        return @"99+";
    }
    
    return [self toString:v];
}

+ (NSString *) toString:(NSInteger) v{
    return [NSString stringWithFormat:@"%zd",v];
}

+ (NSString *) NSDatatoString:(NSData *) data {
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

+ (NSData *) stringtoNSData:(NSString*) string {
    return [string dataUsingEncoding:NSUTF8StringEncoding];
}

+ (NSString *) limiteStringLength:(NSString*)text maxLength:(NSInteger)length {
    NSString *s = text;
    
    if (length > 0) {
        if (text.length > length) {
            NSRange range = [text rangeOfComposedCharacterSequencesForRange:(NSRange){0, length}];
            s = [text substringWithRange:range];
            s = [s stringByAppendingString:@" …"];
        }
    }
    return s;
}

+ (BOOL)stringHaveNotEnglishCharacter:(NSString *)text{
    
    NSUInteger length = [text length];
    
    for (int i = 0; i < length; i++)
    {
        NSRange range = NSMakeRange(i, 1);
        NSString *subString = [text substringWithRange:range];
        const char *cString = [subString UTF8String];
        if (strlen(cString) != 1)
        {
            return YES;
        }
    }
    
    return NO;
}

@end