//
//  MKInnerShadowLayer.m
//  内阴影绘制
//
//  Created by 云翼天 on 16/8/1.
//  Copyright © 2016年 SYFH. All rights reserved.
//

#import "MKInnerShadowLayer.h"

@implementation MKInnerShadowLayer
#pragma mark - 重写系统初始化 -
- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupForDefault];
    }
    return self;
}

- (instancetype)initWithLayer:(id)layer {
    self = [super initWithLayer:layer];
    if (self) {
        [self setupForDefault];
        if ([layer isKindOfClass:[MKInnerShadowLayer class]]) {
            MKInnerShadowLayer *other = (MKInnerShadowLayer *)layer;
            self.innerShadowPath    = other.innerShadowPath;
            self.innerShadowColor   = other.innerShadowColor;
            self.innerShadowOffset  = other.innerShadowOffset;
            self.innerShadowRadius  = other.innerShadowRadius;
            self.innerShadowOpacity = other.innerShadowOpacity;
        }
    }
    return self;
}

- (void)layoutSublayers {
    [super layoutSublayers];
    [self setNeedsDisplay];
}

#pragma mark - 重写刷新方法 -
+ (BOOL)needsDisplayForKey:(NSString *)key {
    if (   [key isEqualToString:@"innerShadowPath"]
        || [key isEqualToString:@"innerShadowColor"]
        || [key isEqualToString:@"innerShadowOffset"]
        || [key isEqualToString:@"innerShadowRadius"]
        || [key isEqualToString:@"innerShadowOpacity"]) {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

- (id)actionForKey:(NSString *) key {
    if (   [key isEqualToString:@"innerShadowPath"]
        || [key isEqualToString:@"innerShadowColor"]
        || [key isEqualToString:@"innerShadowOffset"]
        || [key isEqualToString:@"innerShadowRadius"]
        || [key isEqualToString:@"innerShadowOpacity"]) {
        
        CABasicAnimation *animate = [CABasicAnimation animationWithKeyPath:key];
        animate.fromValue = [self.presentationLayer valueForKey:key];
        return animate;
    }
    return [super actionForKey:key];
}

#pragma mark - 初始化参数 -
- (void)setupForDefault {
    self.drawsAsynchronously = YES;// 进行异步绘制
    self.contentsScale       = [UIScreen mainScreen].scale;
    self.innerShadowPath     = NULL;
    self.innerShadowColor    = [[UIColor blackColor] colorWithAlphaComponent:1];
    self.innerShadowOffset   = CGSizeMake(0, 3);
    self.innerShadowRadius   = 5;
    self.innerShadowOpacity  = 0;
}

#pragma mark - 绘制内阴影 -
- (void)drawInContext:(CGContextRef)context {
    // 初始设置
    CGContextSetAllowsAntialiasing(context, YES);// 反锯齿
    CGContextSetShouldAntialias(context, YES);
    CGContextSetInterpolationQuality(context, kCGInterpolationHigh);// 画面质量
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();// 获取当前设备色彩空间
    
    // 设置内阴影路径
    CGRect rect = self.bounds;
    if (self.borderWidth != 0) {
        rect = CGRectInset(rect, self.borderWidth, self.borderWidth);
    }
    
    CGContextAddPath(context, self.innerShadowPath.CGPath);
    CGContextClip(context);
    
    CGMutablePathRef outer = CGPathCreateMutable();
    CGPathAddRect(outer, NULL, CGRectInset(rect, -1 * rect.size.width, -1 * rect.size.height));
    
    CGPathAddPath(outer, NULL, self.innerShadowPath.CGPath);
    CGPathCloseSubpath(outer);
    
    // 开始绘制内阴影
    CGFloat *oldComponents = (CGFloat *)CGColorGetComponents(self.innerShadowColor.CGColor);
    CGFloat newComponents[4];
    NSInteger numberOfComponents = CGColorGetNumberOfComponents(self.innerShadowColor.CGColor);
    
    switch (numberOfComponents) {
        case 2: { //grayscale
            newComponents[0] = oldComponents[0];
            newComponents[1] = oldComponents[0];
            newComponents[2] = oldComponents[0];
            newComponents[3] = oldComponents[1] * self.innerShadowOpacity;
        } break;
            
        case 4: { //RGBA
            newComponents[0] = oldComponents[0];
            newComponents[1] = oldComponents[1];
            newComponents[2] = oldComponents[2];
            newComponents[3] = oldComponents[3] * self.innerShadowOpacity;
        } break;
    }
    
    CGColorRef innerShadowColorWithMultipliedAlpha = CGColorCreate(colorspace, newComponents);
    CGColorSpaceRelease(colorspace);
    
    CGContextSetFillColorWithColor(context, innerShadowColorWithMultipliedAlpha);
    CGContextSetShadowWithColor(context, self.innerShadowOffset, self.innerShadowRadius, innerShadowColorWithMultipliedAlpha);
    
    CGContextAddPath(context, outer);
    CGContextEOFillPath(context);
    
    CGPathRelease(outer);
    CGColorRelease(innerShadowColorWithMultipliedAlpha);
}

@end
