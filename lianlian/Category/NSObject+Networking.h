//
//  NSObject+Networking.h
//  lianlian
//
//  Created by 黄老爷Simon on 16/4/26.
//  Copyright © 2016年 mis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface NSObject (Networking)

+ (id)GET:(NSString *)path parameters:(NSDictionary *)parameters progress:(void(^)(NSProgress * downloadProgress))downloadProgress completionHandler:(void(^)(id responseObj, NSError *error))completionHandler;

@end
