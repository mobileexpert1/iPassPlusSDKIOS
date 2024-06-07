//
//  RGLBaseConfig.h
//  DocumentReader
//
//  Created by Serge Rylko on 12.07.23.
//  Copyright © 2023 Regula. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RGLMacros.h"

NS_ASSUME_NONNULL_BEGIN

@class RGLOnlineProcessingConfig;
@class RGLScenario;
@class UIImage;

NS_SWIFT_NAME(DocReader.BaseConfig)
@interface RGLBaseConfig : NSObject

@property (nonatomic, strong, nullable) RGLOnlineProcessingConfig *onlineProcessingConfig;

/// Documents processing scenario.
@property (nonatomic, strong, nullable) NSString *scenario;

/// Live portrait photo.
/// Requires network connection.
@property (nonatomic, strong, nullable) UIImage *livePortrait;
/// Portrait photo from an external source.
/// Requires network connection.
@property (nonatomic, strong, nullable) UIImage *extPortrait;

RGL_EMPTY_INIT_UNAVAILABLE

- (instancetype)initWithScenario:(NSString *)scenario;
- (instancetype)initWithOnlineProcessingConfig:(RGLOnlineProcessingConfig *)onlineProcessingConfig;

@end

NS_ASSUME_NONNULL_END
