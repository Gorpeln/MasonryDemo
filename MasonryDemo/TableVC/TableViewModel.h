//
//  TableViewModel.h
//  MasonryDemo
//
//  Created by chen on 2018/7/30.
//  Copyright © 2018年 Gorpeln. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableViewModel : NSObject

@property (nonatomic, assign) CGFloat cellHeight;

@property (nonatomic, copy) NSString            *icon;              // 头像
@property (nonatomic, copy) NSString            *name;              // 昵称
@property (nonatomic, copy) NSString            *content;           // 内容
@property (nonatomic, copy) NSString            *pictureArrayStr;   // 图片

@property (nonatomic, assign) BOOL              isOpening;
@property (nonatomic, assign, readonly) BOOL    isShowMoreBtn;

- (void)encodeFromDic:(NSDictionary *)dic;


@end
