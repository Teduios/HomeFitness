//
//  ViewController.m
//  lianlian
//
//  Created by mis on 16/3/17.
//  Copyright © 2016年 mis. All rights reserved.
//

#import "ViewController.h"
#import "HYJStartExerciseViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *warmView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(nonatomic,strong)NSArray *allEmoticons;
@property (weak, nonatomic) IBOutlet UILabel *keepDays;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadEmotionImage];
    CALayer *layer = self.warmView.layer;
    layer.cornerRadius = 10;
    layer.masksToBounds = YES;
}

-(void)loadEmotionImage{
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"MainAction.plist" ofType:nil];
    NSArray *emoticonArr = [NSArray arrayWithContentsOfFile:filePath];
    self.allEmoticons = emoticonArr;
    //遍历每一个字典
    CGFloat btnW = self.view.bounds.size.width * 0.95 / 3;
    CGFloat btnH = self.view.bounds.size.height * 0.35 - 80;
    for (NSInteger i = 0; i<emoticonArr.count; i++) {
        NSDictionary *emoticonDict = emoticonArr[i];
        NSString *imageName = emoticonDict[@"image"];
        UIButton *emoticonButton = [[UIButton alloc]init];
        [emoticonButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        CGFloat btnX = i * btnW;
        emoticonButton.frame  =CGRectMake(btnX, 0, btnW, btnH);
        UILabel *emoticonLabel = [[UILabel alloc]init];
        emoticonLabel.frame = CGRectMake(btnX, btnH, btnW, 80);
        emoticonLabel.font = [UIFont systemFontOfSize:17];
        emoticonLabel.textAlignment = NSTextAlignmentCenter;
        emoticonLabel.text = emoticonDict[@"name"];
        [self.scrollView addSubview:emoticonButton];
        [self.scrollView addSubview:emoticonLabel];
        
    }
    self.scrollView.contentSize = CGSizeMake(emoticonArr.count * btnW, 0);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ViewController *vc = segue.destinationViewController;
    if ([vc isKindOfClass:[HYJStartExerciseViewController class]]) {
        HYJStartExerciseViewController *exerciseVC = (HYJStartExerciseViewController *)vc;
        exerciseVC.currentDay = self.keepDays.text;
        exerciseVC.block = ^(NSString *text){
            self.keepDays.text = text;
        };
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
