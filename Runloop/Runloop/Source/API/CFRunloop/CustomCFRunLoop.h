//
//  CustomCFRunLoop.h
//  Runloop
//
//  Created by kaoji on 1/17/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 CustomCFRunLoop 类展示了如何使用 CFRunLoop 创建自定义 RunLoop、添加自定义输入源、创建定时器源，以及使用观察者监控 RunLoop 状态。

 CFRunLoop 是 Core Foundation 框架提供的 RunLoop 实现，与 NSRunLoop 具有相似的功能。在实际应用中，CFRunLoop 和 NSRunLoop 之间可以相互转换，它们底层共享相同的实现。
 */
@interface CustomCFRunLoop : NSObject

/**
 创建并运行一个自定义的 CFRunLoop。
 
为当前线程创建一个新的 CFRunLoop 实例。
在实际开发中，您可能需要在子线程中创建一个 RunLoop 来处理特定的任务，如网络请求、定时任务等。
 */
- (void)createAndRunCustomRunLoop;

/**
 创建并添加一个自定义输入源到自定义的 CFRunLoop 中。
 
创建一个 CFRunLoopSource 实例作为自定义输入源
 并将其添加到自定义的 CFRunLoop 中。
 输入源是 RunLoop 的事件来源之一，
 它可以用于处理来自其他线程或进程的事件。
 */
- (void)createAndAddCustomInputSource;

/**
 创建并添加一个定时器源到自定义的 CFRunLoop 中。
 
创建一个 CFRunLoopTimer 实例作为定时器源，并将其添加到自定义的 CFRunLoop 中。
定时器源是 RunLoop 的事件来源之一，它可以用于周期性地触发事件。
 */
- (void)createAndAddTimerSource;

/**
 创建并添加一个观察者以监控自定义 CFRunLoop 的状态。
 
使用 CFRunLoopObserver 监控 CFRunLoop 的状态变化。
 观察者可以用于在特定的 RunLoop 事件发生时执行特定的任务，
 例如在 RunLoop 进入休眠之前执行一些清理工作。
 */
- (void)createAndAddRunLoopObserver;

@end

NS_ASSUME_NONNULL_END
