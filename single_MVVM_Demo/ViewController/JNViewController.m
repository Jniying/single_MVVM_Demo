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

@interface JNViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;/**<*/
@property (nonatomic, strong) UIButton *refreshBtn;
@property (nonatomic, strong) JNViewModel *viewModel;/**<*/
@end

@implementation JNViewController

- (void)viewDidLoad {
    [super viewDidLoad];

 
    [self setupSubViews];
    [self bindModel];
    
}

- (void)bindModel {
    __weak typeof(self) weekSelf = self;
    self.viewModel = [[JNViewModel alloc] initWithSucc:^(id  _Nonnull datas) {
        weekSelf.refreshBtn.hidden = YES;
        [self.tableView reloadData];
    } fail:^{
        
    }];
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
    
    [self.refreshBtn addTarget:self action:@selector(refreshBtnAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)refreshBtnAction{
    self.refreshBtn.enabled = NO;
    [self.viewModel refreshAction];
}

#pragma mark --UITableViewDelegate,UITableViewDataSource
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *cellId = @"cellid";
    JNTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[JNTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    JNModel *model = self.viewModel.datas[indexPath.row];
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = model.idNumber;
    return cell;

}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.datas.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    JNModel *model = self.viewModel.datas[indexPath.row];
    self.viewModel.selectName = model.name;
}

@end
