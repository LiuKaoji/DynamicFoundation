//
//  ViewController.m
//  Runloop
//
//  Created by kaoji on 1/17/23.
//

#import "ViewController.h"
#import "ImageListController.h"
#import "DemoRunnerController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)onClickAPIDemo:(id)sender {
    DemoRunnerController *apiVC = [[DemoRunnerController alloc] initWithNibName:@"DemoRunnerController" bundle:nil];
    [self presentViewController:apiVC animated:YES completion:nil];

}

- (IBAction)onClickPerformanceDemo:(id)sender {
    ImageListController *imageListVC = [[ImageListController alloc] init];
    [self presentViewController:imageListVC animated:YES completion:nil];
}

@end
