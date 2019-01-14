//
//  JNViewModel.m
//  single_MVVM_Demo
//
//  Created by Jniying on 2019/1/12.
//  Copyright © 2019 jniying. All rights reserved.
//

#import "JNViewModel.h"
#import "JNModel.h"
@implementation JNViewModel


- (instancetype)init{
    self = [super init];
    if (self) {
        _refreshBtnHidden = NO;
        _tableViewHidden = YES;
        _refreshBtnEnabled = YES;
        _datas = [NSMutableArray new];
    }
    return self;
}

- (void)refreshBtnAction {
    self.refreshBtnEnabled = NO;
    if ([self.updateUIDelegate respondsToSelector:@selector(updateUI)]){
        [self.updateUIDelegate updateUI];
    }
    
    //模拟请求
    [[NSOperationQueue new] addOperationWithBlock:^{
        sleep(3);
        [self.datas removeAllObjects];
        for (int i = 0; i<30; i++) {
            JNModel *model = [[JNModel alloc] init];
            model.name = [NSString stringWithFormat:@"test%d",i];
            model.idNumber = [NSString stringWithFormat:@"atTest%d",i];
            [self.datas addObject:model];
        }

        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.refreshBtnEnabled = YES;
            self.refreshBtnHidden = YES;
            self.tableViewHidden = NO;
            if ([self.updateUIDelegate respondsToSelector:@selector(updateUI)]){
                [self.updateUIDelegate updateUI];
            }
        }];
    }];
}


- (void)didSelectAction:(NSInteger)row {
    JNModel *model = self.datas[row];
    if ([self.updateUIDelegate respondsToSelector:@selector(didSelectAction:)]){
        [self.updateUIDelegate didSelectAction:model.name];
    }
}
@end
