//
//  HJXLSManager.h
//  hj
//
//  Created by jian huang on 2017/6/15.
//  Copyright © 2017年 hj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HJXLSTitleModle.h"

@interface HJXLSManager : NSObject

/**
 *  @Author 黄坚, 2017-3-17 9:00:00
 *
 *  生成Excel文件
 *
 *  @param titles 标题字典 value为标题名 key标题对应模型modle中的key
 *  @param datas 数据模型数组
 *
 *  @return BOOL 生成是否成功
 */

+(BOOL)createXLSFileTitles:(NSArray <HJXLSTitleModle *>*)titles datas:(NSArray *)datas fileName:(NSString *)name;

/**
 *  @Author 黄坚, 2017-3-17 9:00:00
 *
 *  通过名字获取ecel文件
 *
 *
 *  @return excel文件data数据
 */
+(NSData *)XLSFileWithFileName:(NSString *)Name;

+(NSString *)xlsFilePath;


@end
