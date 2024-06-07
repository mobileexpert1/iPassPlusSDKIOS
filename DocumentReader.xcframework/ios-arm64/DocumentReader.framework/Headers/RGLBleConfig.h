//
//  RGLBleConfig.h
//  DocumentReader
//
//  Created by Serge Rylko on 11.10.22.
//  Copyright © 2022 Regula. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DocumentReader/RGLBaseReaderConfig.h>
#import "RGLMacros.h"

NS_ASSUME_NONNULL_BEGIN

@class RGLBluetooth;

/// DocumentReader configuration object.
/// For usage when the license is embedded in a Regula bluetooth device.
NS_SWIFT_NAME(DocReader.BleConfig)
@interface RGLBleConfig : RGLBaseReaderConfig

/// Bluetooth service connected to the config.
/// Once `DocReader` is initialized  the service is available through `DocReader.shared.bluetooth`.
@property(nonnull, nonatomic, strong, readonly) RGLBluetooth *bluetooth;

/// Creates configuration object for DocumentReader.
/// @param bluetooth `RGLBluetooth` instance that controls connection.
+ (instancetype)configWithBluetooth:(RGLBluetooth *)bluetooth;

/// Creates configuration object for DocumentReader.
/// @param bluetooth `RGLBluetooth` instance that controls connection.
- (instancetype)initWithBluetooth:(RGLBluetooth *)bluetooth;

/// Creates configuration object for DocumentReader.
/// @param bluetooth `RGLBluetooth` instance that controls connection.
/// @param licenseUpdateCheck Enables automatic license update check during `DocumentReader` initialization.
/// @param databasePath The path to the database file.
/// @param delayedNNLoadEnabled Enables delayed  `DocumentReader` initialization.
- (instancetype)initWithBluetooth:(RGLBluetooth *)bluetooth
               licenseUpdateCheck:(BOOL)licenseUpdateCheck
                     databasePath:(nullable NSString *)databasePath
             delayedNNLoadEnabled:(BOOL)delayedNNLoadEnabled;

RGL_EMPTY_INIT_UNAVAILABLE

@end

NS_ASSUME_NONNULL_END
