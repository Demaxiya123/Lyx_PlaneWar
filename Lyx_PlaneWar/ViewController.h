//
//  ViewController.h
//  Lyx_PlaneWar
//
//  Created by liaoyongxing on 2017/5/22.
//  Copyright © 2017年 Lyx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StrategyView.h"
#import "CustomBtn.h"
#import "MyPlaneView.h"
#import "EnemyPlaneView.h"
#import "BulletView.h"

@interface ViewController : UIViewController

@property (nonatomic, retain)UIImageView *bgView1;
@property (nonatomic, retain)UIImageView *bgView2;

@property (nonatomic, retain)UILabel *heartLab;
@property (nonatomic, retain)UILabel *highestScoreLab;
@property (nonatomic, retain)UILabel *scoreLab;
@property (nonatomic, retain)UILabel *superpowersLab;
@property (nonatomic, retain)UILabel *levelLab;

@property (nonatomic, retain)UILabel *gameOverLab;
@property (nonatomic, retain)UIButton *startBtn;
@property (nonatomic, retain)CustomBtn *strategyOrPauseBtn;
@property (nonatomic, retain)CustomBtn *superpowersBtn;

@property (nonatomic, retain)MyPlaneView *myPlane;

@property (nonatomic, retain)StrategyView *strategyView;

@property (nonatomic,copy)NSMutableArray *enemyPlaneArr;
@property (nonatomic,copy)NSMutableArray *bulletArr;
@property (nonatomic,copy)NSMutableArray *enemyPlaneExplodeArr;

@property (nonatomic, retain)NSTimer *findEnemyPlaneTimer;
@property (nonatomic, retain)NSTimer *findBulletTimer;
@property (nonatomic, retain)NSTimer *moveViewTimer;

@end

