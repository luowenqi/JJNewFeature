//
//  ViewController.m
//  新特性界面
//
//  Created by 罗文琦 on 2017/4/8.
//  Copyright © 2017年 罗文琦. All rights reserved.
//

#import "ViewController.h"
#import "JJNewFeatureView.h"

@interface ViewController ()<UIScrollViewDelegate>



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    NSArray* picNameArray = @[@"new_feature_1",@"new_feature_2",@"new_feature_3",@"new_feature_4"];
    JJNewFeatureView* newFeatureView = [[JJNewFeatureView alloc]initWithPicNameArray:picNameArray];
    
    newFeatureView.frame = self.view.bounds;
    [self.view addSubview:newFeatureView];
    
    //新特性的pageControll距离底部的距离
    newFeatureView.pageControllBottom = 100;
    
    //你的点赞,是我继续的动力,觉得好就请点赞鼓励我吧,项目链接https://github.com/luowenqi/JJNewFeature
    
    
    
    /*
     其他可以定制的
    //翻页指示器距离屏幕底部的高度
    newFeatureView.pageControllBottom = 100;
    //翻页指示器当未展示页的颜色
    newFeatureView.pageIndicatorTintColor = [UIColor redColor];
    //翻页指示器当前页面的颜色
    newFeatureView.currentPageIndicatorTintColor = [UIColor yellowColor];
    */
    
}





@end























