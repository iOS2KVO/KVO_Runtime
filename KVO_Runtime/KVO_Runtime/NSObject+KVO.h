//
//  NSObject+KVO.h
//  KVO_Runtime
//
//  Created by  ZhuHong on 2018/1/2.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

/* 为了学习自定义KVO而做的一个小实验,  并非造轮子, 只是为了学些而已
 我是copy大神的代码, 请参考原文: http://www.cocoachina.com/ios/20150313/11321.html
 感谢大神
 
 
 在原来的基础上, 支持NSIinter数据类型的监听 [偷笑中...]
 */

#import <Foundation/Foundation.h>

typedef void(^PGObservingBlock)(id observedObject, NSString *observedKey, id oldValue, id newValue);

@interface NSObject (KVO)

- (void)PG_addObserver:(NSObject *)observer
                forKey:(NSString *)key
             withBlock:(PGObservingBlock)block;

- (void)PG_removeObserver:(NSObject *)observer forKey:(NSString *)key;

@end
