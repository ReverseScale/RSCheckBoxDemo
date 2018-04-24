//
//  SingleCheckBoxViewController.m
//  RSCheckBoxDemo
//
//  Created by WhatsXie on 2017/7/25.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "SingleCheckBoxViewController.h"
#import "ZZCheckBox.h"

@interface SingleCheckBoxViewController ()<ZZCheckBoxDelegate, ZZCheckBoxDataSource, ZZCheckBoxStoryboardDataSource>
@property (nonatomic, strong) ZZCheckBox *storyboardCheckBox;
@property (nonatomic, strong) IBOutletCollection(ZZCheckBoxButton) NSArray *checkBoxButtonArray;

@property (nonatomic, strong) ZZCheckBox *singleCheckBox;
@property (nonatomic, strong) NSArray *arrayData;
@end

@implementation SingleCheckBoxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.arrayData = @[@"Code Test 01", @"Code Test 02"];
    
    _singleCheckBox = [ZZCheckBox checkBoxWithCheckBoxType:CheckBoxTypeSingleCheckBox];
    _singleCheckBox.tag = 1;
    _singleCheckBox.delegate = self;
    _singleCheckBox.dataSource = self;
    
    _storyboardCheckBox = [ZZCheckBox checkBoxWithCheckBoxType:CheckBoxTypeSingleCheckBox];
    _storyboardCheckBox.tag = 3;
    _storyboardCheckBox.delegate = self;
    _storyboardCheckBox.storyboardDataSource = self;
}

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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
