//
//  StrategyView.m
//  Lyx_PlaneWar
//
//  Created by liaoyongxing on 2017/5/22.
//  Copyright © 2017年 Lyx. All rights reserved.
//

#import "StrategyView.h"

@implementation StrategyView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIWindow *keyWindow = [[UIApplication sharedApplication].delegate window];
        [keyWindow makeKeyAndVisible];
        [keyWindow addSubview:self];
        
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.3;
        
        _strategyExpView = [[StrategyExpView alloc] initWithFrame:CGRectMake(0, frame.size.height, frame.size.width, frame.size.height/2)];
        [keyWindow addSubview:self.strategyExpView];
        
        [UIView animateWithDuration:0.5 animations:^{
            _strategyExpView.transform = CGAffineTransformTranslate(_strategyExpView.transform, 0, -frame.size.height/2);
        } completion:^(BOOL finished) {
            
        }];
        
        _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction)];
        [self addGestureRecognizer:_tap];
    }
    return self;
}

- (void)tapGestureAction {
    [UIView animateWithDuration:0.5 animations:^{
        _strategyExpView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        [self.strategyExpView removeFromSuperview];
        [self removeGestureRecognizer:_tap];
    }];
}

@end
