//
//  HYJWordModel.h
//  lianlian
//
//  Created by 黄老爷Simon on 16/4/29.
//  Copyright © 2016年 mis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYJWordModel : NSObject

@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *content;
+ (NSMutableArray *)dataArray;

@end
