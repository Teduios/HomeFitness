//
//  HYJStartExerciseViewController.m
//  lianlian
//
//  Created by 黄老爷Simon on 16/4/27.
//  Copyright © 2016年 mis. All rights reserved.
//

#import "HYJStartExerciseViewController.h"

@interface HYJStartExerciseViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *actionImageView;
@property (nonatomic, strong) NSArray *image;
@property (nonatomic, strong) NSArray *titleArr;
@property (nonatomic, strong) NSString *lastDateString;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) NSTimer *Timer;
@property (nonatomic, assign) NSInteger seconds;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation HYJStartExerciseViewController

- (NSArray *)image {
    if (!_image) {
        _image = @[@"pulati01",@"pulati02",@"pulati03",@"pulati04",@"pulati05",@"pulati06",@"pulati07",@"pulati08"];
    }
    return _image;
}

- (NSArray *)titleArr {
    if (!_titleArr) {
        _titleArr = @[@"平板支撑",@"单肘平板支撑  目标：20秒",@"单脚平板支撑  目标：20秒",@"跪姿平板支撑  目标：1分钟",@"跪姿单脚平板支撑  目标：45秒",@"手撑超人平板支撑  目标：20秒",@"手撑位单脚平板支撑  目标：30秒",@"单手撑平板支撑  目标：30秒"];
    }
    return _titleArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)nextAction:(UIButton *)sender {
    [self removeTime];
    self.seconds = 0;
    self.timeLabel.text = [NSString stringWithFormat:@"%02ld:%02ld",self.seconds / 60,self.seconds % 60];
    sender.tag ++;
    self.actionImageView.image = [UIImage imageNamed:self.image[sender.tag]];
    self.titleLabel.text = self.titleArr[sender.tag];
    if (sender.tag == 7) {
        sender.tag = -1;
    }
    
}

- (IBAction)startBtn:(UIButton *)sender {
    [self removeTime];
    self.Timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(addTime) userInfo:nil repeats:YES];
    
}

- (void)addTime {
    self.seconds++;
    self.timeLabel.text = [NSString stringWithFormat:@"%02ld:%02ld",self.seconds / 60,self.seconds % 60];
}

- (void)removeTime {
    [self.Timer invalidate];
    self.Timer = nil;
}

- (IBAction)stopBtnClick:(id)sender {
    [self removeTime];
    self.lastDateString = [self readFromPreferences];
    NSInteger day = [self.currentDay integerValue];
    if (self.lastDateString == nil) {
        day++;
        self.currentDay = [NSString stringWithFormat:@"%ld",day];
        self.block(self.currentDay);
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSString *str = [dateFormatter stringFromDate:[NSDate date]];
        self.lastDateString = str;
        [self saveToPreferencesWithDate:self.lastDateString];
    }else {
        NSCalendar *gregorian = [[NSCalendar alloc]
                                 initWithCalendarIdentifier:NSGregorianCalendar];
        [gregorian setFirstWeekday:2];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSString *str = [dateFormatter stringFromDate:[NSDate date]];
        NSDate *fromDate;
        NSDate *toDate;
        [gregorian rangeOfUnit:NSDayCalendarUnit startDate:&fromDate interval:NULL forDate:[dateFormatter dateFromString:self.lastDateString]];
        [gregorian rangeOfUnit:NSDayCalendarUnit startDate:&toDate interval:NULL forDate:[NSDate date]];
        NSDateComponents *dayComponents = [gregorian components:NSDayCalendarUnit fromDate:fromDate toDate:toDate options:0];
        // dayComponents.day  即为间隔的天数
        NSLog(@"%ld",dayComponents.day);
        self.lastDateString = str;
        [self saveToPreferencesWithDate:self.lastDateString];
        if (dayComponents.day >= 1) {
            day++;
            self.currentDay = [NSString stringWithFormat:@"%ld",day];
            self.block(self.currentDay);
        }else {
            return;
        }
    }
}

- (void)saveToPreferencesWithDate:(NSString *)date {
    // 1.获取偏好设置对象
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    // 2.保存数据
    [userDefaults setObject:date forKey:@"lastDate"];
}

- (NSString *)readFromPreferences {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    // 读取偏好设置
    NSString *date = [userDefaults objectForKey:@"lastDate"];
    return date;
}

- (IBAction)backBtnClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)endBtnClick:(id)sender {
    [self stopBtnClick:sender];
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
