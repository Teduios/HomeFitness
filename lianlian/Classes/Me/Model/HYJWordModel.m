//
//  HYJWordModel.m
//  lianlian
//
//  Created by 黄老爷Simon on 16/4/29.
//  Copyright © 2016年 mis. All rights reserved.
//

#import "HYJWordModel.h"

@implementation HYJWordModel

+ (NSMutableArray *)dataArray {
    HYJWordModel *model1 = [[self alloc]init];
    model1.imageName = @"appicon";
    model1.name = @"Windy";
    model1.content = @"如果你想学业爱情两手抓，我就让你竹篮打水一场空";
    HYJWordModel *model2 = [[self alloc]init];
    model2.imageName = @"scanner";
    model2.name = @"@一个人";
    model2.content = @"关系铁不铁，烧烤走一走";
    HYJWordModel *model3 = [[self alloc]init];
    model3.imageName = @"iTunesArtwork";
    model3.name = @"二牛";
    model3.content = @"路上遇到撞衫的，谁丑谁尴尬";
    NSMutableArray *arr = [NSMutableArray array];
    [arr addObject:model1];
    [arr addObject:model2];
    [arr addObject:model3];
    return arr;
}

@end
