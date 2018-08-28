//
//  AnimationVC.m
//  MasonryDemo
//
//  Created by chen on 2018/7/30.
//  Copyright © 2018年 Gorpeln. All rights reserved.
//

#import "AnimationVC.h"

@interface AnimationVC ()

@end

@implementation AnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"animation";
    
    [self loadBaseUI];
    
}

-(void)loadBaseUI{
    UIButton *moveBtn = [[UIButton alloc]init];
    [self.view addSubview:moveBtn];
    [moveBtn setTitle:@"移动" forState:UIControlStateNormal];
    [moveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    moveBtn.backgroundColor = RGBCOLOR(0, 175, 75);
    [moveBtn addTarget:self action:@selector(moveBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [moveBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(10.0);
        make.left.equalTo(10.0);
        make.size.equalTo(CGSizeMake(80.0, 80.0));
    }];
    
    
    UIButton *scaleBtn =[[UIButton alloc]init];
    [self.view addSubview:scaleBtn];
    [scaleBtn setTitle:@"缩放" forState:UIControlStateNormal];
    [scaleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    scaleBtn.backgroundColor = RGBCOLOR(55, 75, 75);
    [scaleBtn addTarget:self action:@selector(scaleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [scaleBtn makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.equalTo(CGSizeMake(80.0, 80.0));
    }];

}
#pragma mark - 响应
- (void)moveBtnClick:(UIButton *)sender{
    
    [self.view bringSubviewToFront:sender];
    
    CGFloat originTop = (arc4random() % ((int)self.view.frame.size.height));
    if (originTop < 10){
        originTop = 10;
    }else if (originTop > (self.view.frame.size.height - sender.frame.size.height)){
        originTop = (self.view.frame.size.height - sender.frame.size.height);
    }
    CGFloat originLeft = (arc4random() % ((int)self.view.frame.size.width));
    if (originLeft < 10)    {
        originLeft = 10;
    } else if (originLeft > (self.view.frame.size.width - sender.frame.size.width)){
        originLeft = (self.view.frame.size.width - sender.frame.size.width);
    }

//    修改更新某一个约束 updateConstraints
//    [sender updateConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(originTop);
//        make.left.equalTo(originLeft);
//    }];
//    或，移除之前的所有约束，重新设置约束  remakeConstraints
    [sender remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(originTop);
        make.left.equalTo(originLeft);
        make.size.equalTo(CGSizeMake(80.0, 80.0));
    }];

    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}

BOOL isScaleBig = YES;
- (void)scaleBtnClick:(UIButton *)button{
    
    CGSize size = button.frame.size;
    if (size.height >= 160.0){
        isScaleBig = NO;
        [button setTitle:@"缩小" forState:UIControlStateNormal];
    }else if (size.height <= 80.0){
        isScaleBig = YES;
        [button setTitle:@"放大" forState:UIControlStateNormal];
    }
    if (isScaleBig){
        size = CGSizeMake(button.frame.size.width * 1.2, button.frame.size.height * 1.2);
    }else{
        size = CGSizeMake(button.frame.size.width / 1.2, button.frame.size.height / 1.2);
    }
//    仅修改更新某一个约束
//    [button updateConstraints:^(MASConstraintMaker *make) {
//        make.size.equalTo(size);
//    }];
//    或，清除之前的所有约束，重新设置约束
    [button remakeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.equalTo(size);
    }];
    
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}


@end
