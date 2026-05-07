import StringLastIndexOfBasicTest from "./StringLastIndexOfBasic.test";
import StringLocaleCompareBasicTest from "./StringLocaleCompareBasic.test";
import StringMatchBasicTest from "./StringMatchBasic.test";
import StringMatchAllBasicTest from "./StringMatchAllBasic.test";
import StringNormalizeBoundaryTest from "./StringNormalizeBoundary.test";
import StringNormalizeExceptionTest from "./StringNormalizeException.test";
import StringPadEndBasicTest from "./StringPadEndBasic.test";
import StringPadStartBasicTest from "./StringPadStartBasic.test";
import StringToWellFormedBasicTest from "./StringToWellFormedBasic.test";

export default function testsuite() {
  StringLastIndexOfBasicTest();
  StringLocaleCompareBasicTest();
  StringMatchBasicTest();
  StringMatchAllBasicTest();
  StringNormalizeBoundaryTest();
  StringNormalizeExceptionTest();
  StringPadEndBasicTest();
  StringPadStartBasicTest();
  StringToWellFormedBasicTest();
}