//
//  UIView+InnerShadow.h
//  内阴影绘制
//
//  Created by 云翼天 on 16/8/9.
//  Copyright © 2016年 SYFH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (InnerShadow)

- (UIBezierPath *)innerShadowPath;
- (void)setInnerShadowPath:(UIBezierPath *)innerShadowPath;

- (UIColor *)innerShadowColor;
- (void)setInnerShadowColor:(UIColor *)innerShadowColor;

- (CGSize)innerShadowOffset;
- (void)setInnerShadowOffset:(CGSize)innerShadowOffset;

- (CGFloat)innerShadowRadius;
- (void)setInnerShadowRadius:(CGFloat)innerShadowRadius;

- (CGFloat)innerShadowOpacity;
- (void)setInnerShadowOpacity:(CGFloat)innerShadowOpacity;

- (void)addInnerShadow;
- (void)removeInnerShadow;

@end
