//
//  RGLScannerConfig.h
//  DocumentReader
//
//  Created by Serge Rylko on 12.07.23.
//  Copyright © 2023 Regula. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DocumentReader/RGLBaseConfig.h>
#import "RGLMacros.h"

NS_ASSUME_NONNULL_BEGIN

@class RGLOnlineProcessingConfig;

NS_SWIFT_NAME(DocReader.ScannerConfig)
@interface RGLScannerConfig : RGLBaseConfig

RGL_EMPTY_INIT_UNAVAILABLE

- (instancetype)initWithScenario:(nullable NSString *)scenario
          onlineProcessingConfig:(RGLOnlineProcessingConfig *)onlineProcessingConfig;

@end

NS_ASSUME_NONNULL_END
