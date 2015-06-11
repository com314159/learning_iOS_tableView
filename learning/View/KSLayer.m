//
//  KSLayer.m
//  KeyShare
//
//  Created by LiuYihan on 15/5/29.
//  Copyright (c) 2015年 Jaxus. All rights reserved.
//

#import "KSLayer.h"

#import "CAAnimation+Blocks.h"

@interface KSLayer()

@property (nonatomic, strong) CALayer *superLayer;
@property (nonatomic, strong) CALayer *rippleLayer;
@property (nonatomic, strong) CALayer *backgroundLayer;
@property (nonatomic, strong) CAShapeLayer *maskLayer;

@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat width;

@end

@implementation KSLayer

- (instancetype)initWithLayer:(CALayer *)layer{
    
    if (layer == nil){
        return nil;
    }
    
    self = [super init];
    
    if (self){
        
        self.height = CGRectGetHeight(layer.bounds);
        self.width = CGRectGetWidth(layer.bounds);
        
        self.superLayer = layer;
        
        // background layer
        self.backgroundLayer = [[CALayer alloc] init];
        self.backgroundLayer.frame = self.superLayer.bounds;
        self.backgroundLayer.opacity = 0.0f;
        [self.superLayer addSublayer:self.backgroundLayer];
        
        _ripplePercent = 0.9;
        
        // ripple layer
        CGFloat circleSize = fmax(self.height, self.width) * self.ripplePercent;
        CGFloat rippleCornerRadius = circleSize / 2;
        
        self.rippleLayer = [[CALayer alloc] init];
        self.rippleLayer.opacity = 0.0f;
        self.rippleLayer.cornerRadius = rippleCornerRadius;
        [self setCircleLayerLocationAt:(CGPoint){self.width / 2,self.height / 2}];
        [self.backgroundLayer addSublayer:self.rippleLayer];
        
        // mask layer
        self.maskLayer = [[CAShapeLayer alloc] init];
        [self setMaskLayerCornerRadius:self.superLayer.cornerRadius];
        self.backgroundLayer.mask = self.maskLayer;
    }
    
    return self;
}

- (void)setCircleLayerLocationAt:(CGPoint)center{
    
    CGFloat subSize = fmax(self.width, self.height) * self.ripplePercent;
    
    CGFloat subX = center.x - subSize / 2;
    CGFloat subY = center.y - subSize / 2;
    
    // disable animation when changing layer frame
    [CATransaction begin];
    [CATransaction setDisableActions:true];
    self.rippleLayer.cornerRadius = subSize / 2;
    self.rippleLayer.frame = (CGRect){subX,subY,subSize,subSize};
    [CATransaction commit];
}

- (void)setMaskLayerCornerRadius:(CGFloat)cornRadius{
    
    self.maskLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.backgroundLayer.bounds cornerRadius:cornRadius].CGPath;
}

#pragma mark - Public method 

- (void)superLayerDidResize{
    
    [CATransaction begin];
    [CATransaction setDisableActions:true];
    self.backgroundLayer.frame = self.superLayer.bounds;
    [self setMaskLayerCornerRadius:self.superLayer.cornerRadius];
    [CATransaction commit];
    [self setCircleLayerLocationAt:(CGPoint){self.width/2,self.height/2}];
}

- (void)didChangeTapLocation:(CGPoint)location{
    
    [self setCircleLayerLocationAt:location];
}

- (void)animateScaleForCircleLayer:(CGFloat)fromScale
                           toScale:(CGFloat)toScale
                    timingFunction:(CAMediaTimingFunction *)timingFunction
                          duration:(CFTimeInterval)duration{
    
    CABasicAnimation *rippleLayerAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    rippleLayerAnim.fromValue = [NSNumber numberWithDouble:fromScale];
    rippleLayerAnim.toValue = [NSNumber numberWithDouble:toScale];
    
    CABasicAnimation *opcatiyAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opcatiyAnim.fromValue = [NSNumber numberWithDouble:1.0f];
    opcatiyAnim.toValue = [NSNumber numberWithDouble:0.0f];
    
    CAAnimationGroup *groupAnim = [[CAAnimationGroup alloc] init];
    groupAnim.duration = duration;
    groupAnim.timingFunction = timingFunction;
    groupAnim.removedOnCompletion = false;
    groupAnim.fillMode = kCAFillModeForwards;
    
    groupAnim.animations = @[rippleLayerAnim,opcatiyAnim];
    [self.rippleLayer addAnimation:groupAnim forKey:@"groupAnimation"];
}

- (void)animateAlphaForBackgroundLayer:(CAMediaTimingFunction *)timingFunction
                              duration:(CFTimeInterval)duration{

    
    CABasicAnimation *backgroundLayerAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    backgroundLayerAnim.fromValue = [NSNumber numberWithDouble:1.0f];
    backgroundLayerAnim.toValue = [NSNumber numberWithDouble:0.5f];
    backgroundLayerAnim.duration = duration;
    backgroundLayerAnim.timingFunction = timingFunction;
    [self.backgroundLayer addAnimation:backgroundLayerAnim forKey:@"backAnimation"];
}

- (void)animateAlphaForBackgroundLayer:(CAMediaTimingFunction *)timingFunction
                              duration:(CFTimeInterval)duration
                         completeBlock:(void (^)())completeBlock{
    
    CABasicAnimation *backgroundLayerAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    backgroundLayerAnim.fromValue = [NSNumber numberWithDouble:1.0f];
    backgroundLayerAnim.toValue = [NSNumber numberWithDouble:0.5f];
    backgroundLayerAnim.duration = duration;
    backgroundLayerAnim.timingFunction = timingFunction;
    
    [backgroundLayerAnim setCompletion:^(BOOL finished, CALayer *layer) {
        
        if (finished){
            if (completeBlock){
                completeBlock();
            }
        }
    }];
    
    [self.backgroundLayer addAnimation:backgroundLayerAnim forKey:@"backAnimation"];
}

- (void)animateShadowForLayer:(CALayer *)layer
                   fromRadius:(CGFloat)fromRadius
                     toRadius:(CGFloat)toRadius
                  fromOpacity:(CGFloat)fromOpacity
                    toOpacity:(CGFloat)toOpacity
               timingFunction:(CAMediaTimingFunction *)timingFunction
                     duration:(CFTimeInterval)duration{
    
    CABasicAnimation *radiusAnimation = [CABasicAnimation animationWithKeyPath:@"shadowRadius"];
    radiusAnimation.fromValue = [NSNumber numberWithDouble:fromRadius];
    radiusAnimation.toValue = [NSNumber numberWithDouble:toRadius];
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"shadowOpacity"];
    opacityAnimation.fromValue = [NSNumber numberWithDouble:fromOpacity];
    opacityAnimation.toValue = [NSNumber numberWithDouble:toOpacity];
    
    CAAnimationGroup *groupAnimation = [[CAAnimationGroup alloc] init];
    groupAnimation.duration = duration;
    groupAnimation.timingFunction = timingFunction;
    groupAnimation.removedOnCompletion = false;
    groupAnimation.fillMode = kCAFillModeForwards;
    groupAnimation.animations = @[radiusAnimation, opacityAnimation];
    
    [layer addAnimation:groupAnimation forKey:@"groupAnimation"];
}

- (void)enableOnlyCircleLayer{
    
    [self.backgroundLayer removeFromSuperlayer];
    [self.superLayer addSublayer:self.rippleLayer];
}

- (void)setBackgroundLayerColor:(UIColor *)color{
    
    self.backgroundLayer.backgroundColor = color.CGColor;
}

- (void)setCircleLayerColor:(UIColor *)color{
    
    self.rippleLayer.backgroundColor = color.CGColor;
}

- (void)enableMask:(BOOL)enable{
    
    self.backgroundLayer.mask = enable == YES ? self.maskLayer : nil;
}

- (void)setBackgroundLayerCornerRadius:(CGFloat)cornRadius{
    
    self.backgroundLayer.cornerRadius = cornRadius;
}

- (void)setRipplePercent:(CGFloat)ripplePercent{
    
    _ripplePercent = ripplePercent;
    
    CGFloat subSize = fmax(self.width, self.height) * ripplePercent;
    CGFloat circleCornerRadius = subSize / 2;
    
    self.rippleLayer.cornerRadius = circleCornerRadius;
    [self setCircleLayerLocationAt:(CGPoint){self.width / 2,self.height / 2}];
}

#pragma mark - Static method 

+ (CAMediaTimingFunction *)linearFunction{
    
    return [CAMediaTimingFunction functionWithName:@"linear"];
}

+ (CAMediaTimingFunction *)easeInFunction{
    
    return [CAMediaTimingFunction functionWithName:@"easeIn"];
}

+ (CAMediaTimingFunction *)easeOutFunction{
    
    return [CAMediaTimingFunction functionWithName:@"easeOut"];
}

+ (CAMediaTimingFunction *)easeInEaseOutFunction{
    
    return [CAMediaTimingFunction functionWithName:@"easeInEaseOut"];
}

@end
