//
//  CustomBtn.m
//  Lyx_PlaneWar
//
//  Created by liaoyongxing on 2017/5/22.
//  Copyright © 2017年 Lyx. All rights reserved.
//

#import "CustomBtn.h"

@implementation CustomBtn

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = [UIColor redColor].CGColor;
        self.layer.cornerRadius = 25;
        self.clipsToBounds = YES;
        [self setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        self.backgroundColor = [UIColor colorWithRed:253/255.0 green:251/255.0 blue:56/255.0 alpha:0.1];
//        self.alpha = 1;
    }
    return self;
}

@end
