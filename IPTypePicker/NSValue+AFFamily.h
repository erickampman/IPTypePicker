//
//  NSValue+AFFamily.h
//  TCPServeObjC
//
//  Created by Eric Kampman on 5/15/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSValue (AFFamily)

typedef struct {
	NSString * _Nonnull name;
	UInt8 family;
} AFFamily;

+ (instancetype _Nonnull )valuewithAFFamily:(AFFamily)value;
@property (readonly) AFFamily afFamilyValue;
 

@end

NS_ASSUME_NONNULL_END
