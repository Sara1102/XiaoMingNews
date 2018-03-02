//
//  NewsDetailVC.m
//  XiaoMingNews
//
//  Created by Ming on 2017/12/12.
//  Copyright © 2017年 Ming. All rights reserved.
//

#import "NewsDetailVC.h"

@interface NewsDetailVC ()
@property (weak, nonatomic) IBOutlet WKWebView *webView;

@end

@implementation NewsDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *rurl=@"http://blog.sunnyxx.com/2015/07/04/ios-interview/";
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:rurl]]];
    // Do any additional setup after loading the view from its nib.
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
