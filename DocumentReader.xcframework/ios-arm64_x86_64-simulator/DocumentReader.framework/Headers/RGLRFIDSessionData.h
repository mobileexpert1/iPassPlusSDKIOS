#import <Foundation/Foundation.h>
#import "RGLRFIDNotify.h"
#import "RGLMacros.h"

@class RGLAccessControlProcedureType, RGLApplication,
RGLSecurityObject, RGLCardProperties, RGLRFIDSessionDataStatus, RGLDataField;

NS_SWIFT_NAME(RFIDSessionData)
@interface RGLRFIDSessionData : NSObject

@property(nonatomic, strong, readonly, nonnull) NSArray <RGLAccessControlProcedureType *> *accessControls;
@property(nonatomic, strong, readonly, nonnull) NSArray <RGLApplication *> *applications;
@property(nonatomic, strong, readonly, nonnull) NSArray <RGLSecurityObject *> *securityObjects;
@property(nonatomic, strong, readonly, nonnull) NSArray <NSNumber *> *dataGroups;
@property(nonatomic, strong, readonly, nonnull) NSArray <RGLDataField *> *dataFields;
@property(nonatomic, strong, readonly, nonnull) RGLCardProperties *cardProperties;
@property(nonatomic, assign, readonly) NSInteger totalBytesReceived;
@property(nonatomic, assign, readonly) NSInteger totalBytesSent;
@property(nonatomic, assign, readonly) RGLRFIDErrorCodes status;
@property(nonatomic, assign, readonly) RGLRFIDErrorCodes extLeSupport;
@property(nonatomic, assign, readonly) double processTime;

- (instancetype _Nonnull)init NS_UNAVAILABLE;
- (instancetype _Nonnull)initWithJSON:(NSDictionary *_Nonnull)json dataFields:(NSArray<RGLDataField *> *_Nullable)dataFields;
+ (instancetype _Nonnull)initWithJSON:(NSDictionary *_Nonnull)json dataFields:(NSArray<RGLDataField *> *_Nullable)dataFields;
- (NSDictionary *_Nonnull)jsonDictionary;

@end
