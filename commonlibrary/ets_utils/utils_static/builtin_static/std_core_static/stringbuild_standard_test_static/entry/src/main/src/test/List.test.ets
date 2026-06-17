import abilityTest from "./Ability.test";
import StringBuilderAppendTest from "./stringbuild/StringBuilderAppendTest.test";
import StringBuilderConcatStringsTest from "./stringbuild/StringBuilderConcatStringsTest.test";
import StringBuilderConstructorOneTest from "./stringbuild/StringBuilderConstructorOneTest.test";
import StringBuilderConstructorStringTest from "./stringbuild/StringBuilderConstructorStringTest.test";
import StringBuilderConstructorTwoTest from "./stringbuild/StringBuilderConstructorTwoTest.test";
import StringBuilderStringLengthTest from "./stringbuild/StringBuilderStringLengthTest.test";
import StringBuilderToStringOneTest from "./stringbuild/StringBuilderToStringOneTest.test";
import StringBuilderToStringTwoTest from "./stringbuild/StringBuilderToStringTwoTest.test";

export default function testsuite():void {
  StringBuilderAppendTest()
  StringBuilderStringLengthTest()
  StringBuilderConstructorOneTest()
  StringBuilderConstructorTwoTest()
  StringBuilderConstructorStringTest()
  StringBuilderConcatStringsTest()
  StringBuilderToStringOneTest()
  StringBuilderToStringTwoTest()
}