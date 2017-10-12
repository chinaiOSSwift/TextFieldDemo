//
//  FlagItemModel.m
//  TextFileDemo
//
//  Created by SPARKWYY on 2017/10/11.
//  Copyright © 2017年 SKOrganization. All rights reserved.
//

#import "FlagItemModel.h"

@implementation FlagItemModel

+(instancetype)initWithDict:(NSDictionary *)dict{
    FlagItemModel *model = [[FlagItemModel alloc]init];
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [model setValue:obj forKeyPath:key];// KVC方法
    }];
    return model;
}

//这里利用KCV的特性
- (void)setIcon:(UIImage *)icon{
    NSString *imageName = (NSString *)icon;
    _icon = [UIImage imageNamed:imageName];
}
/**
 setValue: forKeyPath: 实现原理
 1.先查看有没有对应的set方法, 如果有set方法,就会调用set方法,给对应的属性赋值;
 2.如果没有set方法,去查看有没有跟key值相同并且带有下划线(_)的成员属性,如果有的话,就给带有下划线(_)的成员属性赋值
 3.如果没有跟key值相同并且带有下划线(_)的成员属性,还会去找有没有跟key值相同名称的成员属性,如果有,就给它赋值.
 4.以上情况都没有,就直接崩溃
 */


@end
