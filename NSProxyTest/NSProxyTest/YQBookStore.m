//
//  YQBookStore.m
//  NSProxyTest
//
//  Created by maygolf on 2017/8/10.
//  Copyright © 2017年 yiquan. All rights reserved.
//

#import "YQBookStore.h"

@implementation YQBookStore

- (void)buyBookWithTitle:(NSString *)title{
    if (!title) {
        NSLog(@"请确定书名");
        return;
    }
    NSLog(@"这是您好的书：%@", title);
}

@end
