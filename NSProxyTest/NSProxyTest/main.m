//
//  main.m
//  NSProxyTest
//
//  Created by maygolf on 2017/8/9.
//  Copyright © 2017年 yiquan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "YQProxy.h"
#import "YQStoreProxy.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        id array = [YQProxy proxyWithTarget:[NSMutableArray array]];
        [array registerSelector:@selector(addObject:) withPreBlock:^(id targete, NSInvocation *selector) {
            NSLog(@"%@:准备插入一个数据到数组中", targete);
        } sufBlock:^(id targete, NSInvocation * selector) {
            NSLog(@"%@:插入数据完成", targete);
        }];
        
        id string = [YQProxy proxyWithTarget:[NSMutableString stringWithString:@"hello"]];
        [string registerSelector:@selector(appendString:) withPreBlock:^(id targete, NSInvocation *selector) {
            NSLog(@"%@:正在追加字符串", targete);
        } sufBlock:^(id targete, NSInvocation * selector) {
            NSLog(@"%@:追加字符串完成", targete);
        }];
        
        
        [array addObject:@"你好"];
        [string appendString:@", world!"];
        
        
        id store = [[YQStoreProxy alloc] init];
        [store buyBookWithTitle:@"鬼吹灯"];
        [store buyCloths];
    }
    return 0;
}
