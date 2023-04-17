//
//  ImageLoader.m
//  Runloop
//
//  Created by kaoji on 1/17/23.
//

#import "ImageLoader.h"

@interface ImageLoader ()

@property (nonatomic, strong) NSMutableDictionary<NSURL *, NSURLSessionDataTask *> *dataTasks;

@end

@implementation ImageLoader

- (instancetype)init {
    self = [super init];
    if (self) {
        _dataTasks = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)loadImageWithURL:(NSURL *)url completion:(ImageLoadCompletion)completion {
    NSURLSessionDataTask *existingTask = self.dataTasks[url];
    if (existingTask) {
        [existingTask cancel];
    }
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        UIImage *image = nil;
        if (data) {
            image = [UIImage imageWithData:data];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) {
                if (image) {
                    completion(image, nil);
                } else {
                    completion(nil, error);
                }
            }
            [self.dataTasks removeObjectForKey:url];
        });
    }];
    
    self.dataTasks[url] = dataTask;
    [dataTask resume];
}

- (void)cancelLoadingImageWithURL:(NSURL *)url {
    NSURLSessionDataTask *dataTask = self.dataTasks[url];
    if (dataTask) {
        [dataTask cancel];
        [self.dataTasks removeObjectForKey:url];
    }
}

@end
