//
//  CustomNSRunLoop.m
//  Runloop
//
//  Created by kaoji on 1/17/23.
//

#import "CustomNSRunLoop.h"

#import "CustomNSRunLoop.h"

@interface CustomNSRunLoop ()

@property (nonatomic, strong) NSRunLoop *customRunLoop;
@property (nonatomic, strong) NSPort *customInputSource;
@property (nonatomic, strong) NSTimer *timerSource;

@end

@implementation CustomNSRunLoop

- (void)createAndRunCustomRunLoop {
    self.customRunLoop = [NSRunLoop currentRunLoop];
}

- (void)createAndAddCustomInputSource {
    self.customInputSource = [NSPort port];
    [self.customRunLoop addPort:self.customInputSource forMode:NSRunLoopCommonModes];
}

- (void)createAndAddTimerSource {
    self.timerSource = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerSourceFired) userInfo:nil repeats:YES];
    [self.customRunLoop addTimer:self.timerSource forMode:NSRunLoopCommonModes];
}

- (void)timerSourceFired {
    NSLog(@"Timer source fired");
}

- (void)createAndAddRunLoopObserver {
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
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
    });
    CFRunLoopAddObserver(self.customRunLoop.getCFRunLoop, observer, kCFRunLoopCommonModes);
}

@end
