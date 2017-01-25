//
//  ViewController.m
//  QuestionnaireSurvey
//
//  Created by 吴伟祥 on 16/12/17.
//  Copyright © 2016年 WWX. All rights reserved.
//

#import "ViewController.h"

#import "QuestionnaireSurveyVCViewController.h"
#import "FMDB.h"
#import "ShowViewController.h"
#import "QuestionModel.h"
#import "DetailTableViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UILabel *titleView;
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@property(nonatomic,strong)FMDatabase *db;


@end

@implementation ViewController
- (IBAction)addNew:(id)sender {
}

- (void)viewDidLoad {
    self.resource = [@[]mutableCopy];
    [super viewDidLoad];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.rowHeight = 68;
    NSString *filename = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"QuestionnaireSurvey.sqlite"];
    
    // 1.创建数据库实例对象
    self.db = [FMDatabase databaseWithPath:filename];
    
    // 2.打开数据库
    if ( [self.db open] ) {
        NSLog(@"数据库打开成功");
        
        // 创表
        BOOL result = [self.db executeUpdate:@"create table if not exists t_QS (id integer primary key autoincrement, sex text, age text,like text,OnlineOffline text,activity text,social text,brand text,occupation text,share text,habits text,single text,photo data);"];
        
        if (result) {
            NSLog(@"创表成功");
        } else {
            NSLog(@"创表失败");
        }
    } else {
        NSLog(@"数据库打开失败");
    }
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [self query];
    [self.tableview reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.resource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"DETAIL";
    DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    QuestionModel *model = self.resource[indexPath.row];
    NSMutableString *title = [NSMutableString new];
    if (model.age.length) {
        [title appendFormat:@"%@,",model.age];
    }if (model.sex.length) {
        [title appendFormat:@"%@,",model.sex];
    }if (model.occupation.length) {
        [title appendFormat:@"%@,",model.occupation];
    }
    cell.titleLabel.text = title;

    
    NSMutableString *subtitle =[NSMutableString new];
    if (model.like.length) {
        [subtitle appendFormat:@"%@,",model.like];
    }if (model.habits.length) {
        [subtitle appendFormat:@"%@,",model.habits];
    }if (model.brand.length) {
        [subtitle appendFormat:@"%@,",model.brand];
    }
    cell.subtitleLabel.text = subtitle;
    cell.image.image = [UIImage imageWithData:model.photo];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    QuestionModel *model  = self.resource[indexPath.row];
    [self performSegueWithIdentifier:@"SHOW" sender:model];
}

- (IBAction)query
{
    
    [self.resource removeAllObjects];
    // 1.查询数据
    FMResultSet *rs = [self.db executeQuery:@"select * from t_QS;"];
    
    // 2.遍历结果集
    while (rs.next) {
        QuestionModel *model = [[QuestionModel alloc] init];
        
        model.id =  [NSNumber numberWithInt:[rs intForColumn:@"id"] ];
        model.sex =[rs stringForColumn:@"sex"];
        model.age =[rs stringForColumn:@"age"];
        model.OnlineOffline =[rs stringForColumn:@"OnlineOffline"];
        model.like =[rs stringForColumn:@"like"];
        model.activity =[rs stringForColumn:@"activity"];
        model.social =[rs stringForColumn:@"social"];
        model.brand =[rs stringForColumn:@"brand"];
        model.occupation =[rs stringForColumn:@"occupation"];
        model.single =[rs stringForColumn:@"single"];
        model.photo = [rs dataForColumn:@"photo"];
        model.share = [rs stringForColumn:@"share"];
        model.habits = [rs stringForColumn:@"habits"];

        [self.resource  addObject:model];
    }
    self.titleView.text = [NSString stringWithFormat:@"(%d)",self.resource.count];
}
- (IBAction)insert:(QuestionModel *)model
{
    
//        NSString *name = [NSString stringWithFormat:@"rose-%d", arc4random() % 1000];
//        NSNumber *age = @(arc4random() % 100 + 1);
    
        ;
    if ([self.db executeUpdate:@"insert into t_QS (sex, age,OnlineOffline,like,activity,social,brand,occupation,single,photo,share,habits) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);", model.sex, model.age,model.OnlineOffline,model.like,model.activity,model.social,model.brand,model.occupation,model.single,model.photo,model.share,model.habits]) {
        [self.resource addObject:model];
        [self.tableview reloadData];
    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    

    if ([segue.identifier isEqualToString:@"ADD"]) {
        __weak __typeof(&*self)weakSelf =self;
        QuestionnaireSurveyVCViewController *receive = segue.destinationViewController;
        receive.callBlock =^(QuestionModel *model){
            [weakSelf insert:model];
            
        };
        
         [self.navigationController pushViewController:receive animated:YES];
    }else if([segue.identifier isEqualToString:@"SHOW"]){
        ShowViewController *showVC= segue.destinationViewController;
        showVC.model = sender;
    }
   

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
