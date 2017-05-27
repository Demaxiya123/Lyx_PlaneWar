//
//  EnemyPlaneView.m
//  Lyx_PlaneWar
//
//  Created by liaoyongxing on 2017/5/22.
//  Copyright © 2017年 Lyx. All rights reserved.
//

#import "EnemyPlaneView.h"

@implementation EnemyPlaneView

- (instancetype)init {
    if (self = [super init]) {
        self.shootCount = 0;
        self.image = [UIImage imageNamed:@"diji"];
        self.layer.masksToBounds = YES;
    }
    return self;
}

@end
