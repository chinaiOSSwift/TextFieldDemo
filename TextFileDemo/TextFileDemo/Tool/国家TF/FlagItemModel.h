//
//  FlagItemModel.h
//  TextFileDemo
//
//  Created by SPARKWYY on 2017/10/11.
//  Copyright © 2017年 SKOrganization. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface FlagItemModel : NSObject
@property (nonatomic, copy)NSString *name;
@property (nonatomic, strong) UIImage *icon; // 需要导入 #import <UIKit/UIKit.h>

+ (instancetype)initWithDict:(NSDictionary *)dict;
@end
