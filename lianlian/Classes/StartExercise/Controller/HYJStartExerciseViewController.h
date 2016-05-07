//
//  HYJStartExerciseViewController.h
//  lianlian
//
//  Created by 黄老爷Simon on 16/4/27.
//  Copyright © 2016年 mis. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^BLOCK)(NSString*);
#import "ViewController.h"

@interface HYJStartExerciseViewController : UIViewController
@property (nonatomic, copy) BLOCK block;
@property (nonatomic, copy) NSString *currentDay;

@end
