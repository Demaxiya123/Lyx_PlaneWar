//
//  StrategyView.h
//  Lyx_PlaneWar
//
//  Created by liaoyongxing on 2017/5/22.
//  Copyright © 2017年 Lyx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StrategyExpView.h"

/* 游戏玩法 */
@interface StrategyView : UIView

@property (nonatomic, retain)StrategyExpView *strategyExpView;
@property (nonatomic, retain)UITapGestureRecognizer *tap;

@end
