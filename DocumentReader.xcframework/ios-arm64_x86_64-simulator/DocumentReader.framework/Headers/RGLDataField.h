//
//  RGLDataField.h
//  DocumentReader
//
//  Created by Dmitry Evglevsky on 3.07.23.
//  Copyright © 2023 Regula. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_SWIFT_NAME(DataField)
@interface RGLDataField : NSObject

@property(nonatomic, strong, readonly, nonnull) NSString *data;
@property(nonatomic, assign, readonly) NSInteger fieldType;


- (instancetype _Nonnull)init NS_UNAVAILABLE;
- (instancetype _Nonnull)initWithJSON:(NSDictionary *_Nonnull)json;
+ (instancetype _Nonnull)initWithJSON:(NSDictionary * _Nonnull)json;
- (NSDictionary *_Nonnull)jsonDictionary;

@end

