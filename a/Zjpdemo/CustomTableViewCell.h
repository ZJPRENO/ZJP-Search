//
//  CustomTableViewCell.h
//  Zjpdemo
//
//  Created by 张俊平 on 16/3/18.
//  Copyright © 2016年 ZHANGJUNPING. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
@interface CustomTableViewCell : UITableViewCell

@property (nonatomic,strong)UIImageView *imageV;//显示图片；
@property (nonatomic,strong)UILabel *titleLabel;//标题
@property (nonatomic,strong)UILabel *detailLab;//具体内容；


- (void)loadDataWithModel:(Model *)model;


@end
