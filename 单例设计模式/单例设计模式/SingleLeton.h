//
//  SingleLeton.h
//  单例设计模式
//
//  Created by joe on 2016/11/1.
//  Copyright © 2016年 joe. All rights reserved.
//  实现单例设计模式

//.h 文件的视线
#define SingleLetonH(methodName) + (instancetype)share##methodName;

//.m 文件的视线

#if __has_feature(objc_arc)

#define SingleLetonM(methodName) \
static id _instance = nil;\
+ (instancetype)allocWithZone:(struct _NSZone *)zone{\
    if (_instance == nil) {\
        static dispatch_once_t onceToken;\
        dispatch_once(&onceToken, ^{\
            _instance = [super allocWithZone:zone];\
        });\
    }\
    return _instance;\
}\
\
- (instancetype)init\
{\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        _instance = [super init];\
    });\
    return _instance;\
}\
\
+ (instancetype)share##methodName\
{\
    return [[self alloc] init];\
}
#else

#define SingleLetonM(methodName) \
static id _instance = nil;\
+ (instancetype)allocWithZone:(struct _NSZone *)zone{\
if (_instance == nil) {\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [super allocWithZone:zone];\
});\
}\
return _instance;\
}\
\
- (instancetype)init\
{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [super init];\
});\
return _instance;\
}\
\
+ (instancetype)share##methodName\
{\
return [[self alloc] init];\
}\
\
- (oneway void)release\
{\
\
}\
\
- (instancetype)retain\
{\
return self;\
}\
\
- (NSUInteger)retainCount\
{\
return 1;\
}

#endif
