//
//  EnemyPlaneView.h
//  Lyx_PlaneWar
//
//  Created by liaoyongxing on 2017/5/22.
//  Copyright © 2017年 Lyx. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, EnemyPlaneSize) {
    SmallSize = 0,
    NormalSize,
    LargeSize
};

@interface EnemyPlaneView : UIImageView

@property (nonatomic)NSInteger shootCount;//被击中次数
@property (nonatomic)EnemyPlaneSize planeSize;//大小
@property (nonatomic)CGFloat speedCoefficient;//速度

@end
