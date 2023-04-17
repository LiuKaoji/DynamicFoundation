//
//  RunLoopImageCell.m
//  Runloop
//
//  Created by kaoji on 1/17/23.
//

#import "RunLoopImageCell.h"
#import "ImageLoader.h"

@interface RunLoopImageCell ()

@property (nonatomic, strong) UIImageView *asyncImageView;
@property (nonatomic, strong) ImageLoader *imageLoader;
@property (nonatomic, strong) NSURL *currentImageURL;

@end

@implementation RunLoopImageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.asyncImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    self.asyncImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.asyncImageView.clipsToBounds = YES;
    [self.contentView addSubview:self.asyncImageView];
    
    self.imageLoader = [[ImageLoader alloc] init];
}

- (void)setImageURL:(NSURL *)url {
    // 取消当前图片的加载
    if (self.currentImageURL) {
        [self.imageLoader cancelLoadingImageWithURL:self.currentImageURL];
    }
    
    self.currentImageURL = url;
    
    // 使用 RunLoop 优化图片加载
    CFRunLoopRef currentRunLoop = CFRunLoopGetCurrent();
    CFRunLoopPerformBlock(currentRunLoop, kCFRunLoopDefaultMode, ^{
        [self.imageLoader loadImageWithURL:url completion:^(UIImage * _Nullable image, NSError * _Nullable error) {
            if (!error) {
                self.asyncImageView.image = image;
            }
        }];
    });
    CFRunLoopWakeUp(currentRunLoop);
}
- (void)layoutSubviews{
    self.asyncImageView.frame = self.bounds;
}
@end
