//
//  RGLFaceAPISearchParams.h
//  DocumentReader
//
//  Created by Dmitry Evglevsky on 4.05.23.
//  Copyright © 2023 Regula. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RGLFaceAPISearchParams : NSObject

/// The number of returned Persons limit. Default: 100.
@property(nonatomic, strong) NSNumber *limit;

/// The similarity distance threshold, should be between 0.0 and 2.0, where 0.0 is for returning results for only the most similar persons
/// and 2.0 is for all the persons, even the dissimilar ones. If not set, the default 1.0 value is used. Default: 1.0
@property(nonatomic, strong) NSNumber *threshold;

/// The IDs of the groups in which the search is performed.
@property(nonatomic, strong, nullable) NSArray<NSNumber *> *groupIDs;

@end

NS_ASSUME_NONNULL_END
