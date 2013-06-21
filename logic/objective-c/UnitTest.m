//
//  UnitTest.m
//
//  Created by Woo-Kyoung Noh on 05/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "UnitTest.h"
#import "objc/runtime.h"

@implementation UnitTest
+(void) assert:(id)got equals:(id)expected inFile:(NSString*)file atLine:(int)line {	
	BOOL dot_if_passed = false;
	BOOL equals = false;
	if (nil == expected && nil == got) {
		equals = true;
	} else {		
		equals =[expected isEqual:got];
	}

	if (equals) {
		if (dot_if_passed) {
			printf(".");
		} else {
			print_log_info([file UTF8String], line, @"passed: %@", [got inspect]);			
		}
	} else {
		printf("\n");
		print_log_info([file UTF8String], line, @"Assertion failed\nExpected: %@\nGot: %@", [expected inspect], [got inspect]);
	}
}

@end



@implementation NSValue (UnitTest)
+ valueWithValue:(const void *)aValue withObjCType:(const char *)aTypeDescription {
	if (_C_PTR == *aTypeDescription && nil == *(id *)aValue) {
		return nil; // nil should stay nil, even if it's technically a (void *)
	}
	
	switch (*aTypeDescription) {			
		case _C_CHR: // BOOL, char
			return [NSNumber numberWithChar:*(char *)aValue];
		case _C_UCHR: return [NSNumber numberWithUnsignedChar:*(unsigned char *)aValue];
		case _C_SHT: return [NSNumber numberWithShort:*(short *)aValue];
		case _C_USHT: return [NSNumber numberWithUnsignedShort:*(unsigned short *)aValue];
		case _C_INT: return [NSNumber numberWithInt:*(int *)aValue];
		case _C_UINT: return [NSNumber numberWithUnsignedInt:*(unsigned *)aValue];
		case _C_LNG: return [NSNumber numberWithLong:*(long *)aValue];
		case _C_ULNG: return [NSNumber numberWithUnsignedLong:*(unsigned long *)aValue];
		case _C_LNG_LNG: return [NSNumber numberWithLongLong:*(long long *)aValue];
		case _C_ULNG_LNG: return [NSNumber numberWithUnsignedLongLong:*(unsigned long long *)aValue];
		case _C_FLT: return [NSNumber numberWithFloat:*(float *)aValue];
		case _C_DBL: return [NSNumber numberWithDouble:*(double *)aValue];
		case _C_ID: return *(id *)aValue;
		case _C_PTR: // pointer, no string stuff supported right now
		case _C_STRUCT_B: // struct, only simple ones containing only basic types right now
		case _C_ARY_B: // array, of whatever, just gets the address
			return [NSValue valueWithBytes:aValue objCType:aTypeDescription];
	}
	return [NSValue valueWithBytes:aValue objCType:aTypeDescription];	
}
@end



@implementation NSObject (Inspect)
-(id) inspect {
    NSFormatterToInspect* formatter = [[NSFormatterToInspect alloc] init];
    NSString* str = [formatter stringForObjectValue:self];
    [formatter release];
    return str;
}
@end


@implementation NSFormatterToInspect
- (NSString *)stringForObjectValue:(id)anObject {
    if ([anObject isKindOfClass:[NSArray class]]) {
        NSMutableArray* ary = [NSMutableArray array];
        for (id obj in (NSArray*)anObject) {
            [ary addObject:SWF(@"%@", [obj inspect])];
        }
        return SWF(@"[%@]", [ary componentsJoinedByString:@", "]);
    } else if ([anObject isKindOfClass:[NSDictionary class]]) {
        NSMutableArray* ary = [NSMutableArray array];
        for (id key in anObject) {
            [ary addObject:[NSString stringWithFormat:@"%@ = %@", key, [anObject objectForKey:key]]];
        }
        return SWF(@"{%@}", [ary componentsJoinedByString:@", "]);
    } else if ([anObject isKindOfClass:[NSString class]]) {
        return SWF(@"%@", anObject);
    } else if ([anObject isKindOfClass:[NSValue class]]) {
        const char* aTypeDescription = [(NSValue*)anObject objCType];
        switch (*aTypeDescription) {
            case _C_FLT: {
                    float value = [anObject doubleValue];
                    if ([[anObject floor_down] doubleValue] == value) {
                        return SWF(@"%.1f", value);
                    } else {
                        return SWF(@"%f", value);
                    }
                }
                break;
            default:
                break;
        }
    }
    return SWF(@"%@", anObject);
}
@end

@implementation NSNumber (MathFunctions)
-(id) floor_down {
    double value = floor([self doubleValue]);
    return [NSNumber numberWithFloat:value];
}
@end

NSString* SWF(NSString* format, ...) {
    va_list args;
    va_start(args, format);
    NSString* alloc_str = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    NSString* ret = [NSString stringWithFormat:@"%@", alloc_str];
    [alloc_str release];
    return ret;
}



void print_log_info(const char* filename, int lineno, id format, ...) {
    NSString *str;
    if ([format isKindOfClass:[NSString class]]) {
        va_list args;
        va_start (args, format);
        str = [[NSString alloc] initWithFormat:format  arguments: args];
        va_end (args);
    } else {
        str = [[NSString alloc] initWithString:[format description]];
    }

    BOOL log_print = true;
    if (log_print) {
        const char* output = [str cStringUsingEncoding:NSUTF8StringEncoding];
        NSString* printFormat = [NSString stringWithFormat:@"%%s\n"];
        printf([printFormat UTF8String], output);
        //NSString* printFormat = [NSString stringWithFormat:@"%%%ds #%%03d   %%s\n", FILENAME_PADDING];
        //printf([printFormat UTF8String], filename, lineno, output);
    }
    [str release];
}
