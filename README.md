## MKInnerShadow

MKInnerShadow是用来添加视图内阴影的快捷工具

## 截图
![Screenshop](https://github.com/SYFH/MKInnerShadow/blob/master/Screenshot.png)

## 使用

```
self.testInnerShadowView.innerShadowPath    = [UIBezierPath bezierPathWithRoundedRect:self.testInnerShadowView.bounds cornerRadius:8];
self.testInnerShadowView.innerShadowColor   = [UIColor colorWithWhite:0.88 alpha:1];
self.testInnerShadowView.innerShadowOffset  = CGSizeMake(3, 3);
self.testInnerShadowView.innerShadowRadius  = 10;
self.testInnerShadowView.innerShadowOpacity = 0;

// 注意, 为了可以添加多层阴影, 在这里必须显示的调用 -addInnerShadow
[self.testInnerShadowView addInnerShadow];
```

## 安装

### 使用Pod
```
pod 'MKInnerShadow'
```

### 手动安装
1. 执行`git clone https://github.com/SYFH/MKInnerShadow.git`命令下载工具与Demo
2. 复制`MKInnerShadow`文件夹到项目中
3. 之后引用`#import "UIView+InnerShadow.h"`

## 联系

- 如果程序有问题, 请提交[issue](https://github.com/SYFH/MKInnerShadow/issues)
- 如果有其他好的建议, 请写邮件到syfh@live.com
- 如果你感觉写的还不错, 请点击Star!