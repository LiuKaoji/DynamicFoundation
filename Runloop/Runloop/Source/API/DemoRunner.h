//
//  DemoRunner.h
//  Runloop
//
//  Created by kaoji on 1/17/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 DemoRunner 类是一个封装了 CustomNSRunLoop 和 CustomCFRunLoop 示例代码的工具类。
 
 通过本类的方法，您可以学习并了解如何使用 NSRunLoop 和 CFRunLoop。
 */
@interface DemoRunner : NSObject

/**
 运行 CustomNSRunLoop 的示例。
 
 本方法展示了如何使用 NSRunLoop 创建自定义 RunLoop、添加自定义输入源、创建定时器源，以及使用观察者监控 RunLoop 状态。
 */
- (void)runCustomNSRunLoopDemo;

/**
 运行 CustomCFRunLoop 的示例。
 
 本方法展示了如何使用 CFRunLoop 创建自定义 RunLoop、添加自定义输入源、创建定时器源，以及使用观察者监控 RunLoop 状态。
 */
- (void)runCustomCFRunLoopDemo;

@end

NS_ASSUME_NONNULL_END
