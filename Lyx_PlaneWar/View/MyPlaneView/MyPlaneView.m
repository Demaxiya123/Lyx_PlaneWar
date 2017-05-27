//
//  MyPlaneView.m
//  Lyx_PlaneWar
//
//  Created by liaoyongxing on 2017/5/22.
//  Copyright © 2017年 Lyx. All rights reserved.
//

#import "MyPlaneView.h"

@implementation MyPlaneView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.heartCount = 100;
        self.superpowers = 3;
        self.score = 0;
        
        self.image = [UIImage imageNamed:@"plane1"];
        self.animationDuration = 0.5;
        self.animationImages = @[[UIImage imageNamed:@"plane2"],[UIImage imageNamed:@"plane1"]];
        self.animationRepeatCount = 0;
        [self startAnimating];
        
        self.layer.cornerRadius = 20;
        self.layer.masksToBounds = YES;
    }
    return self;
}

@end
