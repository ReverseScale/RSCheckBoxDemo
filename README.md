# RSCheckBoxDemo

![](https://img.shields.io/badge/platform-iOS-red.svg) ![](https://img.shields.io/badge/language-Objective--C-orange.svg) ![](https://img.shields.io/badge/download-1.8MB-brightgreen.svg
) ![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 

OC版本高定制化的复选框工具，基于UIButton封装，支持多种方式创建，自定义方法丰富。

| 名称 |1.列表页 |2.单选展示页 | 3.复选结果页 |
| ------------- | ------------- | ------------- | ------------- |
| 截图 | ![](http://og1yl0w9z.bkt.clouddn.com/17-7-26/20478667.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-7-26/43568256.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-7-26/50663642.jpg) |
| 描述 | 通过 storyboard 搭建基本框架 | 纯代码和XIB方式创建 | 纯代码和XIB方式创建 |


## Advantage 框架的优势
* 1.文件少，代码简洁
* 2.不依赖任何其他第三方库
* 3.同时支持纯代码创建和XIB创建
* 4.使用代理方式传递响应
* 5.具备较高自定义性

## Requirements 要求
* iOS 7+
* Xcode 8+


## Usage 使用方法
### 第一步 引入头文件、签署协议
```
#import "ZZCheckBox.h"
@interface SingleCheckBoxViewController ()<ZZCheckBoxDelegate, ZZCheckBoxDataSource, ZZCheckBoxStoryboardDataSource>
// XIB创建时的集合对象，排序和拖拽连线顺序一致（注意：更换Xcode版本可能顺序会变）
@property (nonatomic, strong) IBOutletCollection(ZZCheckBoxButton) NSArray *checkBoxButtonArray; 
@end
```
### 第二步 简单调用
```
// 创建
{
ZZCheckBox *singleCheckBox;
ZZCheckBox *storyboardCheckBox;
}
// 声明
_singleCheckBox = [ZZCheckBox checkBoxWithCheckBoxType:CheckBoxTypeSingleCheckBox];
_singleCheckBox.tag = 1;
_singleCheckBox.delegate = self;
_singleCheckBox.dataSource = self;
    
_storyboardCheckBox = [ZZCheckBox checkBoxWithCheckBoxType:CheckBoxTypeSingleCheckBox];
_storyboardCheckBox.tag = 3;
_storyboardCheckBox.delegate = self;
_storyboardCheckBox.storyboardDataSource = self;
```
### 第三步 协议调用
#### 纯代码需要实现的协议
```
#pragma mark - ZZCheckBoxDataSource
// 设置数据行数
- (NSInteger)numberOfRowsInCheckBox:(ZZCheckBox *)checkBox {
    return self.arrayData.count;
}
// 设置放置对象
- (UIView *)checkBox:(ZZCheckBox *)checkBox supperViewAtIndex:(NSInteger)index {
    return self.view;
}
// 设置位置信息
- (CGRect)checkBox:(ZZCheckBox *)checkBox frameAtIndex:(NSInteger)index {
    return CGRectMake(100, 150 + 40 * index, 180, 44);
}
// 设置文字内容
- (NSString *)checkBox:(ZZCheckBox *)checkBox titleForCheckBoxAtIndex:(NSInteger)index {
    if (checkBox.tag == 1) {
        return self.arrayData[index];
    }
    return nil;
}
// 设置字体颜色
- (UIColor *)checkBox:(ZZCheckBox *)checkBox titleColorForCheckBoxAtIndex:(NSInteger)index {
    return [UIColor blackColor];
}

// 可选方法
// 设置字体大小
//- (UIFont *)checkBox:(ZZCheckBox *)checkBox titleFontForCheckBoxAtIndex:(NSInteger)index {
//    return [UIFont systemFontOfSize:16];
//}

// 重写方法
//- (UIImage *)checkBox:(ZZCheckBox *)checkBox imageForCheckBoxAtIndex:(NSInteger)index forState:(UIControlState)state {
//    if (state == UIControlStateNormal) {
//        UIImage *image = [UIImage imageNamed:@""];
//        return image;
//    } else if (state == UIControlStateSelected) {
//        UIImage *image = [UIImage imageNamed:@""];
//        return image;
//    }
//    return nil;
//}
```
```
#pragma mark - ZZCheckBoxDelegate
// 可选
// 设置默认选中状态
- (NSArray<NSNumber *> *)defaultSelectedIndexInCheckBox:(ZZCheckBox *)checkBox {
    return @[@0];
}
// 响应取消状态
- (void)checkBox:(ZZCheckBox *)checkBox didDeselectedAtIndex:(NSInteger)index {
    if (checkBox.tag == 1) {
        NSLog(@"ZZSingleCheckBox Deselected %ld Button", index);
    } else {
        NSLog(@"ZZMutableCheckBox Deselected %ld Button", index);
    }
}
// 响应点击状态
- (void)checkBox:(ZZCheckBox *)checkBox didSelectedAtIndex:(NSInteger)index {
    if (checkBox.tag == 1) {
        NSLog(@"ZZSingleCheckBox Selected %ld Button", index);
    } else {
        NSLog(@"ZZSingleCheckBox Selected %ld Button", index);
    }
}
// 功能方法
// 双点取消选中
- (BOOL)canCancleCheckSingleCheckBox:(ZZCheckBox *)checkBox {
    if (checkBox.tag == 1) {
        return YES;
    }
    return NO;
}
```
#### XIB需要实现的协议
```
#pragma mark - ZZCheckBoxStoryboardDataSource
- (NSInteger)numberOfStoryboardRowsInCheckBox:(ZZCheckBox *)checkBox {
    NSLog(@"self.checkBoxButtonArray:%@", self.checkBoxButtonArray);
    return self.checkBoxButtonArray.count;
}
- (ZZCheckBoxButton *)checkBox:(ZZCheckBox *)checkBox buttonAtIndex:(NSInteger)index {
    if (index < self.checkBoxButtonArray.count) {
        return self.checkBoxButtonArray[index];
    }
    return nil;
}
```

### 注意
1.单选、复选实现区分
```
// 单选
_singleCheckBox = [ZZCheckBox checkBoxWithCheckBoxType:CheckBoxTypeSingleCheckBox];
// 复选
_mutableCheckBox = [ZZCheckBox checkBoxWithCheckBoxType:CheckBoxTypeMutableCheckBox];
```
2.XIB创建时需要制定Button选中和非选中状态的图片。

使用简单、效率高效、进程安全~~~如果你有更好的建议,希望不吝赐教!


## License 许可证
RSCheckBoxDemo 使用 MIT 许可证，详情见 LICENSE 文件。


## Contact 联系方式:
* WeChat : WhatsXie
* Email : ReverseScale@iCloud.com
* Blog : https://reversescale.github.io
