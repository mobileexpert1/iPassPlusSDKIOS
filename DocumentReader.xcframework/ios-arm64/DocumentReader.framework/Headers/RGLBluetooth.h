//
//  RGLBleTool.h
//  DocumentReader
//
//  Created by Serge Rylko on 11.10.22.
//  Copyright © 2022 Regula. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RGLMacros.h"

NS_ASSUME_NONNULL_BEGIN

@class RGLBluetooth;
@class CBPeripheral;

typedef NS_ENUM(NSInteger, RGLBluetoothConnectionState) {
  RGLBluetoothConnectionStateNone = 0,
  RGLBluetoothConnectionStateSearching,
  RGLBluetoothConnectionStateConnecting,
  RGLBluetoothConnectionStateConnected,
  RGLBluetoothConnectionStateDisconnected
} NS_SWIFT_NAME(BluetoothConnectionState);

@protocol RGLBluetoothDelegate <NSObject>

@optional;
/// Tells the delegate that connection state of connected Regula device is changed.
- (void)didChangeConnectionState:(RGLBluetooth *)bluetooth state:(RGLBluetoothConnectionState)state;

/// Tells the delegate that battery level of connected Regula device is changed.
- (void)didChangeBatteryLevel:(RGLBluetooth *)bluetooth level:(NSUInteger)level;

/// Tells the delegate that Regula device is found.
- (void)didFindDevice:(RGLBluetooth *)bluetooth device:(CBPeripheral *)device;

/// Tells the delegate that scan for Regula Devices is started.
- (void)didStartScan:(RGLBluetooth *)bluetooth;

/// Tells the delegate that scan for Regula Devices is started.
- (void)didEndScan:(RGLBluetooth *)bluetooth devices:(NSArray<CBPeripheral *> *)devices;

@end

NS_SWIFT_NAME(Bluetooth)
@interface RGLBluetooth : NSObject

/// Device name of connected periphery.
@property (nonatomic, strong, readonly) NSString *deviceName;

/// Indicates whether Redula device flash light is on.
@property (nonatomic, assign, readonly) BOOL isFlashing;

/// Battery level of connected device.
@property (nonatomic, assign, readonly) NSUInteger batteryLevel;

@property (nullable, nonatomic, strong, readonly) NSString *manufacturerName;
@property (nullable, nonatomic, strong, readonly) NSString *modelNumber;
@property (nullable, nonatomic, strong, readonly) NSString *serialNumber;
@property (nullable, nonatomic, strong, readonly) NSString *hardwareRevision;
@property (nullable, nonatomic, strong, readonly) NSString *firmwareRevision;
@property (nullable, nonatomic, strong, readonly) NSString *softwareRevision;
@property (nullable, nonatomic, strong, readonly) NSString *hardwareId;

/// Connection state of connected Regula device
@property (nonatomic, assign, readonly) RGLBluetoothConnectionState state;

/// The delegate object that will receive `RGLBluetooth` events.
@property (nullable, nonatomic, weak) id<RGLBluetoothDelegate> delegate;

- (instancetype)init NS_DESIGNATED_INITIALIZER;

/// Flashes Regula device light.
- (void)actionFlashOn;

/// Starts to establish connection with Regula device.
/// - Parameter deviceName: Name of the device
- (void)connectWithDeviceName:(NSString *)deviceName;

/// Starts to establish connection with Regula device.
/// - Parameter periphery: Periphery instance
- (void)connectPeriphery:(CBPeripheral *)periphery;

/// Scans for all available Regula devices for a short period of time.
/// Callbacks are available through `RGLBluetoothDelegate didFindDevice:bluetooth:device`
- (void)startSearchDevices;

/// Stops Regula devices scanning
- (void)stopSearchDevices;

/// Stops current connection.
- (void)disconnect;

/// Indicates whether Regula Device connected and available for usage
- (BOOL)isPowerOn;

@end

NS_ASSUME_NONNULL_END
