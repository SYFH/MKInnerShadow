//
//  UIView+InnerShadow.m
//  内阴影绘制
//
//  Created by 云翼天 on 16/8/9.
//  Copyright © 2016年 SYFH. All rights reserved.
//

#import "UIView+InnerShadow.h"
#import "MKInnerShadowLayer.h"
#import <objc/runtime.h>

static char innerShadowPathKey;
static char innerShadowColorKey;
static char innerShadowOffsetKey;
static char innerShadowRadiusKey;
static char innerShadowOpacityKey;

static char innerShadowLayerKey;

@implementation UIView (InnerShadow)
#pragma mark - 共有属性 setter/getter -
- (UIBezierPath *)innerShadowPath {
    return objc_getAssociatedObject(self, &innerShadowPathKey);
}
- (void)setInnerShadowPath:(UIBezierPath *)innerShadowPath {
    objc_setAssociatedObject(self,
                             &innerShadowPathKey,
                             innerShadowPath,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.innerShadowLayer.innerShadowPath = innerShadowPath;
    [self.innerShadowLayer setNeedsDisplay];
}

- (UIColor *)innerShadowColor {
    return objc_getAssociatedObject(self, &innerShadowColorKey);
}
- (void)setInnerShadowColor:(UIColor *)innerShadowColor {
    objc_setAssociatedObject(self,
                             &innerShadowColorKey,
                             innerShadowColor,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.innerShadowLayer.innerShadowColor = innerShadowColor;
    [self.innerShadowLayer setNeedsDisplay];
}

- (CGSize)innerShadowOffset {
    return [objc_getAssociatedObject(self, &innerShadowOffsetKey) CGSizeValue];
}
- (void)setInnerShadowOffset:(CGSize)innerShadowOffset {
    objc_setAssociatedObject(self,
                             &innerShadowOffsetKey,
                             [NSValue valueWithCGSize:innerShadowOffset],
                             OBJC_ASSOCIATION_ASSIGN);
    self.innerShadowLayer.innerShadowOffset = innerShadowOffset;
    [self.innerShadowLayer setNeedsDisplay];
}

- (CGFloat)innerShadowRadius {
    return [objc_getAssociatedObject(self, &innerShadowRadiusKey) doubleValue];
}
- (void)setInnerShadowRadius:(CGFloat)innerShadowRadius {
    objc_setAssociatedObject(self,
                             &innerShadowRadiusKey,
                             @(innerShadowRadius),
                             OBJC_ASSOCIATION_ASSIGN);
    self.innerShadowLayer.innerShadowRadius = innerShadowRadius;
    [self.innerShadowLayer setNeedsDisplay];
}

- (CGFloat)innerShadowOpacity {
    return [objc_getAssociatedObject(self, &innerShadowOpacityKey) doubleValue];
}
- (void)setInnerShadowOpacity:(CGFloat)innerShadowOpacity {
    objc_setAssociatedObject(self,
                             &innerShadowOpacityKey,
                             @(innerShadowOpacity),
                             OBJC_ASSOCIATION_ASSIGN);
    self.innerShadowLayer.innerShadowOpacity = innerShadowOpacity;
    [self.innerShadowLayer setNeedsDisplay];
}

#pragma mark - 私有属性 setter/getter -
- (MKInnerShadowLayer *)innerShadowLayer {
    return objc_getAssociatedObject(self, &innerShadowLayerKey);
}
- (void)setInnerShadowLayer:(MKInnerShadowLayer *)innerShadowLayer {
    objc_setAssociatedObject(self,
                             &innerShadowLayerKey,
                             innerShadowLayer,
                             OBJC_ASSOCIATION_ASSIGN);
}

// 添加内阴影
//TODO: 自动添加内阴影
- (void)addInnerShadow {
    MKInnerShadowLayer *innerShadowLayer = [MKInnerShadowLayer layer];
    innerShadowLayer.frame               = self.bounds;
    innerShadowLayer.innerShadowPath     = self.innerShadowPath;
    innerShadowLayer.innerShadowColor    = self.innerShadowColor;
    innerShadowLayer.innerShadowOffset   = self.innerShadowOffset;
    innerShadowLayer.innerShadowRadius   = self.innerShadowRadius;
    innerShadowLayer.innerShadowOpacity  = self.innerShadowOpacity;
    [self.layer addSublayer:innerShadowLayer];
    self.innerShadowLayer = innerShadowLayer;
}

- (void)removeInnerShadow {
    for (CALayer *subLayer in self.layer.sublayers) {
        if ([subLayer isKindOfClass:[MKInnerShadowLayer class]]) {
            [subLayer removeFromSuperlayer];
        }
    }
}

@end
