//
//  DemoRunner.m
//  Runloop
//
//  Created by kaoji on 1/17/23.
//

#import "DemoRunner.h"
#import "CustomNSRunLoop.h"
#import "CustomCFRunLoop.h"

@implementation DemoRunner

- (void)runCustomNSRunLoopDemo {
    CustomNSRunLoop *customNSRunLoop = [[CustomNSRunLoop alloc] init];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [customNSRunLoop createAndRunCustomRunLoop];
        [customNSRunLoop createAndAddCustomInputSource];
        [customNSRunLoop createAndAddTimerSource];
        [customNSRunLoop createAndAddRunLoopObserver];
        
        [[NSRunLoop currentRunLoop] run];
    });
}

- (void)runCustomCFRunLoopDemo {
    CustomCFRunLoop *customCFRunLoop = [[CustomCFRunLoop alloc] init];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [customCFRunLoop createAndRunCustomRunLoop];
        [customCFRunLoop createAndAddCustomInputSource];
        [customCFRunLoop createAndAddTimerSource];
        [customCFRunLoop createAndAddRunLoopObserver];
        
        CFRunLoopRun();
    });
}

@end
