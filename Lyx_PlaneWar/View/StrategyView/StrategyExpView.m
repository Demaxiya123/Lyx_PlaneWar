//
//  StrategyExpView.m
//  Lyx_PlaneWar
//
//  Created by liaoyongxing on 2017/5/22.
//  Copyright © 2017年 Lyx. All rights reserved.
//

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

#import "StrategyExpView.h"

@implementation StrategyExpView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    /*绘制图片*/
    NSString* imagePath = [[NSBundle mainBundle] pathForResource:@"bg_picture" ofType:@"png"];
    UIImage* myImageObj = [[UIImage alloc] initWithContentsOfFile:imagePath];
    [myImageObj drawInRect:self.bounds];
    
    NSString *s = @"游戏玩法";
    [s drawAtPoint:CGPointMake(10, 10) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:26]}];
    
    /*2.绘制文本*/
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    CGContextSetRGBFillColor (context, 0.5, 0.5, 0.5, 0.5);
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor yellowColor],NSStrokeColorAttributeName:[UIColor orangeColor],NSStrokeWidthAttributeName:@7};
    [@"1.拖动飞机在屏幕内移动，消灭屏幕内的敌机，敌机有三种型号，小型，中型，大型\n2.消灭小型飞机需击中1次(50分)，中型飞机需击中5次(100分)，大型飞机需击中15次(200分)\n3.随着游戏进行，关卡会随着增加，敌机飞行速度越快\n4.游戏开局可使用3次大招，使用大招清除屏幕内所有敌机，每过一关可获得一次大招\n5.游戏开局有100生命值，与敌机撞击会减少生命值，分别为(10、20、50)，生命值为0游戏结束" drawInRect:CGRectMake(10, 40, SCREEN_WIDTH-20, SCREEN_HEIGHT/2-40) withAttributes:dic];
}

@end
