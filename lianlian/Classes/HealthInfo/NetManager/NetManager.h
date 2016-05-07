//
//  NetManager.h
//  lianlian
//
//  Created by 黄老爷Simon on 16/4/26.
//  Copyright © 2016年 mis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HYJAllInfoModel.h"
#import "HYJDetailMessageModel.h"

@interface NetManager : NSObject

+ (void)getDealsWithClassify:(NSInteger)classify ID:(NSInteger)idNumebr completionHandler:(void(^)(HYJAllInfoModel *model, NSError *error))completionHandler;

+ (void)getDetailMessageWithId:(NSInteger)idNumber completionHandler:(void(^)(HYJDetailMessageModel *model, NSError *error))completionHandler;

@end
