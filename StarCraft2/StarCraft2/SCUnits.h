//
//  SCUnits.h
//  StarCraft2
//
//  Created by xiaoT on 15/10/20.
//  Copyright © 2015年 赖三聘. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCUnits : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *name;

-(instancetype)initWithDic:(NSDictionary *)dic;
+(instancetype)UnitsWithDic:(NSDictionary *)dic;


@end
