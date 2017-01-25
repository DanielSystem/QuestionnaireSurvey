//
//  QuestionnaireSurveyVCViewController.m
//  QuestionnaireSurvey
//
//  Created by 吴伟祥 on 16/12/17.
//  Copyright © 2016年 WWX. All rights reserved.
//

#import "QuestionnaireSurveyVCViewController.h"
#import "NoteTableViewCell.h"
#import "PhotoTableViewCell.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <UIKit/UIKit.h>
#import <MobileCoreServices/UTCoreTypes.h>


@interface QuestionnaireSurveyVCViewController ()<UITabBarDelegate,UITableViewDataSource,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (strong, nonatomic) IBOutlet UITableView *table;

@end

@implementation QuestionnaireSurveyVCViewController


- (IBAction)back {
    
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}

- (void)viewDidLoad {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(photoNT:) name:@"PHOTO" object:nil];
    
    self.model = [[QuestionModel alloc] init];
    self.table.estimatedRowHeight  =30;
    self.table.rowHeight =UITableViewAutomaticDimension ;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 12;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row =indexPath.row;
    __weak __typeof(&*self)weakSelf =self;

    if (row ==11) {
        static NSString *identifier = @"PhotoTableViewCell";
         PhotoTableViewCell *photoCell = [tableView dequeueReusableCellWithIdentifier:identifier];
        photoCell.didClickEventBlock = ^(){
            UIImagePickerController *imagepicker = [[UIImagePickerController alloc]init];
            
            [imagepicker setAllowsEditing:YES];
            
            imagepicker.delegate = weakSelf;
            
            imagepicker.sourceType =  UIImagePickerControllerSourceTypeCamera;
            
            imagepicker.showsCameraControls  = YES;
            
            //    imagepicker.cameraViewTransform = CGAFFIN
            imagepicker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
            
            imagepicker.cameraFlashMode = UIImagePickerControllerCameraFlashModeAuto;
            
            imagepicker.mediaTypes = @[(NSString*)kUTTypeImage];
            
            [weakSelf presentViewController:imagepicker animated:YES completion:nil];
           
        };
        if (self.model.photo) {
            [photoCell.button setBackgroundImage:[UIImage imageWithData:self.model.photo] forState:UIControlStateNormal];
        }
        return photoCell;
    }
    static NSString *identifier = @"NoteTableViewCell";
    NoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
   
    if (row ==0) {
        cell.titleLabel.text =@"平时有什么兴趣爱好吗？";
        cell.didEditingBlock =^(NSString *content){
            weakSelf.model.like = content;
        };
        cell.texeView.text =weakSelf.model.like;

    }else if(row == 1){
        cell.titleLabel.text =@"有参加什么展会活动吗？比如动漫展、音乐节、明星演唱会、跑步节动漫展、明星演唱会";
        cell.didEditingBlock =^(NSString *content){
            weakSelf.model.activity = content;
            
        };
        cell.texeView.text =weakSelf.model.activity;

    }else if(row == 2){
        cell.titleLabel.text =@"平时购物习惯在那里呢？淘宝、微商、京东等线上？还是线下实体店实体店？";
        cell.didEditingBlock =^(NSString *content){
            weakSelf.model.habits = content;

        };
        cell.texeView.text =weakSelf.model.habits;

    }else if(row == 3){
        cell.titleLabel.text =@"平时喜欢用什么社交软件工具？";
        cell.didEditingBlock =^(NSString *content){
            weakSelf.model.social = content;

        };
        cell.texeView.text =weakSelf.model.social;

    }else if(row == 4){
        cell.titleLabel.text =@"喜欢什么牌子呢？";
        cell.didEditingBlock =^(NSString *content){
            weakSelf.model.brand = content;

        };
        cell.texeView.text =weakSelf.model.brand;

    }else if(row == 5){
        cell.titleLabel.text =@"如果有一个年轻人生活消费（潮服耐克、阿迪达斯、化妆品等）打折的平台，你希望是网店购买还是实体店呢？";
        cell.didEditingBlock =^(NSString *content){
            weakSelf.model.OnlineOffline = content;

        };
        cell.texeView.text =weakSelf.model.OnlineOffline;

    }else if(row == 6){
        cell.titleLabel.text =@"如果这个平台推举一些活动比如：动漫展、音乐节、明星演唱会、跑步节，你会有兴趣吗？会介绍朋友去玩这个平台吗？";
        cell.didEditingBlock =^(NSString *content){
            weakSelf.model.share = content;
        };
        cell.texeView.text =weakSelf.model.share;

    }else if(row == 7){
        cell.titleLabel.text =@"方便问下您是几几年的吗？";
        cell.didEditingBlock =^(NSString *content){
            weakSelf.model.age = content;

        };
        cell.texeView.text =weakSelf.model.age;

    }else if(row == 8){
        cell.titleLabel.text =@"请问你是学生还是在工作了？";
        cell.didEditingBlock =^(NSString *content){
            weakSelf.model.occupation = content;

        };
        cell.texeView.text =weakSelf.model.occupation;

    }else if(row == 9){
        cell.titleLabel.text =@"请问有男/女朋友吗？";
        cell.didEditingBlock =^(NSString *content){
            weakSelf.model.single = content;

        };
        cell.texeView.text =weakSelf.model.single;

    }else if(row == 10){
        cell.titleLabel.text =@"男生/女生";
        cell.didEditingBlock =^(NSString *content){
            weakSelf.model.sex = content;

        };
        cell.texeView.text =weakSelf.model.sex;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
 }
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage* image;
    
    
    image=[info objectForKey:UIImagePickerControllerEditedImage];
    
    NSData *data ;
    
    data = UIImagePNGRepresentation(image);
    
    self.model.photo = data;
    [self.table reloadData];
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)photoNT:(NSNotification *)not{
    self.model.photo = not.userInfo[@"photo"];
    [self.table reloadData];
}
- (IBAction)done {
    if (_callBlock) {
        if (!self.model.photo) {
            UIImage *img;
            
            if ([self.model.sex containsString:@"女"]) {
                img= [UIImage imageNamed:@"G"];

            }else{
                img= [UIImage imageNamed:@"B"];

            }
            NSData *dataObj = UIImageJPEGRepresentation(img, 1.0);
            self.model.photo = dataObj;

        }

//        self.model.sex =;
        _callBlock(self.model);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
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
