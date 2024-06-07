//
//  RGLRFIDParams.h
//  DocumentReader
//
//  Created by Dmitry Evglevsky on 29.04.23.
//  Copyright © 2023 Regula. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(RFIDParams)
@interface RGLRFIDParams : NSObject

/// A list of notification codes that should be ignored during passive authentication (PA).
@property (nonatomic, strong, nullable) NSArray<NSNumber *> *paIgnoreNotificationCodes;

@end

NS_ASSUME_NONNULL_END
