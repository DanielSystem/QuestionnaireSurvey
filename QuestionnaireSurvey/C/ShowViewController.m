//
//  ShowViewController.m
//  QuestionnaireSurvey
//
//  Created by 吴伟祥 on 16/12/19.
//  Copyright © 2016年 WWX. All rights reserved.
//

#import "ShowViewController.h"

@interface ShowViewController ()
@property (strong, nonatomic) IBOutlet UILabel *titeleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *photoImage;
@property (strong, nonatomic) IBOutlet UITextView *contenTextView;


@end


@implementation ShowViewController

- (IBAction)backClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.photoImage.layer.cornerRadius = 10;
    self.photoImage.clipsToBounds = YES;
    QuestionModel *model = self.model;
    if (model) {
        [self.photoImage setImage:[UIImage imageWithData:model.photo]];
        NSMutableString *content = [@"" mutableCopy];
        if (model.like.length) {
            [content appendString:[NSString stringWithFormat:@"平时有什么兴趣爱好吗？\n%@\n\n",model.like]];
        }
        if (model.activity.length) {
            [content appendString:[NSString stringWithFormat:@"有参加什么展会活动吗？比如动漫展、音乐节、明星演唱会、跑步节动漫展、明星演唱会\n%@\n\n",model.activity]];
        }
        
        if (model.habits.length) {
            [content appendString:[NSString stringWithFormat:@"平时购物习惯在那里呢？淘宝、微商、京东等线上？还是线下实体店实体店\n%@\n\n",model.habits]];
        }
        if (model.social.length) {
            [content appendString:[NSString stringWithFormat:@"平时喜欢用什么社交软件工具？\n%@\n\n",model.social]];
        }
        if (model.brand.length) {
            [content appendString:[NSString stringWithFormat:@"喜欢什么牌子呢?\n%@\n\n",model.brand]];
        }
        if (model.OnlineOffline.length) {
            [content appendString:[NSString stringWithFormat:@"如果有一个年轻人生活消费（潮服耐克、阿迪达斯、化妆品等）打折的平台，你希望是网店购买还是实体店呢？\n%@\n\n",model.OnlineOffline]];
        }
        if (model.share.length) {
            [content appendString:[NSString stringWithFormat:@"如果这个平台推举一些活动比如：动漫展、音乐节、明星演唱会、跑步节，你会有兴趣吗？会介绍朋友去玩这个平台吗？\n%@\n\n",model.share]];
        }
        if (model.age.length) {
            [content appendString:[NSString stringWithFormat:@"方便问下您是几几年的吗？\n%@\n\n",model.age]];
        }
        if (model.occupation.length) {
            [content appendString:[NSString stringWithFormat:@"请问你是学生还是在工作了？\n%@\n\n",model.occupation]];
        }
        if (model.single.length) {
            [content appendString:[NSString stringWithFormat:@"请问有男/女朋友吗？\n%@\n\n",model.single]];
        }
        if (model.sex.length) {
            [content appendString:[NSString stringWithFormat:@"男生/女生\n%@\n\n",model.sex]];
        }
        
        self.contenTextView.text = content;
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
