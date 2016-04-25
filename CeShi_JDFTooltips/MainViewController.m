//
//  MainViewController.m
//  CeShi_JDFTooltips
//
//  Created by SPIREJ on 16/4/22.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "MainViewController.h"
#import "NextViewController.h"
#import "JDFTooltipView.h"

@interface MainViewController ()
{
    JDFTooltipView *tooltip1, *tooltip2;
    UIButton *but1, *but2;
    BOOL show1, show2;
//    BOOL isHide1, isHide2;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"首页";
    
    but1 = [self createButtonWithFrame:CGRectMake(0, 180, 70, 30) title:@"第一种"];
    [but1 addTarget:self action:@selector(butAction1) forControlEvents:UIControlEventTouchUpInside];
    
    
    but2 = [self createButtonWithFrame:CGRectMake(0, 280, 70, 30) title:@"第二种"];
    [but2 addTarget:self action:@selector(butAction2) forControlEvents:UIControlEventTouchUpInside];
    
    //下一页按钮
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.frame = CGRectMake(self.view.frame.size.width-100, 70, 80, 20);
    nextBtn.backgroundColor = [UIColor orangeColor];
    [nextBtn setTitle:@"下一页" forState:UIControlStateNormal];
    nextBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [nextBtn addTarget:self action:@selector(nextController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
    
    show1 = NO;
    show2 = NO;
}

- (UIButton *)createButtonWithFrame:(CGRect)frame title:(NSString *)title {
    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    frame.origin.x = self.view.frame.size.width/2.0 - 35;
    but.frame = frame;
    [but setTitle:title forState:UIControlStateNormal];
    [but setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    but.layer.borderColor = [UIColor blueColor].CGColor;
    but.layer.borderWidth = 1.0;
    but.layer.cornerRadius = 8;
    but.layer.masksToBounds = YES;
    [self.view addSubview:but];
    return but;
}

- (void)butAction1{
    //
    if (show2) {
        [tooltip2 hideAnimated:YES];
        show2 = NO;
    }
    if (!show1) {
        tooltip1 = [[JDFTooltipView alloc] initWithTargetView:but1 hostView:self.view tooltipText:@"在投资期限内，每个月返还相同额度的利息，到期后返还最后一期利息和所有本金" arrowDirection:JDFTooltipViewArrowDirectionDown width:300.0f];
        tooltip1.font = [UIFont systemFontOfSize:12];
        tooltip1.textColour = [UIColor redColor];
        tooltip1.arrowDirection = JDFTooltipViewArrowDirectionDown;
        tooltip1.dismissOnTouch = NO;
        //是否有阴影
        tooltip1.shadowEnabled = YES;
        //阴影颜色
        tooltip1.shadowColour = [UIColor redColor];
        [tooltip1 show];
        show1 = YES;
    }else{
        [tooltip1 hideAnimated:YES];
        show1 = NO;
        }
}

- (void)butAction2{
    if (show1) {
        [tooltip1 hideAnimated:YES];
        show1 = NO;
    }
    if (!show2) {
        tooltip2 = [[JDFTooltipView alloc] initWithTargetPoint:CGPointMake(but2.frame.origin.x,but2.frame.origin.y+30) hostView:self.view tooltipText:@"在投资期限内，每个月返还相同额度的金额（包括部分本金和利息）" arrowDirection:JDFTooltipViewArrowDirectionUp width:400.0f];
        tooltip2.dismissOnTouch = NO;
        [tooltip2 show];
        show2 = YES;
    }else{
        [tooltip2 hideAnimated:YES];
        show2 = NO;
        }
}


- (void)nextController{
    //
    NextViewController *nextVC = [[NextViewController alloc] init];
    [self.navigationController pushViewController:nextVC animated:YES];
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
