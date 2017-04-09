//
//  JJNewFeatureView.m
//  新特性界面
//
//  Created by 罗文琦 on 2017/4/9.
//  Copyright © 2017年 罗文琦. All rights reserved.
//

#import "JJNewFeatureView.h"
#import "Masonry.h"
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
@property(nonatomic , assign) CGFloat  screenWidth;

/**
 屏幕的高度
 */
@property(nonatomic , assign) CGFloat  screenHight;

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
    
    self.screenHight = [UIScreen mainScreen].bounds.size.height;
    self.screenWidth = [UIScreen mainScreen].bounds.size.width;
    self.picCount = self.picNameArray.count;
    [self creatScrollView];
    [self creatPageControll];
}

#pragma mark - 创建scrollView
-(void)creatScrollView{
    UIScrollView* scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, _screenWidth, _screenHight)];
    self.scollView = scrollView;
    scrollView.delegate = self;
    [self addSubview:_scollView];
    scrollView.showsHorizontalScrollIndicator = NO;
    
    //给scollView加图片
    CGFloat marginX = 0;
    for (NSInteger i = 0; i<_picCount; i++) {
        marginX = _screenWidth * i;
        UIImageView* imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:_picNameArray[i]]];
        [self.scollView addSubview:imageView];
        imageView.frame = CGRectMake(marginX, 0, _screenWidth, _screenHight);
    }
    
    //设置scrollView的滚动范围
    _scollView.contentSize = CGSizeMake(_screenWidth * (_picCount + 1), 0);
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
    [pageControll mas_makeConstraints:^(MASConstraintMaker *make) {
        [make centerX];
        make.bottom.equalTo(self).offset(-PAGEVCBOTTOM);
    }];
    
    

}


#pragma mark - scrollView正在滚动
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.pageControll.currentPage = (int)((scrollView.contentOffset.x / _screenWidth) + 0.5);
    if (scrollView.contentOffset.x == _screenWidth * _picCount) {
        [self removeFromSuperview];
    }
    self.pageControll.hidden = scrollView.contentOffset.x > _screenWidth * (_picCount - 0.5);
}


-(void)setPageIndicatorTintColor:(UIColor *)pageIndicatorTintColor{
    self.pageControll.pageIndicatorTintColor = pageIndicatorTintColor;
}
-(void)setCurrentPageIndicatorTintColor:(UIColor *)currentPageIndicatorTintColor{
    self.pageControll.currentPageIndicatorTintColor = currentPageIndicatorTintColor;
}
-(void)setPageControllBottom:(CGFloat)pageControllBottom{
  [_pageControll mas_updateConstraints:^(MASConstraintMaker *make) {
      make.bottom.equalTo(self).offset(pageControllBottom);
  }];
}



@end
