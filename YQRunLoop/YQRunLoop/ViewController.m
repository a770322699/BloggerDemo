//
//  ViewController.m
//  YQRunLoop
//
//  Created by maygolf on 17/1/18.
//  Copyright © 2017年 yiquan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

//@property (nonatomic, strong) NSTimer *timer;
//@property (nonatomic, strong) NSMutableArray *tasks;
//@property (nonatomic, assign) NSInteger maxTaskNumber;

@end

//void callBack(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info){
//    ViewController *VC = (__bridge ViewController *)(info);
//    if (VC.tasks.count) {
//        void(^task)() = [VC.tasks firstObject];
//        task();
//        [VC.tasks removeObject:task];
//    }
//}

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self addRunloopOvserver];
    
//    self.maxTaskNumber = 20;
//    self.tasks = [NSMutableArray array];
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"timer");
//    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)addRunloopOvserver{
//    CFRunLoopRef runloop = CFRunLoopGetCurrent();
//    CFRunLoopObserverContext context = {0, (__bridge void *)self, &CFRetain, &CFRelease};
//    CFRunLoopObserverRef observer = CFRunLoopObserverCreate(NULL, kCFRunLoopBeforeWaiting, YES, 0, &callBack, &context);
//    CFRunLoopAddObserver(runloop, observer , kCFRunLoopDefaultMode);
//    CFRelease(observer);
//}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identity" forIndexPath:indexPath];
    
    for (int i = 1; i < 4; i++) {
        UIImageView *imageView = [cell.contentView viewWithTag:i];
        [imageView removeFromSuperview];
    }
    
    for (int i = 1; i < 4; i++) {
        
        CGFloat leading = 10, space = 20, width = 103, height = 87, top = 15;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((i - 1) * (width + space) + leading, top, width, height)];
        [cell.contentView addSubview:imageView];
        imageView.tag = i;
        imageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"image" ofType:@"png"]];
        
//        void(^task)() = ^{
//            CGFloat leading = 10, space = 20, width = 103, height = 87, top = 15;
//            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((i - 1) * (width + space) + leading, top, width, height)];
//            [cell.contentView addSubview:imageView];
//            imageView.tag = i;
//            imageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"image" ofType:@"png"]];
//        };
//        [self.tasks addObject:task];
//        if (self.tasks.count == self.maxTaskNumber) {
//            [self.tasks removeObjectAtIndex:0];
//        }
    }
    return cell;
}

@end
