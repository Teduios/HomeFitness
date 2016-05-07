//
//  HYJWordDetailViewController.m
//  lianlian
//
//  Created by 黄老爷Simon on 16/5/3.
//  Copyright © 2016年 mis. All rights reserved.
//

#import "HYJWordDetailViewController.h"
#import "HYJWordModel.h"
#import "HYJDetailWordTableViewCell.h"

@interface HYJWordDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightForBottom;
@property (weak, nonatomic) IBOutlet UITextField *textMessage;

@end

@implementation HYJWordDetailViewController

- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [HYJWordModel dataArray];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openKeyboard:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeKeyboard:) name:UIKeyboardWillHideNotification object:nil];
}

/** 键盘打开 */
- (void) openKeyboard:(NSNotification *)notification{
    
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSTimeInterval duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    UIViewAnimationOptions options = [notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    
    self.heightForBottom.constant = keyboardFrame.size.height;
    
    [UIView animateWithDuration:duration
                          delay:0
                        options:options
                     animations:^{
                         [self.view layoutIfNeeded];
                         //[self scrollTabel];
                     }
                     completion:^(BOOL finished) {
                         
                     }];
}
/** 键盘关闭 */
- (void) closeKeyboard:(NSNotification *)notification{
    NSTimeInterval duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    UIViewAnimationOptions options = [notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    
    self.heightForBottom.constant = 0;
    
    [UIView animateWithDuration:duration
                          delay:0
                        options:options
                     animations:^{
                         [self.view layoutIfNeeded];
                     }
                     completion:^(BOOL finished) {
                         
                     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HYJDetailWordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dataCell" forIndexPath:indexPath];
    HYJWordModel *model = self.dataArr[indexPath.row];
    [cell.headImageView setImage:[UIImage imageNamed:model.imageName]];
    cell.nameLabel.text = model.name;
    cell.contentLabel.text = model.content;
    return cell;
}

- (IBAction)backBtnClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.view endEditing:YES];
}
- (IBAction)EditEnd:(UITextField *)sender {
    NSString *newContent = self.textMessage.text;
    if (newContent.length == 0) {
        return;
    }
    
    HYJWordModel *model = [[HYJWordModel alloc]init];
    model.content = newContent;
    model.imageName = @"ic_empty_coloringpage";
    model.name = @"sy_jessica";
    [self.dataArr addObject:model];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.dataArr.count - 1 inSection:0];
    
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (IBAction)sendBtnClick:(UIButton *)sender {
    [self EditEnd:self.textMessage];
    [self.textMessage endEditing:YES];
}

@end
