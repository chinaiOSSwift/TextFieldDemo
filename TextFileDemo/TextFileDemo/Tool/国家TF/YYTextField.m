//
//  YYTextField.m
//  TextFileDemo
//
//  Created by SPARKWYY on 2017/10/11.
//  Copyright © 2017年 SKOrganization. All rights reserved.
//

#import "YYTextField.h"

@interface YYTextField()<UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, strong)UIPickerView *pickView;
@end

@implementation YYTextField

- (UIPickerView *)pickView{
    if (!_pickView) {
        // 创建UIPickView
        UIPickerView *pickView = [[UIPickerView alloc]init];
        pickView.delegate = self;
        pickView.dataSource = self;
        _pickView = pickView;
    }
    return _pickView;
}

- (void)initWithTextField{
    [self pickerView:self.pickView didSelectRow:0 inComponent:0];
}

- (void)awakeFromNib{
    [super awakeFromNib];
    // 初始化文本框 修改文本框弹出键盘类型
    self.inputView = self.pickView;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化文本框 修改文本框弹出键盘类型
        self.inputView = self.pickView;
    }
    return self;
}

// 实现协议方法
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 3;
}






@end
