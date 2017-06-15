//
//  HJXLSTitleModle.h
//  hj
//
//  Created by jian huang on 2017/6/15.
//  Copyright © 2017年 hj. All rights reserved.
//

#import "HJBasicModle.h"

@interface HJXLSTitleModle : HJBasicModle
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *key;

-(instancetype)initWithName:(NSString *)name key:(NSString *)key;
@end
