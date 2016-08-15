//
//  ViewController.m
//  MKInnerShadowDemo
//
//  Created by 云翼天 on 16/8/12.
//  Copyright © 2016年 SYFH. All rights reserved.
//

#import "ViewController.h"
#import "UIView+InnerShadow.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *testInnerShadowView;

@property (weak, nonatomic) IBOutlet UIButton *innerShadowColor_1;
@property (weak, nonatomic) IBOutlet UIButton *innerShadowColor_2;
@property (weak, nonatomic) IBOutlet UIButton *innerShadowColor_3;
@property (weak, nonatomic) IBOutlet UIButton *innerShadowColor_4;

@property (weak, nonatomic) IBOutlet UITextField *innerShadowOffsetXTF;
@property (weak, nonatomic) IBOutlet UIStepper   *innerShadowOffsetX;
@property (weak, nonatomic) IBOutlet UITextField *innerShadowOffsetYTF;
@property (weak, nonatomic) IBOutlet UIStepper   *innerShadowOffsetY;

@property (weak, nonatomic) IBOutlet UITextField *innerShadowRadiusTF;
@property (weak, nonatomic) IBOutlet UIStepper   *innerShadowRadius;

@property (weak, nonatomic) IBOutlet UITextField *innerShadowOpacityTF;
@property (weak, nonatomic) IBOutlet UIStepper   *innerShadowOpacity;

@end

@implementation ViewController

#pragma mark - 响应事件 -
- (void)changeInnerShadowOffsetX {
    [self setupForTextField];
    CGSize old = self.testInnerShadowView.innerShadowOffset;
    CGSize new = CGSizeMake(self.innerShadowOffsetX.value, old.height);
    self.testInnerShadowView.innerShadowOffset = new;
}

- (void)changeInnerShadowOffsetY {
    [self setupForTextField];
    CGSize old = self.testInnerShadowView.innerShadowOffset;
    CGSize new = CGSizeMake(old.width, self.innerShadowOffsetY.value);
    self.testInnerShadowView.innerShadowOffset = new;
}

- (void)changeInnerShadowRadius {
    [self setupForTextField];
    CGFloat radius = self.innerShadowRadius.value;
    self.testInnerShadowView.innerShadowRadius = radius;
}

- (void)changeInnerShadowOpacity {
    [self setupForTextField];
    CGFloat opacity = self.innerShadowOpacity.value;
    self.testInnerShadowView.innerShadowOpacity = opacity;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupForInnerShadowView];
    [self setupForStepper];
    [self setupForTextField];
    [self setupForColor];
}

// 初始化测试用视图
- (void)setupForInnerShadowView {
    self.testInnerShadowView.layer.cornerRadius = 8;
    self.testInnerShadowView.layer.masksToBounds = YES;
    self.testInnerShadowView.innerShadowPath    = [UIBezierPath bezierPathWithRoundedRect:self.testInnerShadowView.bounds
                                                                             cornerRadius:8];
    self.testInnerShadowView.innerShadowColor   = [UIColor colorWithWhite:0.88 alpha:1];
    self.testInnerShadowView.innerShadowOffset  = CGSizeMake(3, 3);
    self.testInnerShadowView.innerShadowRadius  = 10;
    self.testInnerShadowView.innerShadowOpacity = 0;
    [self.testInnerShadowView addInnerShadow];
}

// 初始化UIStepper
- (void)setupForStepper {
    self.innerShadowOffsetX.minimumValue = -20.f;
    self.innerShadowOffsetX.maximumValue = 20.f;
    self.innerShadowOffsetX.value = 3.f;
    [self.innerShadowOffsetX addTarget:self
                                action:@selector(changeInnerShadowOffsetX)
                      forControlEvents:UIControlEventTouchUpInside];
    
    self.innerShadowOffsetY.minimumValue = -20.f;
    self.innerShadowOffsetY.maximumValue = 20.f;
    self.innerShadowOffsetY.value = 3.f;
    [self.innerShadowOffsetY addTarget:self
                                action:@selector(changeInnerShadowOffsetY)
                      forControlEvents:UIControlEventTouchUpInside];
    
    self.innerShadowRadius.minimumValue = 0.f;
    self.innerShadowRadius.maximumValue = 50.f;
    self.innerShadowRadius.value = 10.f;
    [self.innerShadowRadius addTarget:self
                               action:@selector(changeInnerShadowRadius)
                     forControlEvents:UIControlEventTouchUpInside];
    
    self.innerShadowOpacity.minimumValue = 0.f;
    self.innerShadowOpacity.maximumValue = 1.f;
    self.innerShadowOpacity.value = 0.f;
    [self.innerShadowOpacity addTarget:self
                                action:@selector(changeInnerShadowOpacity)
                      forControlEvents:UIControlEventTouchUpInside];
}

// 初始化UITextField
- (void)setupForTextField {
    self.innerShadowOffsetXTF.text = [NSString stringWithFormat:@"%0.0f", self.innerShadowOffsetX.value];
    self.innerShadowOffsetYTF.text = [NSString stringWithFormat:@"%0.0f", self.innerShadowOffsetY.value];
    self.innerShadowRadiusTF.text  = [NSString stringWithFormat:@"%0.0f", self.innerShadowRadius.value];
    self.innerShadowOpacityTF.text = [NSString stringWithFormat:@"%0.0f", self.innerShadowOpacity.value];
}

// 初始化颜色
- (void)setupForColor {
    [self setupForButton:self.innerShadowColor_1 withColor:[UIColor colorWithWhite:0.88 alpha:1]];
    [self setupForButton:self.innerShadowColor_2 withColor:[UIColor redColor]];
    [self setupForButton:self.innerShadowColor_3 withColor:[UIColor blackColor]];
    [self setupForButton:self.innerShadowColor_4 withColor:[UIColor blueColor]];
}

// 设置按钮颜色
- (void)setupForButton:(UIButton *)button withColor:(UIColor *)color {
    button.backgroundColor     = color;
    button.layer.borderColor   = [UIColor darkGrayColor].CGColor;
    button.layer.borderWidth   = 0.5;
    button.layer.cornerRadius  = 5;
    button.layer.masksToBounds = YES;
    [button addTarget:self
               action:@selector(changeInnerShadowColorWithButton:)
     forControlEvents:UIControlEventTouchUpInside];
}

- (void)changeInnerShadowColorWithButton:(UIButton *)button {
    UIColor *color = button.backgroundColor;
    self.testInnerShadowView.innerShadowColor = color;
}

@end
