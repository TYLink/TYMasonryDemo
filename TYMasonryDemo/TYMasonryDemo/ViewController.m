//
//  ViewController.m
//  TYMasonryDemo
//
//  Created by TianYang on 16/3/18.
//  Copyright © 2016年 Tianyang. All rights reserved.
//

#import "ViewController.h"
#import "FirstSubViewController.h"
#import "SecondSubViewController.h"
#import "ThirdSubViewController.h"
#import "FourthSubViewController.h"



@interface ViewController ()
{
    NSMutableArray * _TYMutArray;
    UIView         * _SuperView;

}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _SuperView = [self view];
    self.navigationItem.title = @"Masonry";
    self.view.backgroundColor = [UIColor whiteColor];
    [self initMutArray];
    [self addBotton];
    
    
    
}

-(void) initMutArray{

    _TYMutArray = [[NSMutableArray alloc] init];
    for (int i=1; i<5; i++) {
        [_TYMutArray addObject:[NSString stringWithFormat:@"点击跳转到第%d个页面",i]];
    }

}

-(void) addBotton{

    for (int k =0 ; k< [_TYMutArray count]; k++) {
        
        UIButton * _TYBtn = ({
            _TYBtn = [[UIButton alloc] init];
            [_TYBtn setTitle:[_TYMutArray objectAtIndex:k] forState:UIControlStateNormal];
            [_TYBtn setBackgroundColor:[UIColor redColor]];
            [_TYBtn setTag:(1318 + k)];
            [_TYBtn addTarget:self action:@selector(JempToSubVC:) forControlEvents:UIControlEventTouchUpInside];
            [SettingLabel SetBtnText:_TYBtn andTextSize:17.0 andColor:[UIColor blackColor] and:NO];
            [_SuperView addSubview:_TYBtn];
            [_TYBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX    . equalTo (_SuperView.mas_centerX);//   设置Btn 的 X 轴与父视图的X轴对齐
                make.width      . equalTo (@(SCREEN_WIDTH/2));     //   设置Btn 的宽度为屏幕宽度的一半
                make.top        . equalTo (_SuperView.mas_top).offset(114+(100*k));// 设置Btn 的上边缘与父视图的上边缘之间的距离
                make.height     . equalTo (@(50));               //   设置Btn 的高度为50
            }];
            _TYBtn;
        });
    }
}


# pragma  _ Mark    按键点击事件
-(void)JempToSubVC:(UIButton*)sendr{
    
    switch (sendr.tag - 1318) {
        case 0:{
            FirstSubViewController * FirstVC = [[FirstSubViewController alloc] init];
            [self.navigationController pushViewController:FirstVC animated:YES];
        }
            break;
        case 1:{
            SecondSubViewController * SecondVC = [[SecondSubViewController alloc] init];
            [self.navigationController pushViewController:SecondVC animated:YES];
        }
            break;
        case 2:{
            ThirdSubViewController * ThirdVC = [[ThirdSubViewController alloc] init];
            [self.navigationController pushViewController:ThirdVC animated:YES];
        }
            break;
        case 3:{
            FourthSubViewController * FourthVC = [[FourthSubViewController alloc] init];
            [self.navigationController pushViewController:FourthVC animated:YES];
        }
            break;
            
        default:
            break;
    }
    

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
