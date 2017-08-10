//
//  YQProxy.m
//  NSProxyTest
//
//  Created by maygolf on 2017/8/10.
//  Copyright © 2017年 yiquan. All rights reserved.
//

#import "YQProxy.h"

@interface YQProxy ()

@property (nonatomic, strong) id targete;   // 实际调用方法的对象
@property (nonatomic, strong) NSMutableDictionary<NSValue *, YQProxyBlock> *preBlocks;  // 目标方法调用之前调用的block
@property (nonatomic, strong) NSMutableDictionary<NSValue *, YQProxyBlock> *sufBlocks;  // 目标方法调用之后调用的block

@end

@implementation YQProxy

+ (id)proxyWithTarget:(id)target{
    YQProxy *proxy = [YQProxy alloc];
    
    proxy.targete = target;
    proxy.preBlocks = [NSMutableDictionary dictionary];
    proxy.sufBlocks = [NSMutableDictionary dictionary];
    
    return proxy;
}

#pragma mark - override
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    return [self.targete methodSignatureForSelector:sel];
}

// 进行消息转发
- (void)forwardInvocation:(NSInvocation *)invocation{
    
    if (![self.targete respondsToSelector:invocation.selector]) {
        return;
    }
    
    NSValue *method = [NSValue valueWithPointer:invocation.selector];
    
    YQProxyBlock preBlock = [self.preBlocks objectForKey:method];
    YQProxyBlock sufBlock = [self.sufBlocks objectForKey:method];
    
    if (preBlock) {
        preBlock(self.targete, invocation);
    }
    
    [invocation invokeWithTarget:self.targete];
    
    if (sufBlock) {
        sufBlock(self.targete, invocation);
    }
}

#pragma mark - public

- (void)registerSelector:(SEL)selector withPreBlock:(YQProxyBlock)preBlock sufBlock:(YQProxyBlock)sufBlock{
    NSValue *method = [NSValue valueWithPointer:selector];
    
    if (preBlock) {
        [self.preBlocks setObject:preBlock forKey:method];
    }else if ([self.preBlocks objectForKey:method]){
        [self.preBlocks removeObjectForKey:method];
    }
    
    if (sufBlock) {
        [self.sufBlocks setObject:sufBlock forKey:method];
    }else if ([self.sufBlocks objectForKey:method]){
        [self.sufBlocks removeObjectForKey:method];
    }
    
}

@end
