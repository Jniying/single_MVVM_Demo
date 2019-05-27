//
//  JNViewModel.h
//  single_MVVM_Demo
//
//  Created by Jniying on 2019/1/12.
//  Copyright © 2019 jniying. All rights reserved.
//

#import "JNBaseViewModel.h"
#import "JNModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JNViewModel : JNBaseViewModel


@property (nonatomic, copy) NSString *selectName; /**<被选中的的*/
@property (nonatomic, strong) NSMutableArray *datas;/**<数据*/
- (void)refreshAction;
@end

NS_ASSUME_NONNULL_END
