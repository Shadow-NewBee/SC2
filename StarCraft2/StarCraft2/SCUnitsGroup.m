//
//  SCUnitsGroup.m
//  StarCraft2
//
//  Created by xiaoT on 15/10/20.
//  Copyright © 2015年 赖三聘. All rights reserved.
//

#import "SCUnitsGroup.h"
#import "SCUnits.h"

@implementation SCUnitsGroup

-(instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+(instancetype)uinitGroupWithDic:(NSDictionary *)dic
{
    return [[self alloc]initWithDic:dic];
}

+(NSMutableArray *)unitGroupList
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Terran_List.plist" ofType:nil];
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSDictionary *dic in dicArray) {
        SCUnitsGroup *unitGroup = [SCUnitsGroup uinitGroupWithDic:dic];
        
        NSMutableArray *tempUnitArray = [NSMutableArray array];
        for (NSDictionary *dic in unitGroup.units) {
            SCUnits *unit = [SCUnits UnitsWithDic:dic];
            [tempUnitArray addObject:unit];
        }
        unitGroup.units = tempUnitArray;
        
        [tempArray addObject:unitGroup];
    }
    return tempArray;
}

@end
