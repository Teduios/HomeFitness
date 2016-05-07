//
//  HYJHealthInfoViewController.m
//  lianlian
//
//  Created by 黄老爷Simon on 16/4/26.
//  Copyright © 2016年 mis. All rights reserved.
//

#import "HYJHealthInfoViewController.h"
#import "HYJHealthInfoViewModel.h"
#import "HYJInfoViewCell.h"
#import "UIImageView+WebCache.h"
#import "CricleScrollViewController.h"
#import "HYJDetailViewController.h"
#import "HYJdetailMessageViewModel.h"

@interface HYJHealthInfoViewController ()

@property (nonatomic, strong) HYJHealthInfoViewModel *infoVM;

@property (weak, nonatomic) IBOutlet UIView *headView;

@end

#define idNumber 66

@implementation HYJHealthInfoViewController

- (HYJHealthInfoViewModel *)infoVM {
    if (!_infoVM) {
        _infoVM = [HYJHealthInfoViewModel new];
    }
    return _infoVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.infoVM getHealthInfoWithClassify:2 ID:idNumber completionHandler:^(NSError *error) {
        [self.tableView reloadData];
    }];
    [self setScrollVeiw];
}

- (void)setScrollVeiw {
    /**
     *  初始化轮播图片数组
     */
    UIImageView *imageView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lianlian"]];
    imageView0.frame = CGRectMake(0, 0, self.view.bounds.size.width, 200);
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lianlian01"]];
    imageView1.frame = CGRectMake(0, 0, self.view.bounds.size.width, 200);
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lianlian02"]];
    imageView2.frame = CGRectMake(0, 0, self.view.bounds.size.width, 200);
    
    NSArray *imageArray = [NSArray arrayWithObjects:imageView0, imageView1, imageView2, nil];
    
    /**
     *  初始化轮播ScrollerView
     */
    CricleScrollViewController *cricleScrollerView = [[CricleScrollViewController alloc] initWithFrame:CGRectMake(0.0, 0.0, self.headView.bounds.size.width, self.headView.bounds.size.height) andImagesArray:imageArray];
    [self.headView addSubview:cricleScrollerView.view];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.infoVM.rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HYJInfoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSInteger row = indexPath.row;
    cell.titleLabel.text = [self.infoVM titileForIndex:row];
    [cell.headImage sd_setImageWithURL:[self.infoVM imageForIndex:row]  placeholderImage:[UIImage imageNamed:@"ic_empty_coloringpage"]];
    cell.collectNumber.text = [self.infoVM collectNumberForIndex:row];
    cell.readNumber.text = [self.infoVM readNumberFonIndex:row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"gotoDetail" sender:indexPath];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(NSIndexPath *)sender {
    UIViewController *vc = segue.destinationViewController;
    if ([vc isKindOfClass:[HYJDetailViewController class]]) {
        HYJDetailViewController *detailVc = (HYJDetailViewController *)vc;
        detailVc.IDNumber = [self.infoVM IDForIndex:sender.row];
    }
}


@end
