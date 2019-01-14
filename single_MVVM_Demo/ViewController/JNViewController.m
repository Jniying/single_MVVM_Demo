//
//  JNViewController.m
//  single_MVVM_Demo
//
//  Created by Jniying on 2019/1/12.
//  Copyright © 2019 jniying. All rights reserved.
//

#import "JNViewController.h"
#import "JNViewModel.h"
#import "JNTableViewCell.h"
@interface JNViewController ()<UITableViewDelegate,UITableViewDataSource,JNViewModelUpdateUIDelegate>
@property (nonatomic, strong) UITableView *tableView;/**<*/
@property (nonatomic, strong) UIButton *refreshBtn;/**<加载数据*/
@property (nonatomic, strong) JNViewModel *viewModel;/**<*/
@end

@implementation JNViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [[JNViewModel alloc] init];
    self.viewModel.updateUIDelegate = self;
    [self setupSubViews];
    [self updateUI];
}

#pragma mark --setup subViews
- (void)setupSubViews{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    self.refreshBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
    [self.refreshBtn setTitle:@"加载数据" forState:UIControlStateNormal];
    [self.refreshBtn setTitle:@"加载中..." forState:UIControlStateDisabled];
    [self.refreshBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.refreshBtn setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    self.refreshBtn.center = self.view.center;
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.refreshBtn];
    
    [self.refreshBtn addTarget:self.viewModel action:@selector(refreshBtnAction) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark --UITableViewDelegate,UITableViewDataSource
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *cellId = @"cellid";
    JNTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[JNTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    [cell sutupData:self.viewModel.datas[indexPath.row]];
    return cell;

}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.datas.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.viewModel didSelectAction:indexPath.row];
}


#pragma mark --JNViewModelUpdateUIDelegate
//更新ui
- (void)updateUI {
    self.tableView.hidden = self.viewModel.tableViewHidden;
    self.refreshBtn.hidden = self.viewModel.refreshBtnHidden;
    self.refreshBtn.enabled = self.viewModel.refreshBtnEnabled;
    
    if (!self.tableView.hidden) {
        [self.tableView reloadData];
    }
}
//ui业务处理
- (void)didSelectAction:(id)object {
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:object message:@"详细的说明" preferredStyle:UIAlertControllerStyleAlert];
    [alertVc addAction:[UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alertVc animated:YES completion:nil];
}
@end
