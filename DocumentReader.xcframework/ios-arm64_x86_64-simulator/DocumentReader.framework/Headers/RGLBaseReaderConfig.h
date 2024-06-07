//
//  RGLBaseReaderConfig.h
//  DocumentReader
//
//  Created by Serge Rylko on 11.10.22.
//  Copyright © 2022 Regula. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RGLMacros.h"

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(DocReader.BaseReaderConfig)
@interface RGLBaseReaderConfig : NSObject

// Enables automatic license update check during `DocumentReader` initialization.
/// Defaults to `true`.
@property(readwrite, nonatomic, assign) BOOL licenseUpdateCheck;

/// The path to the database file.
@property(readwrite, nonatomic, copy, nullable) NSString *databasePath;

/// Defines whether the `DocumentReader` delays loading of neural networks. Defaults to `false`.
///
/// When set to `true` the initialization starts in the background thread after a completion block passed to the method
/// `-[RGLDocReader initializeReaderWithConfig:completion:]` is called. If the document processing is initiated before all the networks are loaded,
/// the `DocumentReader` will wait for it before starting the handling.
///
/// When set to `false` the initialization is performed during `DocumentReader` initialization `-[RGLDocReader initializeReaderWithConfig:completion:]` method.
@property(readwrite, nonatomic, assign, getter=isDelayedNNLoadEnabled) BOOL delayedNNLoadEnabled;

RGL_EMPTY_INIT_UNAVAILABLE

@end

NS_ASSUME_NONNULL_END

