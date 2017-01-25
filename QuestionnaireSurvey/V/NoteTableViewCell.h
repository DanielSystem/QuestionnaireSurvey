//
//  NoteTableViewCell.h
//  QuestionnaireSurvey
//
//  Created by 吴伟祥 on 16/12/19.
//  Copyright © 2016年 WWX. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DidEditingBlock)(NSString *content);

@interface NoteTableViewCell : UITableViewCell<UITextFieldDelegate>
@property(nonatomic,copy)DidEditingBlock didEditingBlock;
@property (strong, nonatomic) IBOutlet UITextField *texeView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@end
