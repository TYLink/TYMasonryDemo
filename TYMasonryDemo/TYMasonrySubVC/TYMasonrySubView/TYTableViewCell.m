//
//  TYTableViewCell.m
//  TYMasonryDemo
//
//  Created by TianYang on 16/3/18.
//  Copyright © 2016年 Tianyang. All rights reserved.
//

#import "TYTableViewCell.h"

@interface TYTableViewCell(){

    UIImageView * _TYHeaderImageV;
    UILabel     * _TitleLabel;
    UILabel     * _DetailLabel;
    
    UIView      * _SuperView;
    
}
@end


@implementation TYTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _SuperView = self.contentView;
        [self initsubview];
    }
    return self;
}

-(void) initsubview{
    _TYHeaderImageV = ({
        _TYHeaderImageV = [[UIImageView alloc] init];
        _TYHeaderImageV.image = [UIImage imageNamed:@"GFFYZ"];
        _TYHeaderImageV.layer.cornerRadius = 25;
        _TYHeaderImageV.layer.masksToBounds = YES;
        [_SuperView addSubview:_TYHeaderImageV];
        [_TYHeaderImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY    . equalTo (_SuperView.mas_centerY);
            make.left       . equalTo (_SuperView.mas_left).offset(10);
            make.width      . equalTo (@(50));
            make.height     . equalTo (@(50));
        }];
        _TYHeaderImageV;
    });

    _TitleLabel = ({
        _TitleLabel = [[UILabel alloc] init];
        _TitleLabel.text = @"Masonry 在自定义的Cell 中的应用";
        [SettingLabel setLabel:_TitleLabel andSize:14.0 andColor:[UIColor blackColor] andIsBold:NO];
        [_SuperView addSubview:_TitleLabel];
        [_TitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left    . equalTo (_TYHeaderImageV.mas_right).offset (10);
            make.top     . equalTo (_TYHeaderImageV.mas_top);
            make.right   . equalTo (_SuperView.mas_right).offset (-10);
            make.height  . equalTo (@(17));
        }];
        _TitleLabel;
    });
    
    _DetailLabel = ({
        _DetailLabel = [[UILabel alloc] init];
        _DetailLabel.text = @"直到iPhone6发布之后 我知道使用autolayout势在必行了 这时想起了以前在浏览Github看到过的一个第三方库Masonry 在花了几个小时的研究使用后 我就将autolayout掌握了(重点是我并没有学习任何的官方文档或者其他的关于autolayout的知识) 这就是我为什么要写下这篇文章来推荐它的原因.";
        [SettingLabel setLabel:_DetailLabel andSize:14.0 andColor:[UIColor blackColor] andIsBold:NO];
        [_SuperView addSubview:_DetailLabel];
        _DetailLabel.numberOfLines = 2;
        [_DetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left    . equalTo (_TYHeaderImageV.mas_right).offset (10);
            make.bottom  . equalTo (_TYHeaderImageV.mas_bottom);
            make.right   . equalTo (_SuperView.mas_right).offset (-10);
            make.top     . equalTo (_TitleLabel.mas_bottom);
        }];
        _DetailLabel;
    });



}






- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
