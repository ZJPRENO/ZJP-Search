//
//  CustomTableViewCell.m
//  Zjpdemo
//
//  Created by 张俊平 on 16/3/18.
//  Copyright © 2016年 ZHANGJUNPING. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        //进行布局；
        self.imageV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 80, 60)];
        self.imageV.image = [UIImage imageNamed:@"3.jpg"];
        
        [self.contentView addSubview:self.imageV];
        
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 10,260,25)];
        self.titleLabel.text = @"房子";
        
        [self.contentView addSubview:self.titleLabel];
        
        
        self.detailLab = [[UILabel alloc]initWithFrame:CGRectMake(100, 35, 260, 30)];
        self.detailLab.numberOfLines = 0;
        
        self.detailLab.text = @"2457";
        self.detailLab.font = [UIFont systemFontOfSize:12];
        
        [self.contentView addSubview:self.detailLab];
        
    }return self;
}

- (void)loadDataWithModel:(Model *)model
{
    
    self.imageV.image = [UIImage imageNamed:model.imageName];
    self.titleLabel.text = model.title;
    self.detailLab.text = model.detail;
    
}


- (void)awakeFromNib {
	[super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
