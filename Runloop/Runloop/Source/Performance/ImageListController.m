//
//  ImageListController.m
//  Runloop
//
//  Created by kaoji on 1/17/23.
//

#import "ImageListController.h"
#import "RunLoopImageCell.h"

@interface ImageListController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<NSURL *> *imageURLs;

@end

@implementation ImageListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    [self prepareImageURLs];
}

- (void)setupTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 200;
    [self.tableView registerClass:[RunLoopImageCell class] forCellReuseIdentifier:@"RunLoopImageCell"];
    [self.view addSubview:self.tableView];
}

- (void)prepareImageURLs {
    NSMutableArray *urls = [NSMutableArray array];
    for (int i = 0; i < 100; i++) {
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://img2.baidu.com/it/u=4016890413,495873028&fm=253&fmt=auto&app=120&f=JPEG?w=667&h=500"]];
        [urls addObject:url];
    }
    self.imageURLs = [urls copy];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.imageURLs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RunLoopImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RunLoopImageCell" forIndexPath:indexPath];
    [cell setImageURL:self.imageURLs[indexPath.row]];
    return cell;
}

@end
