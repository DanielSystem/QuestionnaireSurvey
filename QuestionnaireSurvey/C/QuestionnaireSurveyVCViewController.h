//
//  QuestionnaireSurveyVCViewController.h
//  QuestionnaireSurvey
//
//  Created by 吴伟祥 on 16/12/17.
//  Copyright © 2016年 WWX. All rights reserved.
//

#import "ViewController.h"
#import "QuestionModel.h"

typedef void(^callBack)(QuestionModel *model);

@interface QuestionnaireSurveyVCViewController : ViewController
@property(nonatomic,strong)QuestionModel *model;

@property(nonatomic,copy)callBack callBlock;

@end
