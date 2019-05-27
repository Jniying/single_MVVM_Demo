//
//  JNBaseViewModel.h
//  single_MVVM_Demo
//
//  Created by Jniying on 2019/1/14.
//  Copyright © 2019 jniying. All rights reserved.
//

#import <Foundation/Foundation.h>



NS_ASSUME_NONNULL_BEGIN


typedef void(^succ)(id datas);
typedef void(^fail)(void);

@interface JNBaseViewModel : NSObject


- (instancetype)initWithSucc:(succ)succ fail:(fail)fail;

@end

NS_ASSUME_NONNULL_END
