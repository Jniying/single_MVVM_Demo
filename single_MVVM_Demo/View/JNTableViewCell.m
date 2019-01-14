//
//  JNTableViewCell.m
//  single_MVVM_Demo
//
//  Created by Jniying on 2019/1/14.
//  Copyright © 2019 jniying. All rights reserved.
//

#import "JNTableViewCell.h"
#import "JNModel.h"

@implementation JNTableViewCell


- (void)sutupData:(JNModel *)data {
    self.textLabel.text = data.name;
    self.detailTextLabel.text = data.idNumber;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
