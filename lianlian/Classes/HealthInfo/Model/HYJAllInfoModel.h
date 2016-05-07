//
//  HYJAllInfoModel.h
//  lianlian
//
//  Created by 黄老爷Simon on 16/4/26.
//  Copyright © 2016年 mis. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HYJAllInfoResultModel;
@interface HYJAllInfoModel : NSObject


@property (nonatomic, strong) NSArray<HYJAllInfoResultModel *> *result;

@property (nonatomic, copy) NSString *reason;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger error_code;


@end
@interface HYJAllInfoResultModel : NSObject

@property (nonatomic, assign) NSInteger fcount;

@property (nonatomic, copy) NSString *img;

@property (nonatomic, assign) long long time;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *keywords;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, copy) NSString *description1;

@property (nonatomic, assign) NSInteger loreclass;

@end

