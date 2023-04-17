//
//  DemoRunnerController.m
//  Runloop
//
//  Created by kaoji on 1/17/23.
//

#import "DemoRunnerController.h"
#import "DemoRunner.h"

@interface DemoRunnerController ()
@property (nonatomic, strong) DemoRunner *demoRunner;

@end

@implementation DemoRunnerController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.demoRunner = [[DemoRunner alloc] init];
    
 
}

/*
在两个不同的线程中运行CustomNSRunLoop和CustomCFRunLoop。
演示的效果是，我们将看到定时器源和自定义输入源在自定义RunLoop中被触发，同时观察者监控RunLoop的状态变化。
这将帮助您理解如何使用NSRunLoop和CFRunLoop来创建自定义的RunLoop，并向其添加不同类型的源和观察者。
这种方法在处理后台任务、处理异步事件或优化应用程序性能方面非常有用。
 */

- (IBAction)onClickNSRunloop:(id)sender {
    [self.demoRunner runCustomNSRunLoopDemo];
}

- (IBAction)onClickCFRunloop:(id)sender {
    [self.demoRunner runCustomCFRunLoopDemo];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
