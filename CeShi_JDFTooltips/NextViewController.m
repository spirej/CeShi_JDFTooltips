//
//  NextViewController.m
//  CeShi_JDFTooltips
//
//  Created by SPIREJ on 16/4/22.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "NextViewController.h"
#import "JDFSequentialTooltipManager.h"

@interface NextViewController ()
{
    UILabel *label1, *label2, *label3;
}
@property(nonatomic, strong)JDFSequentialTooltipManager *tooltipManager;
@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    label1 = [self createLabelWithFrame:CGRectMake(20, 100, 70, 20) title:@"杀人狂魔" bgColor:[UIColor redColor]];
    
    label2 = [self createLabelWithFrame:CGRectMake(300, 300, 70, 20) title:@"程序员" bgColor:[UIColor redColor]];
    
    label3 = [self createLabelWithFrame:CGRectMake(100, 500, 70, 20) title:@"常旭媛G" bgColor:[UIColor redColor]];
    
    self.tooltipManager = [[JDFSequentialTooltipManager alloc] initWithHostView:self.view];
    
    [self.tooltipManager addTooltipWithTargetView:label1 hostView:self.view tooltipText:@"《杀人狂魔》是弗兰克·卡方执导的恐怖片，阿美莉嘉·奥利沃、伊利亚·伍德等参加演出。该片主要讲述了杀人狂魔弗兰克的故事。" arrowDirection:JDFTooltipViewArrowDirectionLeft width:200.0f];
    
    [self.tooltipManager addTooltipWithTargetView:label2 hostView:self.view tooltipText:@"程序员不是你们眼中的程序猿-后IT时代。程序猿是一种非常特殊的、可以从事程序开发、维护的动物。一般分为程序设计猿和程序编码猿，但两者的界限并不非常清楚，都可以进行开发、维护工作，特别是在中国，而且最重要的一点，二者都是一种非常悲剧的存在。" arrowDirection:JDFTooltipViewArrowDirectionRight width:200.0f];
    
    [self.tooltipManager addTooltipWithTargetView:label3 hostView:self.view tooltipText:@"身为一名程序媛,总结混迹于技术圈多年的经验可以概括成三要三不要。" arrowDirection:JDFTooltipViewArrowDirectionUp width:200.0f];
}

- (UILabel *)createLabelWithFrame:(CGRect)frame title:(NSString *)title bgColor:(UIColor *)color{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.font = [UIFont systemFontOfSize:14];
    label.text = title;
    label.backgroundColor = color;
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    return label;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.tooltipManager showNextTooltip];
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
