//
//  CustomCFRunLoop.m
//  Runloop
//
//  Created by kaoji on 1/17/23.
//

#import "CustomCFRunLoop.h"

@interface CustomCFRunLoop ()

@property (nonatomic, assign) CFRunLoopRef customRunLoop;

@end

@implementation CustomCFRunLoop

// 创建并运行一个自定义的 CFRunLoop。
- (void)createAndRunCustomRunLoop {
    self.customRunLoop = CFRunLoopGetCurrent();
}

// 创建并添加一个自定义输入源到自定义的 CFRunLoop 中。
- (void)createAndAddCustomInputSource {
    // 定义输入源的上下文
    CFRunLoopSourceContext sourceContext = {
        .version = 0,
        .info = NULL,
        .retain = NULL,
        .release = NULL,
        .copyDescription = NULL,
        .equal = NULL,
        .hash = NULL,
        .schedule = NULL,
        .cancel = NULL,
        .perform = &inputSourceCallback
    };
    
    // 创建输入源
    CFRunLoopSourceRef source = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &sourceContext);
    
    // 将输入源添加到自定义RunLoop中
    CFRunLoopAddSource(self.customRunLoop, source, kCFRunLoopDefaultMode);
    
}

// 输入源回调函数
void inputSourceCallback(void *info) {
    NSLog(@"Input source callback triggered");
}

// 创建并添加一个定时器源到自定义的 CFRunLoop 中。
-(void)createAndAddTimerSource {
    // 创建计时器源
    CFRunLoopTimerRef timer = CFRunLoopTimerCreate(kCFAllocatorDefault, CFAbsoluteTimeGetCurrent() + 1.0, 1.0, 0, 0, &timerCallback, NULL);
    // 将计时器源添加到自定义RunLoop中
    CFRunLoopAddTimer(self.customRunLoop, timer, kCFRunLoopDefaultMode);
}

// 计时器回调函数
void timerCallback(CFRunLoopTimerRef timer, void *info) {
    NSLog(@"Timer callback triggered");
}

// 创建并添加一个观察者以监控自定义 CFRunLoop 的状态。
-(void)createAndAddRunLoopObserver {
    // 创建RunLoop观察者
    CFRunLoopObserverRef observer = CFRunLoopObserverCreate(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, &runLoopObserverCallback, NULL);
    // 将观察者添加到自定义RunLoop中
    CFRunLoopAddObserver(self.customRunLoop, observer, kCFRunLoopDefaultMode);
}

// RunLoop观察者回调函数
void runLoopObserverCallback(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
    switch (activity) {
        case kCFRunLoopEntry:
            NSLog(@"RunLoop entered");
            break;
        case kCFRunLoopBeforeTimers:
            NSLog(@"RunLoop before timers");
            break;
        case kCFRunLoopBeforeSources:
            NSLog(@"RunLoop before sources");
            break;
        case kCFRunLoopBeforeWaiting:
            NSLog(@"RunLoop before waiting");
            break;
        case kCFRunLoopAfterWaiting:
            NSLog(@"RunLoop after waiting");
            break;
        case kCFRunLoopExit:
            NSLog(@"RunLoop exited");
            break;
        default:
            break;
    }
}

@end
