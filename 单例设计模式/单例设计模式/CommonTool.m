//
//  CommonTool.m
//  单例设计模式
//
//  Created by joe on 2016/11/1.
//  Copyright © 2016年 joe. All rights reserved.
//

#import "CommonTool.h"

@implementation CommonTool

//全局变量，不让别人访问
static CommonTool *_commonTool = nil;

/**
 *  建议重写 allocWithZone, 因为alloc方法内部会调用allocWithZone, 所以可以拦截所有的内存分配
 *  zone : 系统分配给app的内存
 */
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    if (_commonTool == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{//  安全（这个代码只会被调用一次）
            _commonTool = [super allocWithZone:zone];
        });
    }
    return _commonTool;
}

- (instancetype)init
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _commonTool = [super init];
    });
    return _commonTool;
}

+ (instancetype)shareCommonTool
{
    return [[self alloc] init];
}

- (oneway void)release
{

}

- (instancetype)retain
{
    return self;
}

- (NSUInteger)retainCount
{
    return 1;
}
@end
