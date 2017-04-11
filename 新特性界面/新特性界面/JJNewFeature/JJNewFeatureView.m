//
//  JJNewFeatureView.m
//  新特性界面
//
//  Created by 罗文琦 on 2017/4/9.
//  Copyright © 2017年 罗文琦. All rights reserved.
//

#import "JJNewFeatureView.h"


//翻页指示器默认的底部高度
#define PAGEVCBOTTOM 70

@interface JJNewFeatureView ()<UIScrollViewDelegate>

/**
scrollView
 */
@property(nonatomic , weak) UIScrollView * scollView;

/**
 翻页指示器
 */
@property(nonatomic , weak) UIPageControl * pageControll;

/**
 屏幕的宽度
 */
@property(nonatomic , assign) CGFloat  jjScreenWidth;

/**
 屏幕的高度
 */
@property(nonatomic , assign) CGFloat  jjScreenHight;

/**
 图片的数量
 */
@property(nonatomic , assign) NSUInteger picCount;


/**
 图片数组
 */
@property(nonatomic , strong) NSArray * picNameArray;

@end

@implementation JJNewFeatureView


-(instancetype)initWithPicNameArray:(NSArray*)picNameArray{
    if (self = [super init]) {
        self.picNameArray = picNameArray;
        NSLog(@"%@",picNameArray);
        [self setupUI];
    }
    return self;
}


-(void)setupUI{
    
    self.jjScreenHight = [UIScreen mainScreen].bounds.size.height;
    self.jjScreenWidth = [UIScreen mainScreen].bounds.size.width;
    self.picCount = self.picNameArray.count;
    [self creatScrollView];
    [self creatPageControll];
}

#pragma mark - 创建scrollView
-(void)creatScrollView{
    UIScrollView* scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, _jjScreenWidth, _jjScreenHight)];
    self.scollView = scrollView;
    scrollView.delegate = self;
    [self addSubview:_scollView];
    scrollView.showsHorizontalScrollIndicator = NO;
    
    //给scollView加图片
    CGFloat marginX = 0;
    for (NSInteger i = 0; i<_picCount; i++) {
        marginX = _jjScreenWidth * i;
        UIImageView* imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:_picNameArray[i]]];
        [self.scollView addSubview:imageView];
        imageView.frame = CGRectMake(marginX, 0, _jjScreenWidth, _jjScreenHight);
    }
    
    //设置scrollView的滚动范围
    _scollView.contentSize = CGSizeMake(_jjScreenWidth * (_picCount + 1), 0);
    _scollView.pagingEnabled = YES;
}

#pragma mark - 创建翻页指示器
-(void)creatPageControll{
    UIPageControl* pageControll = [[UIPageControl alloc]init];
    _pageControll  =pageControll;
    pageControll.numberOfPages = _picCount;
    pageControll.currentPageIndicatorTintColor = [UIColor orangeColor];
    pageControll.pageIndicatorTintColor = [UIColor lightGrayColor];
    [self addSubview:pageControll];
    
    

    NSLayoutConstraint* layoutCenterX = [NSLayoutConstraint constraintWithItem:pageControll
                                                              attribute:NSLayoutAttributeCenterX
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self
                                                              attribute:NSLayoutAttributeCenterX
                                                             multiplier:1.0f
                                                               constant:0];
    
    //给pageCpntroller添加原生约束
    /*
     参数解释
     constraintWithItem : 给哪一个控件添加约束
     attribute : (属性) 添加什么约束
     relatedBy : () 什么关系,一般都是直接写等于
     toItem : 相对于哪一个控件
     attribute : (属性)相对控件的哪一个已经确定好的位置
     multiplier : (倍数)一般直接写1.0f
     constant : (常量)变化量
     连在一起就是:   pageController的bottom等于self的bottom的1.0倍,偏移量:向上偏移70
     */
    NSLayoutConstraint* layoutBottom = [NSLayoutConstraint constraintWithItem:pageControll
                                                              attribute:NSLayoutAttributeBottom
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self
                                                              attribute:NSLayoutAttributeBottom
                                                             multiplier:1.0f
                                                               constant:-70];
    //关闭系统自动布局
    pageControll.translatesAutoresizingMaskIntoConstraints = NO;
    //让自己写的布局生效,这个是ios8以后的写法
    layoutCenterX.active = YES;
    layoutBottom.active = YES;
    //让自己的布局生效,合适ios6,ios7中的写法
   // pageControll addConstraints:@[layoutCenterX,layoutBottom];
}


#pragma mark - scrollView正在滚动
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.pageControll.currentPage = (int)((scrollView.contentOffset.x / _jjScreenWidth) + 0.5);
    if (scrollView.contentOffset.x == _jjScreenWidth * _picCount) {
        [self removeFromSuperview];
    }
    self.pageControll.hidden = scrollView.contentOffset.x > _jjScreenWidth * (_picCount - 0.5);
}


-(void)setPageIndicatorTintColor:(UIColor *)pageIndicatorTintColor{
    self.pageControll.pageIndicatorTintColor = pageIndicatorTintColor;
}
-(void)setCurrentPageIndicatorTintColor:(UIColor *)currentPageIndicatorTintColor{
    self.pageControll.currentPageIndicatorTintColor = currentPageIndicatorTintColor;
}

//更新pageController的约束
-(void)setPageControllBottom:(CGFloat)pageControllBottom{
    NSLayoutConstraint* layoutCenterX = [NSLayoutConstraint constraintWithItem:_pageControll
                                                                     attribute:NSLayoutAttributeCenterX
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self
                                                                     attribute:NSLayoutAttributeCenterX
                                                                    multiplier:1.0f
                                                                      constant:0];
    
    NSLayoutConstraint* layoutBottom = [NSLayoutConstraint constraintWithItem:_pageControll
                                                                    attribute:NSLayoutAttributeBottom
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1.0f
                                                                     constant:-pageControllBottom];
    
    _pageControll.translatesAutoresizingMaskIntoConstraints = NO;
    layoutCenterX.active = YES;
    layoutBottom.active = YES;
}



@end
