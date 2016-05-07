//
//  NSObject+Networking.m
//  lianlian
//
//  Created by 黄老爷Simon on 16/4/26.
//  Copyright © 2016年 mis. All rights reserved.
//

#import "NSObject+Networking.h"

@implementation NSObject (Networking)

+ (id)GET:(NSString *)path parameters:(NSDictionary *)parameters progress:(void (^)(NSProgress *))downloadProgress completionHandler:(void (^)(id, NSError *))completionHandler {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    return [manager GET:path parameters:parameters progress:downloadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completionHandler(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completionHandler(nil, error);
    }];
}

@end
