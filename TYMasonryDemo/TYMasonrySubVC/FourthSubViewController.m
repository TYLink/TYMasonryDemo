//
//  FourthSubViewController.m
//  TYMasonryDemo
//
//  Created by TianYang on 16/3/18.
//  Copyright © 2016年 Tianyang. All rights reserved.
//

#import "FourthSubViewController.h"

@interface FourthSubViewController ()
{
    UIImageView * _HeaderImageView;
    UILabel     * _DetaileLabel;


}

@end

@implementation FourthSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"FourthVC";

    [self addBgview];
    
}

-(void) addBgview{
    _HeaderImageView = ({
        _HeaderImageView = [[UIImageView alloc] init];
        [self.view addSubview:_HeaderImageView];
        _HeaderImageView.image = [UIImage imageNamed:@"GFFYZ"];
        _HeaderImageView.layer.cornerRadius = 35;
        _HeaderImageView.layer.masksToBounds = YES;
        [_HeaderImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top    . equalTo (self.view).offset (64+20);
            make.centerX. equalTo (self.view.mas_centerX);
            make.width  . equalTo (@(70));
            make.height . equalTo (@(70));
        }];
        _HeaderImageView;
    });

    _DetaileLabel = ({
        _DetaileLabel = [[UILabel alloc] init];
        [self.view addSubview:_DetaileLabel];
        _DetaileLabel.text = @"\t这段文字你就当成是我在瞎BB就得了。看不看是无所谓的。其实Masonry的使用还是很简单的，当然我在这里只是简单的列举了几种常见的使用方式。在以后的开发过程中还需要根据自己的需要去慢慢学习新的东西。我自己感觉这里列举的这几种方法还是可以满足日常的学习简单的使用。希望这些小的demo能给各位小伙伴们带来一定的帮助。还希望这个demo能个给位朋友带来一定的帮助";
        [SettingLabel setLabel:_DetaileLabel andSize:17.0 andColor:[UIColor lightGrayColor] andIsBold:NO];
        _DetaileLabel.numberOfLines = 0;
        [_DetaileLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top   . equalTo (_HeaderImageView.mas_bottom).offset(20);
            make.left  . equalTo (self.view.mas_left).offset(10);
            make.width . equalTo (@(SCREEN_WIDTH-20));
            make.height. equalTo (@(300));
        }];
        _DetaileLabel;
    });
    
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
