'use static';
import StringBuilderAppendTest from "./stringbuild/StringBuilderAppendTest.test";
import StringBuilderStringLengthTest from "./stringbuild/StringBuilderStringLengthTest.test";
import StringBuilderConstructorOneTest from "./stringbuild/StringBuilderConstructorOneTest.test";
import StringBuilderConstructorTwoTest from "./stringbuild/StringBuilderConstructorTwoTest.test";
import StringBuilderConstructorStringTest from "./stringbuild/StringBuilderConstructorStringTest.test";
import StringBuilderConcatStringsTest from "./stringbuild/StringBuilderConcatStringsTest.test";
import StringBuilderToStringOneTest from "./stringbuild/StringBuilderToStringOneTest.test";
import StringBuilderToStringTwoTest from "./stringbuild/StringBuilderToStringTwoTest.test";
import StringBuilderSupplementTest from "./stringbuild/StringBuilderSupplementTest.test";
import StringBuilderXtsFillTest from "./stringbuild/StringBuilderXtsFillTest.test";

import StringBuilderToStringTest from './stringbuild/StringBuilderToStringTest.test';
import StringBuilderSupplementTest1 from './stringbuild/StringBuilderSupplementTest1.test';

export default function testsuite():void {
  StringBuilderAppendTest()
  StringBuilderStringLengthTest()
  StringBuilderConstructorOneTest()
  StringBuilderConstructorTwoTest()
  StringBuilderConstructorStringTest()
  StringBuilderConcatStringsTest()
  StringBuilderToStringOneTest()
  StringBuilderToStringTwoTest()
  StringBuilderSupplementTest()
  StringBuilderXtsFillTest()

  StringBuilderToStringTest();
  StringBuilderSupplementTest1();
}
