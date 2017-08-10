//
//  YQProxy.h
//  NSProxyTest
//
//  Created by maygolf on 2017/8/10.
//  Copyright © 2017年 yiquan. All rights reserved.
//

#import <Foundation/Foundation.h>

// 定义一个需要调用的block
typedef void(^YQProxyBlock)(id targete, NSInvocation *invocation);

@interface YQProxy : NSProxy

// 创建代理
+ (id)proxyWithTarget:(id)target;

// 对某个方法注册相应的block
- (void)registerSelector:(SEL)selector withPreBlock:(YQProxyBlock)preBlock sufBlock:(YQProxyBlock)sufBlock;

@end
