//
//  HYJDetailMessageModel.m
//  lianlian
//
//  Created by 黄老爷Simon on 16/4/27.
//  Copyright © 2016年 mis. All rights reserved.
//

#import "HYJDetailMessageModel.h"

@implementation HYJDetailMessageModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"result" : [HYJDetailMessageResultModel class]};
}

@end
@implementation HYJDetailMessageResultModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"ID" : @"id",
             @"description2" : @"description"};
}

@end


