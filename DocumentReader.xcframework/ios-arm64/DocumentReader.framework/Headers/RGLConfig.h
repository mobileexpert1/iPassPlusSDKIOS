//
//  RGLConfig.h
//  DocumentReader
//
//  Created by Pavel Kondrashkov on 8/30/21.
//  Copyright © 2021 Regula. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RGLMacros.h"
#import <DocumentReader/RGLBaseReaderConfig.h>

NS_ASSUME_NONNULL_BEGIN

/// DocumentReader configuration object.
/// Controls initialization time properties such as License and Database filepath.
NS_SWIFT_NAME(DocReader.Config)
@interface RGLConfig : RGLBaseReaderConfig

/// The license binary file loaded as `Data`.
@property(readwrite, nonatomic, strong, nonnull) NSData *licenseData;

RGL_EMPTY_INIT_UNAVAILABLE

/// Creates configuration object for DocumentReader.
/// @param licenseData The license binary file loaded as `Data`.
- (instancetype)initWithLicenseData:(nonnull NSData *)licenseData;

/// Creates configuration object for DocumentReader.
/// @param licenseData The license binary file loaded as `Data`.
/// @param licenseUpdateCheck Enables automatic license update check during `DocumentReader` initialization.
/// @param databasePath The path to the database file.
- (instancetype)initWithLicenseData:(nonnull NSData *)licenseData
                 licenseUpdateCheck:(BOOL)licenseUpdateCheck
                       databasePath:(nullable NSString *)databasePath
               delayedNNLoadEnabled:(BOOL)delayedNNLoadEnabled;

/// Creates configuration object for DocumentReader.
/// @param licenseData The license binary file loaded as `Data`.
+ (instancetype)configWithLicenseData:(nonnull NSData *)licenseData;

/// Creates configuration object for DocumentReader.
/// @param licenseData The license binary file loaded as `Data
/// @param licenseUpdateCheck Enables automatic license update check during `DocumentReader` initialization.
/// @param databasePath The path to the database file.
+ (instancetype)configWithLicenseData:(nonnull NSData *)licenseData
                   licenseUpdateCheck:(BOOL)licenseUpdateCheck
                         databasePath:(nullable NSString *)databasePath
                 delayedNNLoadEnabled:(BOOL)delayedNNLoadEnabled;

@end

NS_ASSUME_NONNULL_END
