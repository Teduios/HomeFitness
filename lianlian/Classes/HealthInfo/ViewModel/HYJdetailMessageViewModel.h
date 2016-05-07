//
//  HYJdetailMessageViewModel.h
//  lianlian
//
//  Created by 黄老爷Simon on 16/4/27.
//  Copyright © 2016年 mis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetManager.h"

@interface HYJdetailMessageViewModel : NSObject


- (NSString *)messageLabel;
- (NSURL *)image;

@property (nonatomic, strong) NSMutableArray<HYJDetailMessageResultModel *> *dataList;

- (void)getMessageWithID:(NSInteger)inNumber completionHandler:(void(^)(NSError *error))completionHandler;

@end
