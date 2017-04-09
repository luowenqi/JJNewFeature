//
//  JJNewFeatureView.h
//  新特性界面
//
//  Created by 罗文琦 on 2017/4/9.
//  Copyright © 2017年 罗文琦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JJNewFeatureView : UIView




/**
 翻页指示器展示页的颜色
 */
@property(nonatomic , strong) UIColor * currentPageIndicatorTintColor;

/**
 翻页指示器未展示页的颜色
 */
@property(nonatomic , strong) UIColor * pageIndicatorTintColor;


/**
 翻页指示器距离屏幕底部的高度
 */
@property(nonatomic , assign) CGFloat  pageControllBottom;


-(instancetype)initWithPicNameArray:(NSArray*)picNameArray;

@end
