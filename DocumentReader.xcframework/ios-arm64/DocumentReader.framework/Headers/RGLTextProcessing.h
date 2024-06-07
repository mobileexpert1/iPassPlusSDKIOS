//
//  RGLTextProcessing.h
//  DocumentReader
//
//  Created by Deposhe on 6.12.22.
//  Copyright © 2022 Regula. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RGLMacros.h"

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(TextProcessing)
/// Text case transformation.
@interface RGLTextProcessing : NSObject

+ (RGLTextProcessing *)noChange;
+ (RGLTextProcessing *)uppercase;
+ (RGLTextProcessing *)lowercase;
+ (RGLTextProcessing *)capital;

RGL_EMPTY_INIT_UNAVAILABLE

@end

NS_ASSUME_NONNULL_END
