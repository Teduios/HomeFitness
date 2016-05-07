//
//  HYJDetailMessageModel.h
//  lianlian
//
//  Created by 黄老爷Simon on 16/4/27.
//  Copyright © 2016年 mis. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HYJDetailMessageResultModel;
@interface HYJDetailMessageModel : NSObject


@property (nonatomic, strong) HYJDetailMessageResultModel *result;

@property (nonatomic, assign) NSInteger error_code;

@property (nonatomic, copy) NSString *reason;


@end
@interface HYJDetailMessageResultModel : NSObject

@property (nonatomic, assign) NSInteger fcount;

@property (nonatomic, copy) NSString *img;

@property (nonatomic, assign) long long time;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *keywords;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, copy) NSString *description2;

@property (nonatomic, assign) NSInteger loreclass;

@end

