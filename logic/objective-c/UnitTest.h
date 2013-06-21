//
//  UnitTest.h
//
//  Created by Woo-Kyoung Noh on 05/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import <Foundation/Foundation.h>


#define assert_equal(expected, got) \
 do { \
	__typeof__(expected) __expected = (expected); \
	__typeof__(got) __got = (got); \
	NSValue* expected_encoded = [NSValue valueWithValue:&__expected withObjCType: @encode(__typeof__(expected))]; \
	NSValue* got_encoded = [NSValue valueWithValue:&__got withObjCType: @encode(__typeof__(got))]; \
	[UnitTest assert:got_encoded equals:expected_encoded inFile:[NSString stringWithUTF8String:__FILE__] atLine:__LINE__]; \
} while(0)



void print_log_info(const char* filename, int lineno, id format, ...) ;

#define __FILENAME__ (strrchr(__FILE__,'/')+1)
#define log_info(const_chars_fmt, ...) print_log_info(__FILENAME__, __LINE__, const_chars_fmt, ##__VA_ARGS__)


@interface UnitTest : NSObject
+(void) assert:(id)got equals:(id)expected inFile:(NSString*)file atLine:(int)line ;
@end

@interface NSValue (Ext)
+ valueWithValue:(const void *)aValue withObjCType:(const char *)aTypeDescription ;
@end

@interface NSNumber (MathFunctions)
-(id) floor_down ;
@end

@interface NSObject (Inspect)
-(id) inspect ;
@end


@interface NSFormatterToInspect : NSFormatter
@end


NSString* SWF(NSString* format, ...) ;
