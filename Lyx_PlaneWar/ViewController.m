//
//  ViewController.m
//  Lyx_PlaneWar
//
//  Created by liaoyongxing on 2017/5/22.
//  Copyright © 2017年 Lyx. All rights reserved.
//

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define SET_SCORE(score) [[NSUserDefaults standardUserDefaults] setObject:score forKey:@"score"]
#define GET_SCORE [[NSUserDefaults standardUserDefaults] objectForKey:@"score"]

#import "ViewController.h"

@interface ViewController () {
    CGFloat _interval;
    NSInteger _levelFalg;
    NSInteger _level;
    CGPoint _lastPiont;
}

@end

@implementation ViewController

#pragma mark == 初始化视图
- (UIImageView *)bgView1 {
    if (!_bgView1) {
        _bgView1 = [[UIImageView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        _bgView1.image = [UIImage imageNamed:@"bg"];
        [self.view addSubview:_bgView1];
    }
    return _bgView1;
}
- (UIImageView *)bgView2 {
    if (!_bgView2) {
        _bgView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, -SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _bgView2.image = [UIImage imageNamed:@"bg"];
        [self.view addSubview:_bgView2];
    }
    return _bgView2;
}
//生命值
- (UILabel *)heartLab {
    if (!_heartLab) {
        _heartLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH-40, 20)];
        [self.view addSubview:_heartLab];
        _heartLab.textAlignment = NSTextAlignmentLeft;
        _heartLab.text = @"生命值:100";
        _heartLab.font = [UIFont systemFontOfSize:13];
        _heartLab.hidden = YES;
    }
    return _heartLab;
}
- (UILabel *)highestScoreLab {
    if (!_highestScoreLab) {
        _highestScoreLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH-40, 20)];
        [self.view addSubview:_highestScoreLab];
        _highestScoreLab.textAlignment = NSTextAlignmentCenter;
        NSInteger hsc = [GET_SCORE integerValue];
        if (GET_SCORE == NULL) {
            hsc = 0;
        }
        _highestScoreLab.text = [NSString stringWithFormat:@"最高分:%ld",hsc];
        _highestScoreLab.font = [UIFont systemFontOfSize:13];
    }
    return _highestScoreLab;
}
- (UILabel *)scoreLab {
    if (!_scoreLab) {
        _scoreLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH-40, 20)];
        [self.view addSubview:_scoreLab];
        _scoreLab.textAlignment = NSTextAlignmentRight;
        _scoreLab.text = @"得分:0";
        _scoreLab.font = [UIFont systemFontOfSize:13];
    }
    return _scoreLab;
}
- (UILabel *)superpowersLab {
    if (!_superpowersLab) {
        _superpowersLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 20+30, SCREEN_WIDTH-40, 20)];
        [self.view addSubview:_superpowersLab];
        _superpowersLab.textAlignment = NSTextAlignmentLeft;
        _superpowersLab.text = @"大招次数:3";
        _superpowersLab.font = [UIFont systemFontOfSize:13];
        _superpowersLab.hidden = YES;
    }
    return _superpowersLab;
}
- (UILabel *)levelLab {
    if (!_levelLab) {
        _levelLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 20+30, SCREEN_WIDTH-40, 20)];
        [self.view addSubview:_levelLab];
        _levelLab.textAlignment = NSTextAlignmentRight;
        _levelLab.text = @"当前关卡:1";
        _levelLab.font = [UIFont systemFontOfSize:13];
        _levelLab.hidden = YES;
    }
    return _levelLab;
}

- (UILabel *)gameOverLab {
    if (!_gameOverLab) {
        _gameOverLab = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-105, SCREEN_HEIGHT/2-60, 220, 80)];
        [self.view addSubview:_gameOverLab];
        _gameOverLab.text = @"GAME OVER!";
        _gameOverLab.textAlignment = NSTextAlignmentCenter;
        _gameOverLab.font = [UIFont systemFontOfSize:30];
        _gameOverLab.hidden = YES;
    }
    return _gameOverLab;
}

- (UIButton *)startBtn {
    if (!_startBtn) {
        _startBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-70, SCREEN_HEIGHT/2+30, 140, 50)];
        [self.view addSubview:_startBtn];
        [_startBtn setTitle:@"开始游戏" forState:UIControlStateNormal];
        _startBtn.titleLabel.font = [UIFont systemFontOfSize:22];
        [_startBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        _startBtn.layer.borderWidth = 0.5;
        _startBtn.layer.borderColor = [UIColor darkGrayColor].CGColor;
        _startBtn.layer.cornerRadius = 5;
        _startBtn.clipsToBounds = YES;
        [_startBtn addTarget:self action:@selector(startGameAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startBtn;
}

- (CustomBtn *)strategyOrPauseBtn {
    if (!_strategyOrPauseBtn) {
        _strategyOrPauseBtn = [[CustomBtn alloc] initWithFrame:CGRectMake(10, SCREEN_HEIGHT-60, 50, 50)];
        [self.view addSubview:_strategyOrPauseBtn];
        [_strategyOrPauseBtn setTitle:@"玩法" forState:UIControlStateNormal];
        [_strategyOrPauseBtn addTarget:self action:@selector(strategyOrPauseAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _strategyOrPauseBtn;
}

- (CustomBtn *)superpowersBtn {
    if (!_superpowersBtn) {
        _superpowersBtn = [[CustomBtn alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60, SCREEN_HEIGHT-60, 50, 50)];
        [self.view addSubview:_superpowersBtn];
        [_superpowersBtn setTitle:@"大招" forState:UIControlStateNormal];
        [_superpowersBtn addTarget:self action:@selector(superpowersAction) forControlEvents:UIControlEventTouchUpInside];
        _superpowersBtn.hidden = YES;
    }
    return _superpowersBtn;
}

- (MyPlaneView *)myPlane {
    if (!_myPlane) {
        _myPlane = [[MyPlaneView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-30, SCREEN_HEIGHT-100, 60, 60)];
        [self.view addSubview:_myPlane];
        _myPlane.hidden = YES;
    }
    return _myPlane;
}
#pragma mark == 初始化数组
- (NSMutableArray *)enemyPlaneArr {
    if (!_enemyPlaneArr) {
        _enemyPlaneArr = [NSMutableArray arrayWithCapacity:0];
    }
    return _enemyPlaneArr;
}
- (NSMutableArray *)bulletArr {
    if (!_bulletArr) {
        _bulletArr = [NSMutableArray arrayWithCapacity:0];
    }
    return _bulletArr;
}
- (NSMutableArray *)enemyPlaneExplodeArr {
    if (!_enemyPlaneExplodeArr) {
        _enemyPlaneExplodeArr = [NSMutableArray arrayWithCapacity:0];
    }
    return _enemyPlaneExplodeArr;
}
#pragma mark == 初始化定时器
- (NSTimer *)findEnemyPlaneTimer {
    if (!_findEnemyPlaneTimer) {
        _findEnemyPlaneTimer = [NSTimer timerWithTimeInterval:_interval target:self selector:@selector(findEnemyPlaneAction) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_findEnemyPlaneTimer forMode:NSDefaultRunLoopMode];
    }
    return _findEnemyPlaneTimer;
}
- (NSTimer *)findBulletTimer {
    if (!_findBulletTimer) {
        _findBulletTimer = [NSTimer timerWithTimeInterval:0.15 target:self selector:@selector(findBulletAction) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_findBulletTimer forMode:NSDefaultRunLoopMode];
    }
    return _findEnemyPlaneTimer;
}
- (NSTimer *)moveViewTimer {
    if (!_moveViewTimer) {
        _moveViewTimer = [NSTimer timerWithTimeInterval:0.001 target:self selector:@selector(moveViewAction) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_moveViewTimer forMode:NSDefaultRunLoopMode];
    }
    return _moveViewTimer;
}
#pragma mark == 创建敌机和子弹
- (void)createEnemyPlaneAndBullet {
    for (int i = 0; i < 20; i++) {
        /*敌机*/
        EnemyPlaneView *enemyPlane = [[EnemyPlaneView alloc] init];
        [self.view addSubview:enemyPlane];
        enemyPlane.tag = 100;
        [_enemyPlaneArr addObject:enemyPlane];
        /*子弹*/
        BulletView *bullet = [[BulletView alloc] initWithFrame:CGRectZero];
        [self.view addSubview:bullet];
        bullet.tag = 100;
        [_bulletArr addObject:bullet];
    }
    /*敌机爆炸图片数组*/
    for (int i = 0; i < 5; i++) {
        UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"bz%d",i+1]];
        [_enemyPlaneExplodeArr addObject:image];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _interval = 1.0;
    _level = 1;
    [self bgView1];
    [self bgView2];
    [self enemyPlaneArr];
    [self bulletArr];
    [self enemyPlaneExplodeArr];
    [self heartLab];
    [self highestScoreLab];
    [self scoreLab];
    [self superpowersLab];
    [self levelLab];
    [self strategyOrPauseBtn];
    [self superpowersBtn];
    [self myPlane];
    [self createEnemyPlaneAndBullet];
    [self gameOverLab];
    [self startBtn];
}

- (void)startGameAction {
    _gameOverLab.hidden = YES;
    _startBtn.hidden = YES;
    _heartLab.hidden = NO;
    _superpowersLab.hidden = NO;
    _levelLab.hidden = NO;
    _superpowersBtn.hidden = NO;
    _myPlane.hidden = NO;
    _strategyOrPauseBtn.isStart = YES;
    [_strategyOrPauseBtn setTitle:@"暂停" forState:UIControlStateNormal];
    _heartLab.text = @"生命值:100";
    _scoreLab.text = @"得分:0";
    _superpowersLab.text = @"大招次数:3";
    _levelLab.text = @"当前关卡:1";
    
    [self findEnemyPlaneTimer];
    [self findBulletTimer];
    [self moveViewTimer];
}

- (void)strategyOrPauseAction {
    if (_strategyOrPauseBtn.isStart) {
        if (_strategyOrPauseBtn.isPause) {
            [_strategyOrPauseBtn setTitle:@"暂停" forState:UIControlStateNormal];
            [self continueAction];
        } else {
            [_strategyOrPauseBtn setTitle:@"继续" forState:UIControlStateNormal];
            [self pauseAction];
        }
        _strategyOrPauseBtn.isPause = !_strategyOrPauseBtn.isPause;
    } else {
        self.strategyView = [[StrategyView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    }
}

- (void)superpowersAction {
    if (_myPlane.superpowers > 0) {
        _myPlane.superpowers -= 1;
        _superpowersLab.text = [NSString stringWithFormat:@"大招次数:%ld", _myPlane.superpowers];
    } else {
        _superpowersBtn.enabled = NO;
        return;
    }
    for (EnemyPlaneView *enemyPlane in _enemyPlaneArr) {
        if (enemyPlane.tag == 200) {
            if (enemyPlane.planeSize == 0) {
                _myPlane.score += 50;
                [self enemyPlaneExplode:enemyPlane];
            } else if (enemyPlane.planeSize == 1) {
                _myPlane.score += 100;
                [self enemyPlaneExplode:enemyPlane];
            } else {
                _myPlane.score += 200;
                [self enemyPlaneExplode:enemyPlane];
            }
            NSInteger hsc = [GET_SCORE integerValue];
            if (hsc < _myPlane.score) {
                NSString *s = [NSString stringWithFormat:@"%ld",_myPlane.score];
                SET_SCORE(s);
            }
            _highestScoreLab.text = [NSString stringWithFormat:@"最高分:%@",GET_SCORE];
            _scoreLab.text = [NSString stringWithFormat:@"得分:%ld",_myPlane.score];
        }
    }
}
#pragma mark == 定时器方法
- (void)findEnemyPlaneAction {
    for (EnemyPlaneView *enemyPlane in _enemyPlaneArr) {
        if (enemyPlane.tag == 100) {
            NSInteger randomNum = arc4random()%100;
            if (randomNum<80) {
                enemyPlane.planeSize = 0;
            } else if (randomNum>=80 && randomNum<=95) {
                enemyPlane.planeSize = 1;
            } else {
                enemyPlane.planeSize = 2;
            }
            NSInteger originX;
            if (enemyPlane.planeSize == 0) {
                enemyPlane.bounds = CGRectMake(0, 0, 40, 40);
                enemyPlane.layer.cornerRadius = 15;
                originX = arc4random()%(NSInteger)(SCREEN_WIDTH-40)+20;
                enemyPlane.speedCoefficient = 1.0;
            } else if (enemyPlane.planeSize == 1) {
                enemyPlane.bounds = CGRectMake(0, 0, 80, 80);
                enemyPlane.layer.cornerRadius = 30;
                originX = arc4random()%(NSInteger)(SCREEN_WIDTH-60)+30;
                enemyPlane.speedCoefficient = 0.5;
            } else {
                enemyPlane.bounds = CGRectMake(0, 0, 160, 160);
                enemyPlane.layer.cornerRadius = 60;
                originX = arc4random()%(NSInteger)(SCREEN_WIDTH-100)+50;
                enemyPlane.speedCoefficient = 0.25;
            }
            enemyPlane.center = CGPointMake(originX, -enemyPlane.frame.size.height/2);
            enemyPlane.tag = 200;
            break;
        }
    }
}
- (void)findBulletAction {
    for (BulletView *bullet in _bulletArr) {
        if (bullet.tag == 100) {
            bullet.bounds = CGRectMake(0, 0, 6, 8);
            bullet.center = CGPointMake(_myPlane.center.x, _myPlane.center.y-26);
            bullet.tag = 200;
            break;
        }
    }
}
- (void)moveViewAction {
    /*移动背景*/
    CGRect frame1 = _bgView1.frame;
    CGRect frame2 = _bgView2.frame;
    _bgView1.frame = CGRectMake(frame1.origin.x, frame1.origin.y+0.02, frame1.size.width, frame1.size.height);
    _bgView2.frame = CGRectMake(frame2.origin.x, frame2.origin.y+0.02, frame2.size.width, frame2.size.height);
    if (_bgView1.frame.origin.y>=SCREEN_HEIGHT) {
        _bgView1.frame = [[UIScreen mainScreen] bounds];
        _bgView2.frame = CGRectMake(0, -SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);
    }
    /*移动敌机*/
    for (EnemyPlaneView *enemyPlane in _enemyPlaneArr) {
        if (enemyPlane.tag == 200) {
            CGPoint point = enemyPlane.center;
            enemyPlane.center = CGPointMake(point.x, point.y+(0.05*enemyPlane.speedCoefficient*_level));
            if (enemyPlane.frame.origin.y >= SCREEN_HEIGHT) {
                enemyPlane.frame = CGRectZero;
                enemyPlane.tag = 100;
            }
        }
    }
    /*移动子弹*/
    for (BulletView *bullet in _bulletArr) {
        if (bullet.tag == 200) {
            bullet.center = CGPointMake(bullet.center.x, bullet.center.y-1);
            if (bullet.center.y <= -4) {
                bullet.frame = CGRectZero;
                bullet.tag = 100;
            }
        }
    }
    /*关卡 30s一关*/
    _levelFalg ++;
    if (_levelFalg%30000 == 0) {
        _levelFalg = 0;
        _level += 1;
        _interval -= 0.1;
        if (_interval <= 0.1) {
            _interval -= 0.01;
            if (_interval <= 0.05) {
                _interval = 0.05;
            }
        }
        [_findEnemyPlaneTimer invalidate];
        _findEnemyPlaneTimer = nil;
        [self findEnemyPlaneTimer];
        _myPlane.superpowers += 1;
        _superpowersBtn.enabled = YES;
        _superpowersLab.text = [NSString stringWithFormat:@"大招次数:%ld", _myPlane.superpowers];
        _levelLab.text = [NSString stringWithFormat:@"当前关卡:%ld", _level];
    }
    [self judgeCrash];
}
#pragma mark == 判断碰撞
- (void)judgeCrash {
    for (EnemyPlaneView *enemyPlane in _enemyPlaneArr) {
        for (BulletView *bullet in _bulletArr) {
            if (enemyPlane.tag == bullet.tag) {
                if (CGRectContainsPoint(enemyPlane.frame, bullet.center)) {
                    bullet.frame = CGRectZero;
                    bullet.tag = 200;
                    enemyPlane.shootCount+=1;
                    if (enemyPlane.planeSize == 0) {
                        _myPlane.score += 50;
                        [self enemyPlaneExplode:enemyPlane];
                    } else if (enemyPlane.planeSize == 1) {
                        if (enemyPlane.shootCount == 5) {
                            _myPlane.score += 100;
                            [self enemyPlaneExplode:enemyPlane];
                        }
                    } else {
                        if (enemyPlane.shootCount == 15) {
                            _myPlane.score += 200;
                            [self enemyPlaneExplode:enemyPlane];
                        }
                    }
                    NSInteger hsc = [GET_SCORE integerValue];
                    if (hsc < _myPlane.score) {
                        NSString *s = [NSString stringWithFormat:@"%ld",_myPlane.score];
                        SET_SCORE(s);
                    }
                    _highestScoreLab.text = [NSString stringWithFormat:@"最高分:%@",GET_SCORE];
                    _scoreLab.text = [NSString stringWithFormat:@"得分:%ld",_myPlane.score];
                    return;
                }
            }
        }
        if (CGRectIntersectsRect(_myPlane.frame, enemyPlane.frame)) {
            if (enemyPlane.planeSize == 0) {
                _myPlane.heartCount -= 10;
                _myPlane.score += 50;
            } else if (enemyPlane.planeSize == 1) {
                _myPlane.heartCount -= 20;
                _myPlane.score += 100;
            } else {
                _myPlane.heartCount -= 50;
                _myPlane.score += 200;
            }
            if (_myPlane.heartCount <= 0) {
                _myPlane.heartCount = 0;
                [self performSelector:@selector(gameOver) withObject:nil afterDelay:0.8];
            }
            NSInteger hsc = [GET_SCORE integerValue];
            if (hsc < _myPlane.score) {
                NSString *s = [NSString stringWithFormat:@"%ld",_myPlane.score];
                SET_SCORE(s);
            }
            _highestScoreLab.text = [NSString stringWithFormat:@"最高分:%@",GET_SCORE];
            _scoreLab.text = [NSString stringWithFormat:@"得分:%ld",_myPlane.score];
            _heartLab.text = [NSString stringWithFormat:@"生命值:%ld", _myPlane.heartCount];
            [self enemyPlaneExplode:enemyPlane];
            return;
        }
    }
}

- (void)enemyPlaneExplode:(EnemyPlaneView *)enemyPlane {
    UIImageView * explodeView =[[UIImageView alloc] initWithFrame:enemyPlane.frame];
    [self.view addSubview:explodeView];
    explodeView.alpha = 0.8;
    explodeView.animationDuration = 0.8;
    explodeView.animationImages = _enemyPlaneExplodeArr;
    explodeView.animationRepeatCount = 1;
    [explodeView startAnimating];
    enemyPlane.frame = CGRectZero;
    enemyPlane.tag = 100;
    enemyPlane.shootCount = 0;
    [self performSelector:@selector(removeExplodeView:) withObject:explodeView afterDelay:0.8];
}

- (void)removeExplodeView:(UIImageView *)explodeView {
    [explodeView removeFromSuperview];
}

- (void)gameOver {
    _interval = 1.0;
    _myPlane.heartCount = 100;
    _myPlane.score = 0;
    _myPlane.superpowers = 3;
    _level = 1;
    _superpowersBtn.enabled = YES;
    _strategyOrPauseBtn.isStart = NO;
    [_strategyOrPauseBtn setTitle:@"玩法" forState:UIControlStateNormal];
    _gameOverLab.hidden = NO;
    _startBtn.hidden = NO;
    _superpowersBtn.hidden = YES;
    _myPlane.hidden = YES;
    [_findEnemyPlaneTimer invalidate];
    [_findBulletTimer invalidate];
    [_moveViewTimer invalidate];
    _findEnemyPlaneTimer = nil;
    _findBulletTimer = nil;
    _moveViewTimer = nil;
    [self resetUI];
}

- (void)resetUI {
    _myPlane.frame = CGRectMake(SCREEN_WIDTH/2-30, SCREEN_HEIGHT-100, 60, 60);
    [_startBtn setTitle:@"重新开始" forState:UIControlStateNormal];
    for (EnemyPlaneView *enemyPlane in _enemyPlaneArr) {
        enemyPlane.tag = 100;
        enemyPlane.shootCount = 0;
        enemyPlane.frame = CGRectZero;
    }
    for (BulletView *bullet in _bulletArr) {
        bullet.tag = 100;
        bullet.frame = CGRectZero;
    }
}

#pragma mark == 暂停、开启定时器
-(void)pauseAction{
    [_findEnemyPlaneTimer setFireDate:[NSDate distantFuture]];
    [_findBulletTimer setFireDate:[NSDate distantFuture]];
    [_moveViewTimer setFireDate:[NSDate distantFuture]];
}
-(void)continueAction{
    [_findEnemyPlaneTimer setFireDate:[NSDate distantPast]];
    [_findBulletTimer setFireDate:[NSDate distantPast]];
    [_moveViewTimer setFireDate:[NSDate distantPast]];
}

#pragma mark == 移动飞机
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (_strategyOrPauseBtn.isStart && !_strategyOrPauseBtn.isPause) {
        UITouch * touch  = [touches anyObject];
        //通过touch对象返回一个点
        _lastPiont = [touch locationInView:self.view];
    }
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (_strategyOrPauseBtn.isStart && !_strategyOrPauseBtn.isPause) {
        UITouch * touch = [touches anyObject];
        CGPoint  currentPoint = [touch locationInView:self.view];
        //位移量
        float x = currentPoint.x - _lastPiont.x;
        float y = currentPoint.y - _lastPiont.y;
        //判断上一个点是否在飞机上
        if (CGRectContainsPoint(_myPlane.frame, _lastPiont)) {
            _myPlane.center = CGPointMake(_myPlane.center.x + x, _myPlane.center.y + y);
            //更新上一个点
            _lastPiont = currentPoint;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
