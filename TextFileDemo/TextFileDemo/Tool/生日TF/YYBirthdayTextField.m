//
//  YYBirthdayTextField.m
//  TextFileDemo
//
//  Created by SPARKWYY on 2017/10/12.
//  Copyright © 2017年 SKOrganization. All rights reserved.
//

#import "YYBirthdayTextField.h"

@interface YYBirthdayTextField()
@property (nonatomic, strong) UIDatePicker *datePickView;
@end

@implementation YYBirthdayTextField

/**
 初始化文本框文字（选中第0列第0行）
 */
- (void)initWithTextField{
    // 一开始就有值
    [self dateChange:self.datePickView];
}

- (UIDatePicker *)datePickView{
    if (!_datePickView) {
        UIDatePicker *datePick = [[UIDatePicker alloc]init];
        // 设置datePickView的日期格式
        datePick.datePickerMode = UIDatePickerModeDate;
        datePick.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
        // 监听日期改变
        [datePick addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
        _datePickView = datePick;
    }
    return _datePickView;
}
// 从XIB拖拽的方式进行创建
- (void)awakeFromNib{
    [super awakeFromNib];
    // 改写输入框键盘类型
    self.inputView = self.datePickView;
    
    
}
// 代码的方式进行创建
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // 改写输入框键盘类型
        self.inputView = self.datePickView;
    }
    return self;
}
// 当UIDatePicker日期改变调动
- (void)dateChange:(UIDatePicker *)datePick{
    // 给当前的文本框赋值
    // 获取当前选中的日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    //把当前日期转化为字符串
    self.text = [dateFormatter stringFromDate:datePick.date];
}
@end
