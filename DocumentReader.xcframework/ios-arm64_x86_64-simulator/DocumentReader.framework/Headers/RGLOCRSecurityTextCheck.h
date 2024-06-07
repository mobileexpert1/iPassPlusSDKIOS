//
//  RGLOCRSecurityTextCheck.h
//  DocumentReader
//
//  Created by Dmitry Evglevsky on 24.03.23.
//  Copyright © 2023 Regula. All rights reserved.
//

#import "RGLAuthenticityElement.h"

@class RGLElementRect;

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(OCRSecurityTextCheck)
@interface RGLOCRSecurityTextCheck : RGLAuthenticityElement

@property(nonatomic, assign, readonly) NSInteger reserved1;
@property(nonatomic, assign, readonly) NSInteger reserved2;
@property(nonatomic, assign, readonly) NSInteger lightType;
@property(nonatomic, assign, readonly) RGLFieldType fieldType;
@property(nonatomic, strong, readonly, nonnull) RGLElementRect *elementRect;
@property(nonatomic, strong, readonly, nonnull) RGLElementRect *etalonFieldRect;
@property(nonatomic, strong, readonly, nonnull) NSString *securityTextResultOCR;
@property(nonatomic, strong, readonly, nonnull) NSString *etalonResultOCR;


@end

NS_ASSUME_NONNULL_END
