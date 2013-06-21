// logic/javascript/Test.js

function assert_equal(expected, got) {
  if (expected==got) {
    console.log("passed: " + expected);
  } else {
    console.log("Assertion failed\nExpected: " + expected + "\nGot: " + got);
  }
}


assert_equal( 1    , 1    );
assert_equal( 3    , 1+2  );
assert_equal( "a"  , "a"  );
