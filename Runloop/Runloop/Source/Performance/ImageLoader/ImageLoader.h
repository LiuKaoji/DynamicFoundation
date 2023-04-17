//
//  ImageLoader.h
//  Runloop
//
//  Created by kaoji on 1/17/23.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ImageLoadCompletion)(UIImage * _Nullable image, NSError * _Nullable error);

@interface ImageLoader : NSObject

@property (nonatomic, strong) NSMutableDictionary *tasks; // 用于存储所有加载的图片对应的NSURLSessionDataTask

- (void)loadImageWithURL:(NSURL *)url completion:(void (^)(UIImage *image, NSError *error))completion;
- (void)cancelLoadingImageWithURL:(NSURL *)url;

@end

NS_ASSUME_NONNULL_END
