//
//  NoteTableViewCell.m
//  QuestionnaireSurvey
//
//  Created by 吴伟祥 on 16/12/19.
//  Copyright © 2016年 WWX. All rights reserved.
//

#import "NoteTableViewCell.h"

@implementation NoteTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.texeView.delegate =self;
    
    // Initialization code
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (_didEditingBlock) {
        _didEditingBlock(textField.text);
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
