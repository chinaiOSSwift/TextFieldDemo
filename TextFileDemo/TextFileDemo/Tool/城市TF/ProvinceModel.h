//
//  ProvinceModel.h
//  TextFileDemo
//
//  Created by SPARKWYY on 2017/10/12.
//  Copyright © 2017年 SKOrganization. All rights reserved.
//

#import <Foundation/Foundation.h>

// 省份模型
@interface ProvinceModel : NSObject
/**
 当前省份的城市
 */
@property (nonatomic, strong)NSArray *list;
/**
 省份的名称
 */
@property (nonatomic, strong)NSString *name;
/**
 省份的邮编
 */
@property (nonatomic, strong)NSNumber *code;
/**
 快速的把字典转化为模型
 */
+ (instancetype)initWithDict:(NSDictionary *)dict;
@end


// 市区模型
@interface CityModel : NSObject

/**
 城市的名字
 */
@property (nonatomic, strong) NSString *name;

/**
 当前城市列表
 */
@property (nonatomic, strong) NSArray *list;

/**
 当前城市ID
 */
@property (nonatomic, strong) NSNumber *fid;

/**
 当前城市的邮编
 */
@property (nonatomic, strong) NSNumber *code;

+ (instancetype)initWith:(NSDictionary *)dict;
@end

// 市区中的城区模型
@interface AreaModel : NSObject

/**
 城区的名字
 */
@property (nonatomic, strong) NSString *name;

/**
 城区的ID
 */
@property (nonatomic, strong) NSNumber *fid;

/**
 城区的邮编
 */
@property (nonatomic, strong) NSNumber *code;


+ (instancetype)initWithCityModel:(NSDictionary *)dict;

@end



