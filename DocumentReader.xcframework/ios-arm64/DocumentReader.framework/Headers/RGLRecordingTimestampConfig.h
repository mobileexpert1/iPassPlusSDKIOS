//
//  RGLRecordingTimestampConfig.h
//  DocumentReader
//
//  Created by Dmitry Evglevsky on 17.07.23.
//  Copyright © 2023 Regula. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, RGLRecordingTimestampPosition){
  RGLRecordingTimestampPositionTopLeft,
  RGLRecordingTimestampPositionTopRight,
  RGLRecordingTimestampPositionBottomLeft,
  RGLRecordingTimestampPositionBottomRight,
} NS_SWIFT_NAME(DocReader.RecordingTimestampPosition);

NS_ASSUME_NONNULL_BEGIN

@interface RGLRecordingTimestampConfig : NSObject

@property(nonatomic, assign) RGLRecordingTimestampPosition position;
@property(nonatomic, strong) UIColor *backgroundColor;
@property(nonatomic, strong) UIColor *textColor;
@property(nonatomic, strong) UIFont *textFont;
@property(nonatomic, strong) NSString *dateTimeFormat;
@property(nonatomic, strong) NSString *timezoneName;

@end

NS_ASSUME_NONNULL_END
