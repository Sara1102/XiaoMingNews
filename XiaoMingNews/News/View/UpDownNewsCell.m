//
//  UpDownNewsCell.m
//  XiaoMingNews
//
//  Created by Ming on 2017/11/22.
//  Copyright © 2017年 Ming. All rights reserved.
//
  
#import "UpDownNewsCell.h"
#import "UIImageView+WebCache.h"
@interface UpDownNewsCell()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIView *picView;
@property (weak, nonatomic) IBOutlet UIView *msgView;
@property (weak, nonatomic) IBOutlet UIImageView *picImgView1;
@property (weak, nonatomic) IBOutlet UIImageView *picImgView2;
@property (weak, nonatomic) IBOutlet UIImageView *picImgView3;
@property (weak, nonatomic) IBOutlet UIImageView *picImgView4;
@property (weak, nonatomic) IBOutlet UILabel *authorMsgLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *picViewCon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameTailCon;
//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *picViewCon;

@end

@implementation UpDownNewsCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
    // Initialization code
}
-(void)setDic:(NSDictionary *)dic{
    if (dic!=_dic) {
        _dic=dic;
        [self setCellStyle];
    }
}
-(void)setCellStyle{
     self.picView.hidden=NO;
    self.picImgView4.hidden=YES;
    NSString *name=[self.dic objectForKey:@"name"];
    NSArray *headPhoto=[self.dic objectForKey:@"headPhoto"];
    [self.nameLabel setText: name];
    if (headPhoto.count==3) {
        self.picViewCon.constant=60;
        [self.picImgView1 sd_setImageWithURL:[NSURL URLWithString:[headPhoto objectAtIndex:0]] placeholderImage:nil];
        [self.picImgView2 sd_setImageWithURL:[NSURL URLWithString:[headPhoto objectAtIndex:1]] placeholderImage:nil];
        [self.picImgView3 sd_setImageWithURL:[NSURL URLWithString:[headPhoto objectAtIndex:2]] placeholderImage:nil];
    }
    else if (headPhoto.count>0) {
        self.picViewCon.constant=0;
        self.picView.hidden=YES;
        self.picImgView4.hidden=NO;
        self.nameTailCon.constant=120;
        [self.picImgView4 sd_setImageWithURL:[NSURL URLWithString:[headPhoto objectAtIndex:0]] placeholderImage:nil];
    }
    else{
        self.picViewCon.constant=0;
        self.picView.hidden=YES;
        
    }
    NSString *author=[self.dic objectForKey:@"author"];
    NSString *commitNum=[NSString stringWithFormat:@"%@评论 时间",[self.dic objectForKey:@"commitCount"]];
    [self.authorMsgLabel setText:[NSString stringWithFormat:@"%@ %@",author,commitNum]];
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
