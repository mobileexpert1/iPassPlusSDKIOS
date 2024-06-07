//
//  RGLFaceAPIParams.h
//  DocumentReader
//
//  Created by Dmitry Evglevsky on 4.05.23.
//  Copyright © 2023 Regula. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DocumentReader/RGLMacros.h>

@class RGLFaceAPISearchParams;

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(FaceAPIParams)
@interface RGLFaceAPIParams : NSObject

/// The URL of the Regula Face SDK service instance to be used. Default: "https://faceapi.regulaforensics.com".
@property(nonatomic, strong) NSString *url;

/// The processing mode: "match" or "match+search". Default: "match".
@property(nonatomic, strong) NSString *mode;

/// The similarity threshold, 0-100. Above 75 means that the faces' similarity is verified, below 75 is not. Default: 75.
@property(nonatomic, strong) NSNumber *threshold;

/// A search filter that can be applied if the "match+search" mode is enabled.
@property(nonatomic, strong, nullable) RGLFaceAPISearchParams *searchParams;

/// The service request timeout, ms. Default: 3000.
@property(nonatomic, strong) NSNumber *serviceTimeout;

/// Proxy to use, should be set according to the cURL standart.
@property(nonatomic, strong, nullable) NSString *proxy;

/// Username and password to use for proxy authentication, should be set according to the cURL standart.
@property(nonatomic, strong, nullable) NSString *proxyPassword;

/// Proxy protocol type, should be set according to the cURL standart.
@property(nonatomic, strong, nullable) NSNumber *proxyType;


- (instancetype)init RGL_DEPRECATED(7.1, "Use `[RGLFaceAPIParams defaultParams]` instead");

+ (instancetype)defaultParams;

@end

NS_ASSUME_NONNULL_END
