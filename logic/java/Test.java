// logic/java/Test.java

class Test {
  static void assert_equal(int expected, int got) {
    if (expected==got) {
      System.out.println("passed: " + expected);
    } else {
      System.out.println("Assertion failed\nExpected: " + expected +
        "\nGot: " + got);
    }
  }

  static void assert_equal(String expected, String got) {
    if (expected.equals(got)) {
      System.out.println("passed: " + expected);
    } else {
      System.out.println("Assertion failed\nExpected: " + expected +
        "\nGot: " + got);
    }
  }


  public static void main(String[] args) {

    assert_equal( 1    , 1    );
    assert_equal( 3    , 1+2  );
    assert_equal( "a"  , "a"  );

  }
}
