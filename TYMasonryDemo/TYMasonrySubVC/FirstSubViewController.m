//
//  FirstSubViewController.m
//  TYMasonryDemo
//
//  Created by TianYang on 16/3/18.
//  Copyright © 2016年 Tianyang. All rights reserved.
//

// 基本使用方式    几个View的相对布局   约束为屏幕的比例

#import "FirstSubViewController.h"

@interface FirstSubViewController ()
{
    UIView * _FirstView;
    UIView * _SecondView;
    UIView * _ThirdView;
    UIView * _FourthView;
    UIView * _SuperView;
    
}

@end

@implementation FirstSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _SuperView = [self view];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"简单使用";
    [self addSubView];
}

-(void) addSubView{
    
//    实例化FiestView  并添加到_SuperView   设置约束为 在屏幕的左上角 宽度为屏幕宽度的一半  高度为屏幕高度的1/3
    _FirstView = ({
        _FirstView = [[UIView alloc] init];
        _FirstView.backgroundColor = [UIColor yellowColor];
        [_SuperView addSubview:_FirstView];
        [_FirstView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top    . equalTo (_SuperView.mas_top).offset(64); // 由于导航条没有背景图 所以要设置距离屏幕上边沿距离为导航条高度
            make.left   . equalTo (_SuperView.mas_left);
            make.width  . equalTo (@(SCREEN_WIDTH/2));
            make.height . equalTo (@(SCREEN_HEIGHT/3));
        }];
        _FirstView;
    });
//    实例化SecondView 并添加到 _SuperView  设置约束为 在FirstView 的右边 大小和FirstView 一样
    _SecondView = ({
        _SecondView = [[UIView alloc] init];
        _SecondView.backgroundColor = [UIColor blueColor];
        [_SuperView addSubview:_SecondView];
        [_SecondView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top   . equalTo (_FirstView.mas_top);    // 设置SecondView 的顶部跟FirstView 的顶部对齐
            make.left  . equalTo (_FirstView.mas_right);  // 设置SecondView 的左边缘跟FirstView 的右边缘对齐
            make.width . equalTo (_FirstView.mas_width);
            make.height. equalTo (_FirstView.mas_height);
        }];
        _SecondView;
    });
//    实例化_ThirdView 并添加到_SuperView  设置约束为在FirstView 的下边  宽高都为屏幕的宽度
    _ThirdView = ({
        _ThirdView = [[UIView alloc] init];
        _ThirdView.backgroundColor = [UIColor redColor];
        [_SuperView addSubview:_ThirdView];
        [_ThirdView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top   . equalTo (_FirstView.mas_bottom); // 设置_ThirdView 的顶部和FirstView 的下边缘对齐
            make.left  . equalTo (_SuperView.mas_left);
            make.width . equalTo (@(SCREEN_WIDTH));
            make.height. equalTo (@(SCREEN_WIDTH));
        }];
        _ThirdView;
    });
    
//  实例化 _FourthView 并添加到  _ThirdView 设置约束为在 _ThirdView 的中心 大小为_ThirdView 的1/4
    _FourthView = ({
        _FourthView = [[UIView alloc] init];
        _FourthView.backgroundColor = [UIColor greenColor];
        [_ThirdView addSubview:_FourthView];
        [_FourthView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX    . equalTo (_ThirdView.mas_centerX);
            make.centerY    . equalTo (_ThirdView.mas_centerY);
            make.width      . equalTo (@(SCREEN_WIDTH/2));
            make.height     . equalTo (@(SCREEN_WIDTH/2));
        }];
    
        _FourthView;
    });


}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
