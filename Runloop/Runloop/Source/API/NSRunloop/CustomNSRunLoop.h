//
//  CustomNSRunLoop.h
//  Runloop
//
//  Created by kaoji on 1/17/23.
//

#import <Foundation/Foundation.h>

@interface CustomNSRunLoop : NSObject

- (void)createAndRunCustomRunLoop;
- (void)createAndAddCustomInputSource;
- (void)createAndAddTimerSource;
- (void)createAndAddRunLoopObserver;

@end
