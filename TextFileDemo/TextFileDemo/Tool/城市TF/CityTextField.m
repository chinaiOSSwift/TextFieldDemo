//
//  CityTextField.m
//  TextFileDemo
//
//  Created by SPARKWYY on 2017/10/12.
//  Copyright © 2017年 SKOrganization. All rights reserved.
//

#import "CityTextField.h"
#import "ProvinceModel.h"
@interface CityTextField()<UIPickerViewDelegate, UIPickerViewDataSource>
@property (nonatomic, strong) UIPickerView *pickView;

/**
 存放省份模型
 */
@property (nonatomic, strong) NSArray *provinceArr;

/**
 当前省份的角标
 */
@property (nonatomic, assign) NSInteger proIndex;

/**
 当前城市的角标
 */
@property (nonatomic, assign) NSInteger cityIndex;
@end


@implementation CityTextField


/**
 初始化文本框文字（选中第0列第0行）
 */
- (void)initWithTextField{
    [self pickerView:self.pickView didSelectRow:0 inComponent:0];
}
- (UIPickerView *)pickView{
    if (!_pickView) {
        UIPickerView *pickView = [[UIPickerView alloc]init];
        pickView.delegate = self;
        pickView.dataSource = self;
        _pickView = pickView;
    }
    return _pickView;
}

- (NSArray *)provinceArr{
    if (!_provinceArr) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"countryCity.json" ofType:nil];
        NSData *data = [[NSData alloc]initWithContentsOfFile:path];
        NSArray *proArr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSMutableArray *tempArr = [NSMutableArray array];
        for (NSDictionary *dict in proArr) {
            ProvinceModel *proModel = [ProvinceModel initWithDict:dict];
            [tempArr addObject:proModel];
        }
        _provinceArr = tempArr;
    }
    return _provinceArr;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    // 初始化
    self.inputView = self.pickView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化
        self.inputView = self.pickView;
    }
    return self;
}

#pragma mark - 协议方法
// 一共多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

// 每一列多少行
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (0 == component) {
         //NSLog(@"第0列有 %zd行",self.provinceArr.count);
        return self.provinceArr.count;
    }else if(1 == component){
        // 当前选中省份决定，当前省份有多少城市
        ProvinceModel *proModel = self.provinceArr[self.proIndex];
        //NSLog(@"第一列有 %zd 行",proModel.list.count);
        if (proModel.list.count != 0) {
            return proModel.list.count;
        }else{
            return 1;
        }
    }else {
        ProvinceModel *proModel = self.provinceArr[self.proIndex];
        if (proModel.list.count != 0) {
            CityModel *cityModel = proModel.list[self.cityIndex];
            //NSLog(@"第二列有 %zd 行",cityModel.list.count);
            if (cityModel.list.count != 0) {
                return cityModel.list.count;
            }else{
                return 1;
            }
        }else{
            return 1;
        }
        
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (0 == component) {
        self.proIndex = row;
        // 第一列选中第一行
        [pickerView selectRow:0 inComponent:1 animated:true];
        // 第二列选中第一行
        [pickerView selectRow:0 inComponent:2 animated:true];
        // 刷新数据
        [pickerView reloadAllComponents]; // 省选择后， 刷新市、区
        
    }else if (1 == component){
        self.cityIndex = row;
        // 第二列选中第一行
        [pickerView selectRow:0 inComponent:2 animated:true];
        [pickerView reloadComponent:2]; // 市选择后， 刷新区
    }
    ProvinceModel *proModel = self.provinceArr[self.proIndex]; // 省份
    if (proModel.list.count != 0) { // 说明有市
        CityModel *cityModel = proModel.list[self.cityIndex];
        if (cityModel.list.count != 0) { // 说明有 省 市 区
            NSInteger ereaIndex = [pickerView selectedRowInComponent:2];
            AreaModel *area = cityModel.list[ereaIndex];
            self.text = [NSString stringWithFormat:@"%@ %@ %@",proModel.name,cityModel.name,area.name];
        }else{ // 说明只有 省 市
            self.text = [NSString stringWithFormat:@"%@ %@",proModel.name,cityModel.name];
        }
    }else{
        self.text = [NSString stringWithFormat:@"%@",proModel.name];
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (0 == component) {
        ProvinceModel *proModel = self.provinceArr[row];
        //NSLog(@"省名称------> %@",proModel.name);
        return proModel.name;
    }else if (1 == component){
        ProvinceModel *proModel = self.provinceArr[self.proIndex];
        if (proModel.list.count != 0) {
            CityModel *cityModel = proModel.list[row];
            return cityModel.name;
        }else{
            return @"没有市区";
        }
        
    }else{
        ProvinceModel *proModel = self.provinceArr[self.proIndex];
        if (proModel.list.count != 0) {
            CityModel *cityModel = proModel.list[self.cityIndex];
            if (cityModel.list.count != 0) {
                AreaModel *areaModel = cityModel.list[row];
                return areaModel.name;
            }
        }
        return @"没有城区";
    }
}

@end




















