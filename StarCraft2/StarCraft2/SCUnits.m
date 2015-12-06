//
//  SCUnits.m
//  StarCraft2
//
//  Created by xiaoT on 15/10/20.
//  Copyright © 2015年 赖三聘. All rights reserved.
//

#import "SCUnits.h"

@implementation SCUnits

-(instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+(instancetype)UnitsWithDic:(NSDictionary *)dic
{
    return [[self alloc]initWithDic:dic];
}
@end
