# 一句代码实现新特性
> 纯原生,布局都是原生的,速度快,稳定,觉得好就点一个赞吧
> 使用方法,传入图片的名称数组就行
```
导入头文件 #import "JJNewFeatureView.h"

NSArray* picNameArray = @[@"new_feature_1",@"new_feature_2",@"new_feature_3",@"new_feature_4"];

JJNewFeatureView* newFeatureView = [[JJNewFeatureView alloc]initWithPicNameArray:picNameArray];
```

> 其他可以设置的,但都预设了默认设置,可以不实现
```
//翻页指示器距离屏幕底部的高度
newFeatureView.pageControllBottom = 100;
//翻页指示器当未展示页的颜色
newFeatureView.pageIndicatorTintColor = [UIColor redColor];
//翻页指示器当前页面的颜色
newFeatureView.currentPageIndicatorTintColor = [UIColor yellowColor];
```
![image](https://github.com/luowenqi/JJNewFeature/blob/master/新特性界面/新特性界面/ScreenShot/Snip20170409_19.png)
![image](https://github.com/luowenqi/JJNewFeature/blob/master/新特性界面/新特性界面/ScreenShot/Snip20170409_20.png)
