//
//  TableViewCell.m
//  MasonryDemo
//
//  Created by chen on 2018/7/30.
//  Copyright © 2018年 Gorpeln. All rights reserved.
//

#import "TableViewCell.h"

static CGFloat const iconWidth = 50.0;
CGFloat maxContentLabelHeight = 0; // 根据具体font而定

@interface TableViewCell ()

@property(nonatomic,strong)UIImageView              *iconView; //头像
@property(nonatomic,strong)UILabel                  *nameLable;//昵称
@property(nonatomic,strong)UILabel                  *contentLabel;//内容
@property(nonatomic,strong)UIButton                 *moreButton;//全文按钮

@end


@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)    {
        [self loadBaseUI];
    }
    
    return self;
}

-(void)loadBaseUI{

    _iconView = [UIImageView new];
//    _iconView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_iconView];

    _nameLable = [UILabel new];
    _nameLable.font = [UIFont fontWithName:@"Heiti SC" size:15.0f];
    _nameLable.textColor = [UIColor colorWithRed:(54 / 255.0) green:(71 / 255.0) blue:(121 / 255.0) alpha:0.9];
//    _nameLable.backgroundColor = [UIColor darkGrayColor];
    [self.contentView addSubview:_nameLable];

    _contentLabel = [UILabel new];
    _contentLabel.font = [UIFont fontWithName:@"Heiti SC" size:15.0f];
    _contentLabel.numberOfLines = 0;
//    _contentLabel.backgroundColor = [UIColor cyanColor];
    if (maxContentLabelHeight == 0) {
        maxContentLabelHeight = _contentLabel.font.lineHeight * 3;
    }
    [self.contentView addSubview:_contentLabel];

    _moreButton = [UIButton new];
    [_moreButton setTitle:@"全文" forState:UIControlStateNormal];
    [_moreButton setTitleColor:RGBCOLOR(92, 140, 193) forState:UIControlStateNormal];
    _moreButton.titleLabel.font = [UIFont fontWithName:@"Heiti SC" size:15.0f];
//    _moreButton.backgroundColor = [UIColor blueColor];
    [_moreButton addTarget:self action:@selector(moreBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    _moreButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.contentView addSubview:_moreButton];
    
    
    [_iconView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(MARGIN);
        make.top.equalTo(MARGIN);
        make.size.equalTo(CGSizeMake(iconWidth, iconWidth));
    }];
    
    [_nameLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconView.mas_right).offset(MARGIN);
        make.top.equalTo(MARGIN);
        make.height.equalTo(30);
        make.right.equalTo(-MARGIN);
    }];
    
    [_contentLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLable);
        make.top.equalTo(self.nameLable.mas_bottom).offset(MARGIN/2);
        make.right.equalTo(-MARGIN);
    }];

    [_moreButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentLabel);
        make.top.equalTo(self.contentLabel.mas_bottom).offset(MARGIN/2);
        make.width.equalTo(55);
        make.height.equalTo(25);
    }];
    
}

-(void)setTableViewModel:(TableViewModel *)tableViewModel{
    _tableViewModel = tableViewModel;
    
    [_iconView  sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",_tableViewModel.icon]] placeholderImage:[UIImage imageNamed:@"placeholder_gorpeln.png"]];
    
    
    _nameLable.text = _tableViewModel.name;
    [_nameLable sizeToFit];
    
    _contentLabel.text = _tableViewModel.content;

    if (_tableViewModel.isShowMoreBtn) {
        [_moreButton updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(25);
        }];
        _moreButton.hidden = NO;
        if (_tableViewModel.isOpening) { // 如果需要展开
            [_contentLabel updateConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(self.tableViewModel.cellHeight - (MARGIN*3+30+25));
            }];
            [_moreButton setTitle:@"收起" forState:UIControlStateNormal];
        } else {
            [_contentLabel updateConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(maxContentLabelHeight);
            }];
            [_moreButton setTitle:@"全文" forState:UIControlStateNormal];
        }
    } else {
        [_contentLabel updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(self.tableViewModel.cellHeight - (MARGIN*3+30));
        }];
        [_moreButton updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(0);
        }];
        _moreButton.hidden = YES;
    }

    [self layoutIfNeeded];

}

- (void)moreBtnClicked{
    if (self.moreBtnClickedBlock) {
        self.moreBtnClickedBlock(self.indexPath);
    }
}

@end
