//
//  RoundView.m
//  Water container
//
//  Created by 李小柱 on 16/10/25.
//  Copyright © 2016年 hszy. All rights reserved.
//

#import "RoundView.h"

@implementation RoundView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setBackgroundColor:[UIColor clearColor]];
        _WaterW = frame.size.width;
        _waterH = frame.size.height;
        _Waterx = frame.origin.x;
        _Watery = frame.origin.y;

    }
    return self;
}

-(void)drawRect:(CGRect)rect{
    
    //外环
    UIBezierPath * Polyline = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(_LineW, _LineW, _WaterW - _LineW * 2, _waterH - _LineW * 2) cornerRadius:_WaterW/2];
    
    //设置填充颜色
    [[UIColor clearColor] setFill];
    //设置线条颜色
    [[UIColor cyanColor] setStroke];
    //设置宽度
    Polyline.lineWidth = _LineW;
    //添加到画布
    [Polyline fill];
    [Polyline stroke];
    
    
    //内环
    //创建出CAShapeLayer
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.frame = CGRectMake(_LineW/2, _LineW/2, _waterH- _LineW*2, _waterH - _LineW*2);
    self.shapeLayer.fillColor = [UIColor clearColor].CGColor;//填充颜色为ClearColor
    
    //设置线条的宽度和颜色
    self.shapeLayer.lineWidth = _LineW;
    self.shapeLayer.strokeColor = [UIColor lightGrayColor].CGColor;
    
    //创建出圆形贝塞尔曲线
    UIBezierPath * circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(_LineW/2, _LineW/2, _WaterW - _LineW*2, _waterH - _LineW*2)];
    
    //让贝塞尔曲线与CAShapeLayer产生联系
    self.shapeLayer.path = circlePath.CGPath;
    
    //设置stroke起始点
    self.shapeLayer.strokeStart = 0;
    self.shapeLayer.strokeEnd = _percent;
    
    //添加并显示
    [self.layer addSublayer:self.shapeLayer];
    
    
    //开始添加动画
    [CATransaction begin];
    //创建一个strokeEnd路径的动画
    CABasicAnimation * pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    //动画时间
    pathAnimation.duration = 3.0;
    //添加动画样式
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    //动画起点
    pathAnimation.fromValue = @0.0f;
    //动画停止位置
    pathAnimation.toValue = [NSNumber numberWithFloat:_percent];
    //把动画添加到CAShapeLayer
    [self.shapeLayer addAnimation:pathAnimation forKey:@"storkeEndAnimation"];
    //动画终点
    self.shapeLayer.strokeEnd = _percent;
    //结束动画
    [CATransaction commit];
    
    
    
    
}

@end
