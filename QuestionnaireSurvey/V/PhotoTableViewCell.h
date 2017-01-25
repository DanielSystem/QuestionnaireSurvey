//
//  PhotoTableViewCell.h
//  QuestionnaireSurvey
//
//  Created by 吴伟祥 on 16/12/19.
//  Copyright © 2016年 WWX. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DidClickEvenBlock)();

@interface PhotoTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIButton *button;
@property(nonatomic,copy)DidClickEvenBlock didClickEventBlock;


@end
