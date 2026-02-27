
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
}