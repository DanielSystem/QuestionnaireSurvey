//
//  QuestionModel.h
//  QuestionnaireSurvey
//
//  Created by 吴伟祥 on 16/12/17.
//  Copyright © 2016年 WWX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionModel : NSObject
@property(nonatomic,strong)NSNumber *id;
@property(nonatomic,strong)NSString *sex;
@property(nonatomic,strong)NSString *age;
@property(nonatomic,strong)NSString *like;
@property(nonatomic,strong)NSString *habits;//习惯
@property(nonatomic,strong)NSString *OnlineOffline;
@property(nonatomic,strong)NSString *activity;
@property(nonatomic,strong)NSString *social;
@property(nonatomic,strong)NSString *brand;//品牌
@property(nonatomic,strong)NSString *share;//品牌

@property(nonatomic,strong)NSString *occupation;//职业
@property(nonatomic,strong)NSString *single;
@property(nonatomic,strong)NSData *photo;

@end
