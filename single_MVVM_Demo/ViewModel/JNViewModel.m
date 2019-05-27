//
//  JNViewModel.m
//  single_MVVM_Demo
//
//  Created by Jniying on 2019/1/12.
//  Copyright © 2019 jniying. All rights reserved.
//

#import "JNViewModel.h"


@interface JNViewModel ()

@property (nonatomic, copy) succ succ;/**<请求成功*/

@property (nonatomic, copy) fail fail;/**<请求成功*/
@end

@implementation JNViewModel


- (instancetype)initWithSucc:(succ)succ fail:(fail)fail {
    self = [super init];
    if (self) {
        _succ = succ;
        _fail = fail;
        _datas = [NSMutableArray new];
        [self addObserver:self forKeyPath:@"selectName" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;

}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSString *selectName = change[NSKeyValueChangeNewKey];
    @synchronized (self) {
       NSInteger index = [self.datas indexOfObjectPassingTest:^BOOL(JNModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
           return [obj.name isEqualToString:selectName];
        }];
        [self.datas removeObjectAtIndex:index];
    }
    if (self.succ) {
        self.succ(self.datas);
    }
}
- (void)dealloc {
    [self removeObserver:self forKeyPath:@"selectName" context:nil];
}

- (void)refreshAction {
    //模拟请求
    [[NSOperationQueue new] addOperationWithBlock:^{
        @synchronized (self) {
            [self.datas removeAllObjects];
            for (int i = 0; i<30; i++) {
                JNModel *model = [[JNModel alloc] init];
                model.name = [NSString stringWithFormat:@"test%d",i];
                model.idNumber = [NSString stringWithFormat:@"atTest%d",i];
                [self.datas addObject:model];
            }
        }
        sleep(2.0);
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            if (self.succ) {
                self.succ(self.datas);
            }
        }];
    }];
}


@end
