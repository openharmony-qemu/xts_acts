
import StringBasicTest from './String_Basic/StringBasicTest';
import stringFromCharCodeTest from './String_FromCharCode/StringFromCharCodeTest';
import StringFromCodePointTest from './String_FromCodePoint/StringFromCodePointTest';
import StringRawTest from './String_Raw/StringRawTest';
import stringAtTest from './String_At/StringAtTest';
import StringCharAtTest from './String_CharAt/StringCharAtTest';
import stringCodePointAtTest from './String_CodePointAt/StringCodePointAtTest';
import StringConcatTest from './String_Concat/StringConcatTest';
import StringIndexOfTest from './String_IndexOf/StringIndexOfTest';
import stringIncludesTest from './String_Includes/StringIncludesTest';
import StringSubstringTest from './String_Substring/StringSubstringTest';
import StringSliceTest from './String_Slice/StringSliceTest';
import StringSplitTest from './String_Split/StringSplitTest';
import StringToLowerCaseTest from './String_ToLowerCase/StringToLowerCaseTest';
import StringToUpperCaseTest from './String_ToUpperCase/StringToUpperCaseTest';
import stringToLocaleUpperCaseBasicTest from './String_ToLocaleUpperCase/StringToLocaleUpperCaseBasicTest';
import stringToStringBasicTest from './String_ToString/StringToStringBasicTest';
import StringCharCodeAtBasicTest from './String_CharCodeAt/StringCharCodeAtBasicTest'
import stringMatchAllBasicTest from './String_MatchAll/StringMatchAllBasicTest';
import stringMatchBasicTest from './String_Match/StringMatchBasicTest';
import StringEndsWithBasicTest from './String_EndsWith/StringEndsWithBasicTest'
import stringIsWellFormedBasicTest from './String_IsWellFormed/StringIsWellFormedBasicTest';
import stringLastIndexOfBasicTest from './String_LastIndexOf/StringLastIndexOfBasicTest';
import stringLocaleCompareBasicTest from './String_LocaleCompare/StringLocaleCompareBasicTest';
import stringNormalizeBasicTest from './String_Normalize/StringNormalizeBasicTest';
import stringPadEndBasicTest from './String_PadEnd/StringPadEndBasicTest';
import stringPadStartBasicTest from './String_PadStart/StringPadStartBasicTest';
import stringToWellFormedBasicTest from './String_ToWellFormed/StringToWellFormedBasicTest';

export default function testsuite() {
  StringBasicTest();
  stringFromCharCodeTest();
  StringFromCodePointTest();
  StringRawTest();
  stringAtTest();
  StringCharAtTest();
  stringCodePointAtTest();
  StringConcatTest();
  StringIndexOfTest();
  stringIncludesTest();
  StringSubstringTest();
  StringSliceTest();
  StringSplitTest();
  StringToLowerCaseTest();
  StringToUpperCaseTest();
  stringToLocaleUpperCaseBasicTest();
  stringToStringBasicTest();
  StringCharCodeAtBasicTest()
  StringEndsWithBasicTest();
  stringIsWellFormedBasicTest();
  stringLastIndexOfBasicTest();
  stringLocaleCompareBasicTest();
  stringMatchBasicTest();
  stringMatchAllBasicTest();
  stringNormalizeBasicTest();
  stringPadEndBasicTest();
  stringPadStartBasicTest();
  stringToWellFormedBasicTest();
}