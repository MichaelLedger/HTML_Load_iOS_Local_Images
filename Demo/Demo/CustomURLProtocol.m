//
//  CustomURLProtocol.m
//  Demo
//
//  Created by MountainX on 2019/3/4.
//  Copyright © 2019 MTX Software Technology Co.,Ltd. All rights reserved.
//

#import "CustomURLProtocol.h"

@implementation CustomURLProtocol

+ (BOOL)canInitWithRequest:(NSURLRequest *)theRequest
{
    if ([theRequest.URL.scheme caseInsensitiveCompare:@"myapp"] == NSOrderedSame) {
        return YES;
    }
    return NO;
}

+ (NSURLRequest*)canonicalRequestForRequest:(NSURLRequest *)theRequest
{
    return theRequest;
}

- (void)startLoading
{
    NSURLResponse *response = [[NSURLResponse alloc] initWithURL:[self.request URL]
                                                        MIMEType:@"image/png"
                                           expectedContentLength:-1
                                                textEncodingName:nil];
    NSInteger fromIndex = [self.request.URL.resourceSpecifier rangeOfString:@"/" options:NSBackwardsSearch].location;
    NSString *imageName = [self.request.URL.resourceSpecifier substringFromIndex:fromIndex+1];
    
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:imagePath];
    
    [[self client] URLProtocol:self didReceiveResponse:response cacheStoragePolicy:NSURLCacheStorageNotAllowed];
    [[self client] URLProtocol:self didLoadData:data];
    [[self client] URLProtocolDidFinishLoading:self];
    NSLog(@"startLoading");
    
}

- (void)stopLoading
{
    NSLog(@"stopLoading");
}

@end
