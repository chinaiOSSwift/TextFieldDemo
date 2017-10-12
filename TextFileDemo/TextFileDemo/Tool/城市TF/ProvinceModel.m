//
//  ProvinceModel.m
//  TextFileDemo
//
//  Created by SPARKWYY on 2017/10/12.
//  Copyright © 2017年 SKOrganization. All rights reserved.
//

#import "ProvinceModel.h"

@implementation ProvinceModel
+ (instancetype)initWithDict:(NSDictionary *)dict{
    ProvinceModel *provinceModel = [[ProvinceModel alloc]init];
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [provinceModel setValue:obj forKeyPath:key];
    }];
    return provinceModel;
}

- (void)setList:(NSArray *)list{
    NSMutableArray *tempArr = [NSMutableArray array];
    for (NSDictionary *dict in list) {
        CityModel *cityModel = [CityModel initWith:dict];
        [tempArr addObject:cityModel];
    }
    _list = tempArr;
}

@end

@implementation CityModel

+ (instancetype)initWith:(NSDictionary *)dict{
    CityModel *cityModel = [[CityModel alloc]init];
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [cityModel setValue:obj forKeyPath:key];
    }];
    return cityModel;
}

- (void)setList:(NSArray *)list{
    NSMutableArray *tempArr = [NSMutableArray array];
    for (NSDictionary *dict in list) {
        AreaModel *areaModel = [AreaModel initWithCityModel:dict];
        [tempArr addObject:areaModel];
    }
    _list = tempArr;
}
@end


@implementation AreaModel

+ (instancetype)initWithCityModel:(NSDictionary *)dict{
    AreaModel *areaModel = [[AreaModel alloc]init];
    [areaModel setValuesForKeysWithDictionary:dict];
    return areaModel;
}
@end




















