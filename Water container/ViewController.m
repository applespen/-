//
//  ViewController.m
//  Water container
//
//  Created by 李小柱 on 16/10/25.
//  Copyright © 2016年 hszy. All rights reserved.
//

#import "ViewController.h"
#import "WaterView.h"
#import "RoundView.h"
#define XWSCREENW [UIScreen mainScreen].bounds.size.width
#define XWSCREENH [UIScreen mainScreen].bounds.size.height
#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]

#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self CreateWater];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)CreateWater{
    
    RoundView *roundView = [[RoundView alloc]initWithFrame:CGRectMake(XWSCREENW/2 - 50, XWSCREENH/2-50, 100, 100)];
    roundView.LineW = 3;
    roundView.percent = 0.5;
    [self.view addSubview:roundView];
    
    WaterView *waterbig = [[WaterView alloc] initWithFrame:CGRectMake(XWSCREENW/2 - 50, XWSCREENH/2-50, 90, 90) withHigh:50];
    waterbig.layer.cornerRadius = waterbig.frame.size.width / 2;
    waterbig.layer.masksToBounds = YES;
    waterbig.isopen = NO;
    waterbig.percent = 0.5;
    roundView.center = waterbig.center;
    [self.view addSubview:waterbig];
    
    WaterView *watersmall = [[WaterView alloc] initWithFrame:CGRectMake(XWSCREENW/2 - 50, XWSCREENH/2-50, 90, 90) withHigh:50];
    watersmall.layer.cornerRadius = watersmall.frame.size.width / 2;
    watersmall.backgroundColor = [UIColor clearColor];
    watersmall.layer.masksToBounds = YES;
    watersmall.isopen = YES;
    watersmall.percent = 0.5;
    roundView.center = waterbig.center;
    [self.view addSubview:watersmall];
    
}

@end
