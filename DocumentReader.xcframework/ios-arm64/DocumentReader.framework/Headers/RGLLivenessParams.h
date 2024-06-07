//
//  RGLLivenessParams.h
//  DocumentReader
//
//  Created by Serge Rylko on 31.01.24.
//  Copyright © 2024 Regula. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DocumentReader/RGLMacros.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(LivenessParams)
@interface RGLLivenessParams : NSObject

@property(nonatomic, strong, nullable) NSNumber *checkOVI;
@property(nonatomic, strong, nullable) NSNumber *checkMLI;
@property(nonatomic, strong, nullable) NSNumber *checkHolo;
@property(nonatomic, strong, nullable) NSNumber *checkED;

+ (instancetype)defaultParams;

RGL_EMPTY_INIT_UNAVAILABLE

@end

NS_ASSUME_NONNULL_END
