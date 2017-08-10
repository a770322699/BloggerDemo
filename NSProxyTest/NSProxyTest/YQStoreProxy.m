//
//  YQStoreProxy.m
//  NSProxyTest
//
//  Created by maygolf on 2017/8/10.
//  Copyright © 2017年 yiquan. All rights reserved.
//

#import "YQStoreProxy.h"

@interface YQStoreProxy ()

@property (nonatomic, strong) YQBookStore *bookStore;
@property (nonatomic, strong) YQClothesStore *clothesStore;

@end

@implementation YQStoreProxy

- (instancetype)init{
    _bookStore = [[YQBookStore alloc] init];
    _clothesStore = [[YQClothesStore alloc] init];
    
    return self;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    return [[self targetWithSeletor:sel] methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation{
    [invocation invokeWithTarget:[self targetWithSeletor:invocation.selector]];
}

#pragma mark - private
- (id)targetWithSeletor:(SEL)selector{
    if ([self.bookStore respondsToSelector:selector]) {
        return self.bookStore;
    }else if ([self.clothesStore respondsToSelector:selector]){
        return self.clothesStore;
    }
    
    return nil;
}

@end
