// logic/csharp/Test.cs

using System;

class Test {
  static void assert_equal(object expected, object got) {
    if (expected.Equals(got)) {
      Console.WriteLine("passed: " + expected);
    } else {
      Console.WriteLine("Assertion failed\nExpected: " + expected + "\nGot: " + got);
    }
  }

  static void Main() {

    assert_equal( 1    , 1    );
    assert_equal( 3    , 1+2  );
    assert_equal( "a"  , "a"  );

  }
}
