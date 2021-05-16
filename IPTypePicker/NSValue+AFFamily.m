//
//  NSValue+AFFamily.m
//  TCPServeObjC
//
//  Created by Eric Kampman on 5/15/21.
//

#import "NSValue+AFFamily.h"

@implementation NSValue (AFFamily)
+ (instancetype)valuewithAFFamily:(AFFamily)value
{
	return [self valueWithBytes:&value objCType:@encode(AFFamily)];
}
- (AFFamily)afFamilyValue
{
	AFFamily value;
	[self getValue:&value];
	return value;
}
@end
