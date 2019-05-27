//
//  JNTableDataSource.h
//  single_MVVM_Demo
//
//  Created by apple on 2019/5/27.
//  Copyright © 2019 jniying. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface JNTableDataSource : NSObject <UITableViewDataSource>

- (instancetype)initWithCellIdentifier:(NSString *)identifier configure:(void(^)(id cell,id model,NSIndexPath *indexPath))configure;
@property (nonatomic, strong) NSArray *datas;
@end

NS_ASSUME_NONNULL_END
