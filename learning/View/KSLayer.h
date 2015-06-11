//
//  KSLayer.h
//  KeyShare
//
//  Created by LiuYihan on 15/5/29.
//  Copyright (c) 2015年 Jaxus. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface KSLayer : NSObject

// 线性
+ (CAMediaTimingFunction *)linearFunction;
// 加速离开
+ (CAMediaTimingFunction *)easeInFunction;
// 减速离开
+ (CAMediaTimingFunction *)easeOutFunction;
// 前半部分in，后半部分out
+ (CAMediaTimingFunction *)easeInEaseOutFunction;

@property (nonatomic, assign) CGFloat ripplePercent;

- (instancetype)initWithLayer:(CALayer *)layer;

- (void)superLayerDidResize;
- (void)didChangeTapLocation:(CGPoint)location;

- (void)animateScaleForCircleLayer:(CGFloat)fromScale
                           toScale:(CGFloat)toScale
                    timingFunction:(CAMediaTimingFunction *)timingFunction
                          duration:(CFTimeInterval)duration;

- (void)animateAlphaForBackgroundLayer:(CAMediaTimingFunction *)timingFunction
                              duration:(CFTimeInterval)duration;

- (void)animateAlphaForBackgroundLayer:(CAMediaTimingFunction *)timingFunction
                              duration:(CFTimeInterval)duration
                         completeBlock:(void (^)())completeBlock;

- (void)animateShadowForLayer:(CALayer *)layer
                   fromRadius:(CGFloat)fromRadius
                     toRadius:(CGFloat)toRadius
                  fromOpacity:(CGFloat)fromOpacity
                    toOpacity:(CGFloat)toOpacity
               timingFunction:(CAMediaTimingFunction *)timingFunction
                     duration:(CFTimeInterval)duration;

- (void)enableOnlyCircleLayer;
- (void)setBackgroundLayerColor:(UIColor *)color;
- (void)setCircleLayerColor:(UIColor *)color;
- (void)enableMask:(BOOL)enable;
- (void)setBackgroundLayerCornerRadius:(CGFloat)cornRadius;

@end
