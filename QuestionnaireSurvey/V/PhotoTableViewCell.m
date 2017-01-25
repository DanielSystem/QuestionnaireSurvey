

//
//  PhotoTableViewCell.m
//  QuestionnaireSurvey
//
//  Created by 吴伟祥 on 16/12/19.
//  Copyright © 2016年 WWX. All rights reserved.
//

#import "PhotoTableViewCell.h"

@implementation PhotoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.button.layer.cornerRadius = 25;
    self.button.clipsToBounds = YES;
    [self.button addTarget:self action:@selector(didClickEvent) forControlEvents:UIControlEventTouchUpInside];
    // Initialization code
}

-(void)didClickEvent{
    if (self.didClickEventBlock) {
        self.didClickEventBlock();

    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
