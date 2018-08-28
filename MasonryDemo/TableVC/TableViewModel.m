//
//  TableViewModel.m
//  MasonryDemo
//
//  Created by chen on 2018/7/30.
//  Copyright © 2018年 Gorpeln. All rights reserved.
//

#import "TableViewModel.h"
#import "TableViewCell.h"

#define fixedHeight (MARGIN*2+30+25+MARGIN)  //除动态变化的contentlabel外的其他控件高度
#define fixedHeightWithoutMoreBtn (MARGIN*3+30)

extern CGFloat maxContentLabelHeight;

@implementation TableViewModel


- (void)encodeFromDic:(NSDictionary *)dic{
    
    self.icon = EncodeFormDic(dic, @"icon");
    self.name = EncodeFormDic(dic, @"name");
    self.content = EncodeFormDic(dic, @"content");
    
}

- (NSString *)content {
    if ([self cellHeight] - fixedHeightWithoutMoreBtn > maxContentLabelHeight) {
        _isShowMoreBtn = YES;
    } else {
        _isShowMoreBtn = NO;
    }
    return _content;
}

- (void)setIsOpening:(BOOL)isOpening{
    if (!_isShowMoreBtn) {
        _isOpening = NO;
    } else {
        _isOpening = isOpening;
    }
}

//计算高度
- (CGFloat)cellHeight{
    if (!_cellHeight){
        _cellHeight = [self heightWithContent:_content];
    }
    if (_isOpening) {
        return _cellHeight + fixedHeight;
    }else{
        if (_cellHeight > maxContentLabelHeight) {
            return maxContentLabelHeight + fixedHeight;
        }else{
            return _cellHeight + fixedHeightWithoutMoreBtn;
        }
    }
}

- (CGFloat)heightWithContent:(NSString *)content{
    CGFloat  contentHeight= [[self class] heightTextWithText:content];
    return contentHeight;
}

+ (CGFloat)heightTextWithText:(NSString *)text{
    // 计算高度 设置内容显示宽度
    CGSize size = [text boundingRectWithSize:CGSizeMake((BOUNDS_WIDTH - 3 * MARGIN - 50), MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:@"Heiti SC" size:15.0f]} context:nil].size;
    CGFloat heightText = size.height;
    
    return heightText;
}


@end
