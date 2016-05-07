//
//  HYJHealthInfoViewModel.h
//  lianlian
//
//  Created by 黄老爷Simon on 16/4/26.
//  Copyright © 2016年 mis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetManager.h"

@interface HYJHealthInfoViewModel : NSObject

@property (nonatomic) NSInteger rowNumber;

- (NSInteger)IDForIndex:(NSInteger)index;
- (NSString *)titileForIndex:(NSInteger)index;
- (NSURL *)imageForIndex:(NSInteger)index;
- (NSString *)collectNumberForIndex:(NSInteger)index;
- (NSString *)readNumberFonIndex:(NSInteger)index;

@property (nonatomic, strong) NSMutableArray<HYJAllInfoResultModel *> *dataList;

- (void)getHealthInfoWithClassify:(NSInteger)classify ID:(NSInteger)idNumber completionHandler:(void(^)(NSError *error))completionHandler;

@end
