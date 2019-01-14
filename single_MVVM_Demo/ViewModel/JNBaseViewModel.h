//
//  JNBaseViewModel.h
//  single_MVVM_Demo
//
//  Created by Jniying on 2019/1/14.
//  Copyright © 2019 jniying. All rights reserved.
//

#import <Foundation/Foundation.h>



NS_ASSUME_NONNULL_BEGIN

@protocol JNViewModelUpdateUIDelegate <NSObject>
//更新UI的代理
- (void)updateUI;
//响应代理
- (void)didSelectAction:(id)object;
@end


@interface JNBaseViewModel : NSObject
@property (nonatomic, weak) id <JNViewModelUpdateUIDelegate> updateUIDelegate;/**<更新UI的代理*/
@end

NS_ASSUME_NONNULL_END
