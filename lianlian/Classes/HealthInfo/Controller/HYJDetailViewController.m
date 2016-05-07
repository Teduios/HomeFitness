//
//  HYJDetailViewController.m
//  lianlian
//
//  Created by 黄老爷Simon on 16/4/27.
//  Copyright © 2016年 mis. All rights reserved.
//

#import "HYJDetailViewController.h"
#import "HYJdetailMessageViewModel.h"
#import "UIImageView+WebCache.h"

@interface HYJDetailViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) HYJdetailMessageViewModel *messageVM;
@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation HYJDetailViewController

- (HYJdetailMessageViewModel *)messageVM {
    if (!_messageVM) {
        _messageVM = [HYJdetailMessageViewModel new];
    }
    return _messageVM;
}

- (UILabel *)messageLabel {
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc]init];
        _messageLabel.text = @"测试气温气温气温";
        _messageLabel.numberOfLines = 0;
        _messageLabel.font = [UIFont systemFontOfSize:14];
        _messageLabel.frame = CGRectMake(0, 0, 0, 0);
        _messageLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        
    }
    return _messageLabel;
}

- (UIScrollView *)scrollView {
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.frame = CGRectMake(0, 0, self.view.size.width, self.view.size.height - self.tabBarController.tabBar.height * 2);
        _scrollView.delegate = self;
        
    }
    return _scrollView;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.scrollView.size.width, 200)];
    }
    return _imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.scrollView];
    [self.messageVM getMessageWithID:self.IDNumber completionHandler:^(NSError *error) {
        self.messageLabel.text = [self.messageVM messageLabel];
        [self.imageView sd_setImageWithURL:[self.messageVM image] placeholderImage:[UIImage imageNamed:@"ic_colors_palettes"]];
        CGSize size = CGSizeMake(self.scrollView.bounds.size.width, 9999);
        CGSize expectSize = [self.messageLabel sizeThatFits:size];
        self.messageLabel.frame = CGRectMake(0, self.imageView.bounds.size.height, expectSize.width, expectSize.height);
        _scrollView.contentSize = CGSizeMake(_scrollView.size.width, self.messageLabel.bounds.size.height);
    }];
    CGFloat bottom = CGRectGetMaxY(self.imageView.frame);
    self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, bottom, 0);
    [self.scrollView addSubview:self.imageView];
    [self.scrollView addSubview:self.messageLabel];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backBtnClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
