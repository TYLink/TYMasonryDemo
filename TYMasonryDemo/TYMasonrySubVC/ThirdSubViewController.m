//
//  ThirdSubViewController.m
//  TYMasonryDemo
//
//  Created by TianYang on 16/3/18.
//  Copyright © 2016年 Tianyang. All rights reserved.
//

#import "ThirdSubViewController.h"

@interface ThirdSubViewController ()
{
    UIButton * _FirstBtn;
    UIButton * _SecondBtn;
    
    UIView   * _BgView;
    UIView   * _SubView;
    
    UIView   * _SuperView;
    BOOL     _isExpanded;

}

@end

@implementation ThirdSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"简单动画";
    _SuperView = self.view;
    _isExpanded = YES;
    [self addBtn];
    [self addSubView];

}

-(void)addBtn{
    _FirstBtn = ({
        _FirstBtn = [[UIButton alloc] init];
        [_FirstBtn setTitle:@"动画" forState:UIControlStateNormal];
        [SettingLabel SetBtnText:_FirstBtn andTextSize:14.0 andColor:[UIColor blueColor] and:NO];
        [_FirstBtn setBackgroundColor:[UIColor lightGrayColor]];
        [_FirstBtn addTarget:self action:@selector(Oneanimation) forControlEvents:UIControlEventTouchUpInside];
        [_SuperView addSubview:_FirstBtn];
        [_FirstBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top     . equalTo (_SuperView.mas_top).offset (64+40);
            make.centerX . equalTo (_SuperView.mas_centerX);
            make.width   . equalTo (@(100));
            make.height  . equalTo (@(40));
        }];
        _FirstBtn;
    });
}

-(void) addSubView{
    
    _BgView = ({
        _BgView = [[UIView alloc] init];
        _BgView.backgroundColor = [UIColor redColor];
        [_SuperView addSubview:_BgView];
        _BgView;
    });

    _SubView = ({
        _SubView = [[UIView alloc] init];
        _SubView.backgroundColor = [UIColor blueColor];
        [_BgView addSubview:_SubView];
        _SubView;
    });
    [self updateWithExpand:NO animated:NO];

}

-(void) Oneanimation{
    [self updateWithExpand:!_isExpanded animated:YES ];

}


- (void)updateWithExpand:(BOOL)isExpanded animated:(BOOL)animated{
    
    _isExpanded = isExpanded;
    [_BgView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.left . equalTo (_SuperView.mas_left);
        make.top  . equalTo (_SuperView.mas_top).offset(200);
        make.right.mas_equalTo(0);
        if (isExpanded) {
                make.bottom.mas_equalTo(-20);
        } else {
            make.bottom.mas_equalTo(-300);
        }
    }];
    
    [_SubView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(_BgView);
        // 这里使用优先级处理
        // 设置其最大值为250，最小值为90
        if (!isExpanded) {
            make.width.height.mas_equalTo(100 * 0.5).priorityLow();
        } else {
            make.width.height.mas_equalTo(100 * 3).priorityLow();
        }
        // 最大值为250
        make.width.height.lessThanOrEqualTo(@250);
        // 最小值为90
        make.width.height.greaterThanOrEqualTo(@90);
    }];
    
    if (animated) {
        [self.view setNeedsUpdateConstraints];
        [self.view updateConstraintsIfNeeded];
        
        [UIView animateWithDuration:0.5 animations:^{
            [self.view layoutIfNeeded];
        }];
    }
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
