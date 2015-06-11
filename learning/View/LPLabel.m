//
//  LPLabel.m
//  label上画横线
//
//  Created by Li Pan on 14-6-30.
//  Copyright (c) 2014年 Pan Li. All rights reserved.
//

#import "LPLabel.h"

@implementation LPLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.strikeThroughEnabled = NO;
        self.strikeThroughColor = [UIColor redColor];
        self.bottomLineEnable = NO;
    }
    return self;
}

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
 
}
*/

- (void)drawTextInRect:(CGRect)rect
{
    [super drawTextInRect:rect];
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName: [self font],
                                 };

    CGSize textSize = [[self text] boundingRectWithSize:(CGSize){CGFLOAT_MAX, CGFLOAT_MAX}
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:attributes
                                                context:nil].size;
        
    CGFloat strikeWidth = textSize.width + 1;
    
    CGRect lineRect;
    
    if ([self textAlignment] == NSTextAlignmentRight)
    {
        // 画线居中
        lineRect = CGRectMake(rect.size.width - strikeWidth, rect.size.height/2, strikeWidth, 0.5);
        
        if (self.bottomLineEnable){
        // 画线居下
            lineRect = CGRectMake(rect.size.width - strikeWidth, rect.size.height/2 + textSize.height/2, strikeWidth, 0.5);
        }
    }
    else if ([self textAlignment] == NSTextAlignmentCenter)
    {
        // 画线居中
        lineRect = CGRectMake(rect.size.width/2 - strikeWidth/2, rect.size.height/2, strikeWidth, 0.5);
        
        if (self.bottomLineEnable){
        // 画线居下
            lineRect = CGRectMake(rect.size.width/2 - strikeWidth/2, rect.size.height/2 + textSize.height/2, strikeWidth, 0.5);
        }
    }
    else
    {
        // 画线居中
        lineRect = CGRectMake(0, rect.size.height/2, strikeWidth, 0.5);
        
        if (self.bottomLineEnable){
        // 画线居下
            lineRect = CGRectMake(0, rect.size.height/2 + textSize.height/2, strikeWidth, 0.5);
        }
    }
    
    if (self.strikeThroughEnabled)
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGContextSetFillColorWithColor(context, self.strikeThroughColor.CGColor);
        
        CGContextFillRect(context, lineRect);
    }
}

@end
