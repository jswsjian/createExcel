//
//  HJXLSManager.m
//  hj
//
//  Created by jian huang on 2017/6/15.
//  Copyright © 2017年 hj. All rights reserved.
//

#import "HJXLSManager.h"

@implementation HJXLSManager

+(NSString *)xlsFilePath{
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *xlsDirPath = [documentPath stringByAppendingPathComponent:@"xlsFile"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:xlsDirPath]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:xlsDirPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return xlsDirPath;
}



+(BOOL)createXLSFileTitles:(NSArray <HJXLSTitleModle *>*)titles datas:(NSArray *)datas fileName:(NSString *)name{
    if (!titles) {
        return NO;
    }
    NSString *fileName = name?[name stringByAppendingString:@".xls"]:@"excel.xls";
    NSMutableArray *xlsDataMuArr = [NSMutableArray array];
    //插入标题
    for (HJXLSTitleModle *modle in titles) {
        [xlsDataMuArr addObject:modle.name];
        //插入制表符
        [xlsDataMuArr addObject:@"\t"];
    }
    //插入数据
    [xlsDataMuArr replaceObjectAtIndex:xlsDataMuArr.count-1 withObject:@"\n"];//换行
    for (id subData in datas) {
        for (HJXLSTitleModle *modle in titles) {
            NSString *objectString = [subData valueForKey:modle.key];
            [xlsDataMuArr addObject:[self XLSString:objectString]];
            [xlsDataMuArr addObject:@"\t"];
        }
        [xlsDataMuArr replaceObjectAtIndex:xlsDataMuArr.count-1 withObject:@"\n"];
    }
    NSString *xlsString = [xlsDataMuArr componentsJoinedByString:@""];
    NSData *xlsData = [xlsString dataUsingEncoding:NSUTF16StringEncoding];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager createFileAtPath:[[self xlsFilePath] stringByAppendingPathComponent:fileName] contents:xlsData attributes:nil];
}

+(NSString *)XLSString:(NSString *)string{
    return string?:@"null";
}

+(NSData *)XLSFileWithFileName:(NSString *)Name{
    NSString *filePath = [[self xlsFilePath] stringByAppendingPathComponent:[Name stringByAppendingString:@".xls"]];
    return [[NSData alloc] initWithContentsOfFile:filePath];
}

@end
