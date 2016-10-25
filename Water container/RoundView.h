//
//  RoundView.h
//  Water container
//
//  Created by 李小柱 on 16/10/25.
//  Copyright © 2016年 hszy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoundView : UIView

@property(nonatomic,assign)CGFloat Waterx;
@property(nonatomic,assign)CGFloat Watery;
@property(nonatomic,assign)CGFloat WaterW;
@property(nonatomic,assign)CGFloat waterH;
@property(nonatomic,assign)CGFloat waterr;
@property(nonatomic,assign)CGFloat LineW;


@property(nonatomic,assign)float percent;

//创建全局属性的ShapeLayer
@property(nonatomic,strong)CAShapeLayer * shapeLayer;

@end
