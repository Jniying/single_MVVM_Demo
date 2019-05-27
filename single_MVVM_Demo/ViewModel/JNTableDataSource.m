//
//  JNTableDataSource.m
//  single_MVVM_Demo
//
//  Created by apple on 2019/5/27.
//  Copyright © 2019 jniying. All rights reserved.
//

#import "JNTableDataSource.h"
#import "JNTableViewCell.h"
#import "JNModel.h"
@interface JNTableDataSource ()
@property (nonatomic,copy) void (^configure) (id cell,id model, NSIndexPath *indexPath);
@property (nonatomic,copy) NSString *identifier;
@end

@implementation JNTableDataSource


- (instancetype)initWithCellIdentifier:(NSString *)identifier configure:(void (^)(id _Nonnull, id _Nonnull, NSIndexPath * _Nonnull))configure  {
    self = [super init];
    if (self) {
        _identifier = identifier;
        _configure = configure;
    }
    return self;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    JNTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.identifier];
    if (cell == nil) {
        cell = [[JNTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:self.identifier];
    }
    
    if (self.configure) {
        self.configure(cell, self.datas[indexPath.row], indexPath);
    }
    return cell;
    
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}

@end
