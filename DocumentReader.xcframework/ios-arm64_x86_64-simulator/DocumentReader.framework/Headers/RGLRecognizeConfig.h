//
//  RGLRecognizeConfig.h
//  DocumentReader
//
//  Created by Serge Rylko on 12.07.23.
//  Copyright © 2023 Regula. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DocumentReader/RGLBaseConfig.h>
#import "RGLMacros.h"

NS_ASSUME_NONNULL_BEGIN

@class UIImage;
@class RGLImageInput;

NS_SWIFT_NAME(DocReader.RecognizeConfig)
@interface RGLRecognizeConfig : RGLBaseConfig

/// This parameter processing an image that contains a person and a document and compare the portrait photo from the document with the person's face.
/// It works only in the single-frame processing, but not in the video frame processing.
/// Requires network connection.
/// Default: NO.
@property (nonatomic, assign) BOOL oneShotIdentification;

@property (nonatomic, strong, nullable) UIImage *image;
@property (nonatomic, strong, nullable) NSData *imageData;
@property (nonatomic, strong, nullable) NSArray <UIImage *> *images;
@property (nonatomic, strong, nullable) NSArray <RGLImageInput *> *imageInputs;

RGL_EMPTY_INIT_UNAVAILABLE

- (instancetype)initWithImage:(UIImage *)image RGL_DEPRECATED(7.2, "Use `[[RGLRecognizeConfig alloc] initWithScenario:] or [[RGLRecognizeConfig alloc] initWithOnlineProcessingConfig:], then set image");
- (instancetype)initWithImageData:(NSData *)imageData RGL_DEPRECATED(7.2, "Use `[[RGLRecognizeConfig alloc] initWithScenario:] or [[RGLRecognizeConfig alloc] initWithOnlineProcessingConfig:], then set imageData");
- (instancetype)initWithImages:(NSArray <UIImage *> *)images RGL_DEPRECATED(7.2, "Use `[[RGLRecognizeConfig alloc] initWithScenario:] or [[RGLRecognizeConfig alloc] initWithOnlineProcessingConfig:], then set images");
- (instancetype)initWithImageInputs:(NSArray <RGLImageInput *> *)imageInputs RGL_DEPRECATED(7.2, "Use `[[RGLRecognizeConfig alloc] initWithScenario:] or [[RGLRecognizeConfig alloc] initWithOnlineProcessingConfig:], then set imageInputs");

@end

NS_ASSUME_NONNULL_END
