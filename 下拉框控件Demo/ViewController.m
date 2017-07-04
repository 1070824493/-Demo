//
//  ViewController.m
//  下拉框控件Demo
//
//  Created by ty on 2017/7/4.
//  Copyright © 2017年 ty. All rights reserved.
//

#import "ViewController.h"
#import "XLPopMenuViewSingleton.h"
@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (IBAction)show:(UIButton *)sender {
    NSMutableArray *demoArr = [NSMutableArray new];
    for (int i = 0; i < [self titles].count; i++) {
        XLPopMenuViewModel *model = [[XLPopMenuViewModel alloc] init];
        model.image = [self images][i];
        model.title = [self titles][i];
        [demoArr addObject:model];
        
    }
    // 弹出框的宽度
    CGFloat menuViewWidth = 150;
    // 弹出框的左上角起点坐标(不包括三角形,三角形高度10)
    CGPoint startPoint = CGPointMake(CGRectGetMidX(sender.frame), CGRectGetMaxY(sender.frame)+10);
    [[XLPopMenuViewSingleton shareManager] creatPopMenuWithFrame:startPoint popMenuWidth:menuViewWidth popMenuItems:demoArr action:^(NSInteger index) {
        
        NSLog(@"index= %ld",(long)index);
        if (index==0) {
            NSLog(@"扫一扫");
            
        }
        else if(index==1)
        {
            NSLog(@"添加好友");
            
        }
        else
        {
            NSLog(@"发起群聊");
            
        }
        
    }];

}

- (NSArray *)titles
{
    return @[@"扫一扫",
             @"加好友",
             @"发起群聊"];
}

- (NSArray *) images {
    return @[@"menu_QR",
             @"menu_addFri",
             @"menu_multichat"];
}

@end
