//
//  CustomURLProtocol.h
//  Demo
//
//  Created by MountainX on 2019/3/4.
//  Copyright © 2019 MTX Software Technology Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomURLProtocol : NSURLProtocol

+ (BOOL)canInitWithRequest:(NSURLRequest *)theRequest;

@end

NS_ASSUME_NONNULL_END
