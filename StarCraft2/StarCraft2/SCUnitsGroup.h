//
//  SCUnitsGroup.h
//  StarCraft2
//
//  Created by xiaoT on 15/10/20.
//  Copyright © 2015年 赖三聘. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCUnitsGroup : NSObject

@property(nonatomic, copy) NSString *title;
@property(nonatomic, strong) NSArray *units;

-(instancetype)initWithDic:(NSDictionary *)dic;
+(instancetype)uinitGroupWithDic:(NSDictionary *)dic;

+(NSMutableArray *)unitGroupList;
@end
