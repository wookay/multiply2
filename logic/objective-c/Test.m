// logic/objective-c/Test.m

#import "UnitTest.h"


int main (int argc, const char * argv[]) {
  NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];


  assert_equal( 1    , 1    );
  assert_equal( 3    , 1+2  );
  assert_equal( @"a"  , @"a"  );


  [pool release];
  return 0;
}
