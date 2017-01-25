//
//  DetailTableViewCell.m
//  QuestionnaireSurvey
//
//  Created by 吴伟祥 on 16/12/19.
//  Copyright © 2016年 WWX. All rights reserved.
//

#import "DetailTableViewCell.h"

@implementation DetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
//    self.image.contentMode =UIViewContentModeCenter;
    self.image.layer.cornerRadius =25;
    self.image.layer.masksToBounds = YES;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
