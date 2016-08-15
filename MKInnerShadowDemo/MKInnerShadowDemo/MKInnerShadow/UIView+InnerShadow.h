//
//  UIView+InnerShadow.h
//  内阴影绘制
//
//  Created by 云翼天 on 16/8/9.
//  Copyright © 2016年 SYFH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (InnerShadow)

/*!
 @brief 内阴影的路径
 等同于 @property (nonatomic, strong) UIBezierPath *innerShadowPath;
 */
- (UIBezierPath *)innerShadowPath;
- (void)setInnerShadowPath:(UIBezierPath *)innerShadowPath;

/*!
 @brief 内阴影的颜色
 等同于 @property (nonatomic, strong) UIColor *innerShadowColor;
 */
- (UIColor *)innerShadowColor;
- (void)setInnerShadowColor:(UIColor *)innerShadowColor;

/*!
 @brief 内阴影的偏移
 等同于 @property (nonatomic, assign) CGSize innerShadowOffset;
 */
- (CGSize)innerShadowOffset;
- (void)setInnerShadowOffset:(CGSize)innerShadowOffset;

/*!
 @brief 内阴影的阴影半径
 等同于 @property (nonatomic, assign) CGFloat innerShadowRadius;
 */
- (CGFloat)innerShadowRadius;
- (void)setInnerShadowRadius:(CGFloat)innerShadowRadius;

/*!
 @brief 内阴影的透明度, 0为完全透明
 等同于 @property (nonatomic, assign) CGFloat innerShadowOpacity;
 */
- (CGFloat)innerShadowOpacity;
- (void)setInnerShadowOpacity:(CGFloat)innerShadowOpacity;

/*!
 @brief 为了支持多层内阴影, 故留此方法, 不执行就不会添加内阴影
 */
- (void)addInnerShadow;

/*!
 @brief 清除内阴影, 为全部清除, 慎用
 */
- (void)removeInnerShadow;

@end
