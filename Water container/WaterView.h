//
//  WaterView.h
//  Water container
//
//  Created by 李小柱 on 16/10/25.
//  Copyright © 2016年 hszy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaterView : UIView

@property(nonatomic,assign)BOOL isopen;
@property(nonatomic,assign)float percent;
- (id)initWithFrame:(CGRect)frame withHigh:(NSInteger)high;


@end
