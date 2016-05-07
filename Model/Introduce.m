//
//  Introduce.m
//  lianlian
//
//  Created by mis on 16/3/26.
//  Copyright © 2016年 mis. All rights reserved.
//

#import "Introduce.h"

@implementation Introduce
+(NSArray *)demoData{
    Introduce *in1 = [[Introduce alloc]init];
    in1.title = @"高抬腿跑";
    in1.introduceText = @"保持上身挺直的情况下，两腿交替抬至水平，频率越快，效果越好";
    Introduce *in2 = [[Introduce alloc]init];
    in2.title = @"旋肩运动";
    in2.introduceText = @"保证两肩头交替向后旋转，旋转时全身要尽可能做到放松。";
    return @[in1,in2];
}

@end
