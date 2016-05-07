//
//  exercisePlanTableViewController.m
//  lianlian
//
//  Created by mis on 16/3/25.
//  Copyright © 2016年 mis. All rights reserved.
//

#import "exercisePlanTableViewController.h"
#import "Introduce.h"

@interface exercisePlanTableViewController ()
@property(nonatomic,strong)NSArray *allIntroduces;
@property(nonatomic,copy)NSString *clickintroduce;
@property(nonatomic,copy)NSString *clickTitle;
@property(nonatomic,assign)NSInteger numb;

@end

@implementation exercisePlanTableViewController

-(NSArray *)allIntroduces{
    if (!_allIntroduces) {
        _allIntroduces = [Introduce demoData];
    }
    return _allIntroduces;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)clickReturn:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
