//
//  HJXLSTitleModle.m
//  hj
//
//  Created by jian huang on 2017/6/15.
//  Copyright © 2017年 hj. All rights reserved.
//

#import "HJXLSTitleModle.h"

@implementation HJXLSTitleModle
-(instancetype)initWithName:(NSString *)name key:(NSString *)key{
    if (self = [super init]) {
        self.name = name;
        self.key = key;
    }
    return self;
}

-(NSString *)name{
    if (!_name) {
        return @"null";
    }
    return _name;
}

-(NSString *)key{
    if (!_key) {
        return @"null";
    }
    return _key;
}


@end
