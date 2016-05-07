//
//  NetManager.m
//  lianlian
//
//  Created by 黄老爷Simon on 16/4/26.
//  Copyright © 2016年 mis. All rights reserved.
//

#import "NetManager.h"

@implementation NetManager

+(void)getDealsWithClassify:(NSInteger)classify ID:(NSInteger)idNumebr completionHandler:(void (^)(HYJAllInfoModel *, NSError *))completionHandler {
    NSDictionary *pa = @{@"key" : APPKey,
                         @"classify" : @(2),
                         @"page" : @(1),
                         @"row" : @(20),
                         @"id" : @(idNumebr)};
    [self GET:baseUrl parameters:pa progress:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandler([HYJAllInfoModel modelWithJSON:responseObj], error);
    }];
}

+ (void)getDetailMessageWithId:(NSInteger)idNumber completionHandler:(void (^)(HYJDetailMessageModel *, NSError *))completionHandler {
    NSDictionary *pa = @{@"key" : APPKey,
                         @"id" : @(idNumber)};
    [self GET:@"http://api.avatardata.cn/Lore/Show" parameters:pa progress:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandler([HYJDetailMessageModel modelWithJSON:responseObj], error);
    }];
}

@end
