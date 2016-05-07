//
//  HYJHealthInfoViewModel.m
//  lianlian
//
//  Created by 黄老爷Simon on 16/4/26.
//  Copyright © 2016年 mis. All rights reserved.
//

#import "HYJHealthInfoViewModel.h"

@implementation HYJHealthInfoViewModel

- (NSInteger)rowNumber {
    return self.dataList.count;
}

- (NSString *)titileForIndex:(NSInteger)index {
    return self.dataList[index].title;
}

- (NSInteger)IDForIndex:(NSInteger)index {
    return self.dataList[index].ID;
}

- (NSURL *)imageForIndex:(NSInteger)index {
    return [NSURL URLWithString:self.dataList[index].img];
}

- (NSString *)collectNumberForIndex:(NSInteger)index {
    return [NSString stringWithFormat:@"%ld",self.dataList[index].fcount];
}

- (NSString *)readNumberFonIndex:(NSInteger)index {
    return [NSString stringWithFormat:@"%ld",self.dataList[index].count];
}

- (NSMutableArray<HYJAllInfoResultModel *> *)dataList {
    if (!_dataList) {
        _dataList = [NSMutableArray new];
    }
    return _dataList;
}

- (void)getHealthInfoWithClassify:(NSInteger)classify ID:(NSInteger)idNumber completionHandler:(void (^)(NSError *))completionHandler {
    [NetManager getDealsWithClassify:classify ID:idNumber completionHandler:^(HYJAllInfoModel *model, NSError *error) {
        if (!error) {
            [self.dataList removeAllObjects];
            [self.dataList addObjectsFromArray:model.result];
        }
        completionHandler(error);
    }];
}

@end
