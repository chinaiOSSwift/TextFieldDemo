//
//  ViewController.m
//  TextFileDemo
//
//  Created by SPARKWYY on 2017/10/11.
//  Copyright © 2017年 SKOrganization. All rights reserved.
//

#import "ViewController.h"
#import "UITextField+Supper.h"
@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *countryTextF;
@property (weak, nonatomic) IBOutlet UITextField *birthdayTextF;
@property (weak, nonatomic) IBOutlet UITextField *cityTextF;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.countryTextF.delegate = self;
    self.birthdayTextF.delegate = self;
    self.cityTextF.delegate = self;
}

// 是否允许开始编辑
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return true;
}
// 开始编辑时调用（成为第一响应者） became first responder
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    // 当前编辑框选中第一个
    // 在运行过程中，会找真实类型的方法
    [textField initWithTextField];
}
// 是否允许结束编辑
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return true;
}
// 当结束编辑时调用
- (void)textFieldDidEndEditing:(UITextField *)textField{

}
// 替换textFieldDidEndEditing
- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason NS_AVAILABLE_IOS(10_0){
    
}

// 是否允许文本框的内容（no/false 拦截用书输入 true/yes 允许用户输入）
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return false;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
