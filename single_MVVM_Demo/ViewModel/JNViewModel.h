//
//  JNViewModel.h
//  single_MVVM_Demo
//
//  Created by Jniying on 2019/1/12.
//  Copyright © 2019 jniying. All rights reserved.
//

#import "JNBaseViewModel.h"



NS_ASSUME_NONNULL_BEGIN

@interface JNViewModel : JNBaseViewModel

@property (nonatomic, assign) BOOL refreshBtnEnabled;/**<更新按钮是否可以点击 默认为Yes*/
@property (nonatomic, assign) BOOL refreshBtnHidden;/**<更新按钮是否显示 默认为NO*/
@property (nonatomic, assign) BOOL tableViewHidden;/**<列表是否展示 默认为YES*/
@property (nonatomic, strong) NSMutableArray *datas;/**<数据*/

//点击按钮加载数据
- (void)refreshBtnAction;

- (void)didSelectAction:(NSInteger)row;
@end

NS_ASSUME_NONNULL_END
