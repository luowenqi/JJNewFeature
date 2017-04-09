# 一句代码实现新特性
> 使用方法
```

NSArray* picNameArray = @[@"new_feature_1",@"new_feature_2",@"new_feature_3",@"new_feature_4"];

JJNewFeatureView* newFeatureView = [[JJNewFeatureView alloc]initWithPicNameArray:picNameArray];
```

> 其他可以设置的
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
