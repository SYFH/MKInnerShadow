//
//  MKInnerShadowLayer.h
//  内阴影绘制
//
//  Created by 云翼天 on 16/8/1.
//  Copyright © 2016年 SYFH. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface MKInnerShadowLayer : CALayer

/*!
 @brief 内阴影的生成路径, 默认为nil, 无动画
    详情可参考CALayer的shadowPath, 但为了支持多重内阴影, 故path为nil时, 什么都不会显示, 
    直到不为nil时
 */
@property (nonatomic, strong) UIBezierPath *innerShadowPath;

/*!
 @brief 内阴影的颜色, 默认为100%透明的黑色, 有动画
    详情可参考CALayer的shadowColor
 */
@property (nonatomic, strong) UIColor      *innerShadowColor;

/*!
 @brief 内阴影的位置, 默认为(0, -3), 有动画
    详情可参考CALayer的shadowOffset
 */
@property (nonatomic, assign) CGSize       innerShadowOffset;

/*!
 @brief 内阴影的扩散量, 默认为5, 有动画
    详情可参考CALayer的shadowRadius
 */
@property (nonatomic, assign) CGFloat      innerShadowRadius;

/*!
 @brief 内阴影的透明度, 默认为0, 有动画
    详情可参考CALayer的shadowOpacity
 */
@property (nonatomic, assign) CGFloat      innerShadowOpacity;

@end
