//
//  HYJAllInfoModel.m
//  lianlian
//
//  Created by 黄老爷Simon on 16/4/26.
//  Copyright © 2016年 mis. All rights reserved.
//

#import "HYJAllInfoModel.h"

@implementation HYJAllInfoModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"result" : [HYJAllInfoResultModel class]};
}

@end
@implementation HYJAllInfoResultModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"ID" : @"id",
             @"description1" : @"description"};
}
@end



