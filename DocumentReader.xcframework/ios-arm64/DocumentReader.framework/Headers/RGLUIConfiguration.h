//
//  RGLUIConfiguration.h
//  DocumentReader
//
//  Created by Dmitry Evglevsky on 25.10.23.
//  Copyright © 2023 Regula. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RGLMacros.h"

typedef NS_ENUM(NSInteger, RGLCustomizationColor) {
    RFIDProcessingScreenBackground = 200,
    RFIDProcessingScreenHintLabelText = 201,
    RFIDProcessingScreenHintLabelBackground = 202,
    RFIDProcessingScreenProgressLabelText = 203,
    RFIDProcessingScreenProgressBar = 204,
    RFIDProcessingScreenProgressBarBackground = 205,
    RFIDProcessingScreenResultLabelText = 206
} NS_SWIFT_NAME(DocReader.CustomizationColor);

typedef NS_ENUM(NSInteger, RGLCustomizationFont) {
    RFIDProcessingScreenHintLabel = 200,
    RFIDProcessingScreenProgressLabel = 201,
    RFIDProcessingScreenResultLabel = 202
} NS_SWIFT_NAME(DocReader.CustomizationFont);

typedef NS_ENUM(NSInteger, RGLCustomizationImage) {
    RFIDProcessingScreenFailureImage = 200
} NS_SWIFT_NAME(DocReader.CustomizationImage);

NS_ASSUME_NONNULL_BEGIN

@class RGLUIConfigurationBuilder;

NS_SWIFT_NAME(DocReader.UIConfiguration)
@interface RGLUIConfiguration : NSObject

RGL_EMPTY_INIT_UNAVAILABLE

- (instancetype)initWithBuilder:(RGLUIConfigurationBuilder *)builder NS_DESIGNATED_INITIALIZER;

+ (instancetype)defaultConfiguration;
+ (instancetype)configurationWithBuilderBlock:(void (^)(RGLUIConfigurationBuilder *))builderBlock;

- (UIColor *)colorForItem:(RGLCustomizationColor)item;
- (UIFont *)fontForItem:(RGLCustomizationFont)item;
- (UIImage *)imageForItem:(RGLCustomizationImage)item;

@end

NS_SWIFT_NAME(DocReader.UIConfigurationBuilder)
@interface RGLUIConfigurationBuilder : NSObject

RGL_EMPTY_INIT_UNAVAILABLE

- (void)setColor:(UIColor *)color forItem:(RGLCustomizationColor)item;
- (void)setFont:(UIFont *)font forItem:(RGLCustomizationFont)item;
- (void)setImage:(UIImage *)image forItem:(RGLCustomizationImage)item;

@end

NS_ASSUME_NONNULL_END
