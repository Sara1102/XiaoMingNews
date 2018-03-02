//
//  NewsMainListVC.m
//  XiaoMingNews
//
//  Created by Ming on 2017/11/22.
//  Copyright © 2017年 Ming. All rights reserved.
//

#import "NewsMainListVC.h"
#import "UpDownNewsCell.h"

#import "NewsDetailVC.h"

@interface NewsMainListVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *list;

@end

@implementation NewsMainListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.tableView registerNib:[UINib nibWithNibName:@"UpDownNewsCell" bundle:nil] forCellReuseIdentifier:@"UpDownCell"];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"json"];
   NSString *jsonStr  = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSData *jsonData   = [[NSData alloc] initWithData:[jsonStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    self.list=[dic objectForKey:@"list"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.list.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    UpDownNewsCell *cell1=[tableView dequeueReusableCellWithIdentifier:@"UpDownCell" forIndexPath:indexPath];
    NSDictionary *dic=[self.list objectAtIndex:[indexPath row]];
    NSLog(@"%@",dic);
    cell1.dic=dic;
    
    return  cell1;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    NSLog(@"22222222");
    NewsDetailVC *detailVc=[[NewsDetailVC alloc]initWithNibName:@"NewsDetailVC" bundle:nil];
    [self.navigationController pushViewController:detailVc animated:YES];
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
