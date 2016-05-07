//
//  HYJdetailMessageViewModel.m
//  lianlian
//
//  Created by 黄老爷Simon on 16/4/27.
//  Copyright © 2016年 mis. All rights reserved.
//

#import "HYJdetailMessageViewModel.h"

@implementation HYJdetailMessageViewModel

- (NSString *)messageLabel {
    return self.dataList[0].message;
}

-(NSURL *)image {
    return [NSURL URLWithString:self.dataList[0].img];
}


- (NSMutableArray<HYJDetailMessageResultModel *> *)dataList {
    if (!_dataList) {
        _dataList = [NSMutableArray new];
    }
    return _dataList;
}

- (void)getMessageWithID:(NSInteger)inNumber completionHandler:(void (^)(NSError *))completionHandler {
    [NetManager getDetailMessageWithId:inNumber completionHandler:^(HYJDetailMessageModel *model, NSError *error) {
        if (!error) {
            [self.dataList removeAllObjects];
            [self.dataList addObject:model.result];
        }
        completionHandler(error);
    }];
}

@end
