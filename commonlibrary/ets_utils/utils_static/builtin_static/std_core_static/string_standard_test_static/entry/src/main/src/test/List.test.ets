'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


import StringAnchorTest from './string/html/StringAnchorTest.test';
import StringBigTest from './string/html/StringBigTest.test';
import StringBlinkTest from './string/html/StringBlinkTest.test';
import StringBoldTest from './string/html/StringBoldTest.test';
import StringToLowerCaseTest from './string/case/StringToLowerCaseTest.test';
import StringToUpperCaseTest from './string/case/StringToUpperCaseTest.test';
import StringPadStartTest from './string/pad/StringPadStartTest.test';
import StringPadEndTest from './string/pad/StringPadEndTest.test';
import StringRepeatTest from './string/pad/StringRepeatTest.test';
import StringEqualsTest from './string/compare/StringEqualsTest.test';
import StringStartsWithTest from './string/compare/StringStartsWithTest.test';
import StringEndsWithTest from './string/compare/StringEndsWithTest.test';
import StringContainsTest from './string/compare/StringContainsTest.test';
import StringCompareToTest from './string/compare/StringCompareToTest.test';
import StringLocaleCompareTest from './string/compare/StringLocaleCompareTest.test';
import StringConstructorTest from './string/constructor/StringConstructorTest.test';
import StringFixedTest from './string/html/StringFixedTest.test';
import StringFontcolorTest from './string/html/StringFontcolorTest.test';
import StringFontsizeTest from './string/html/StringFontsizeTest.test';
import StringItalicsTest from './string/html/StringItalicsTest.test';
import StringGetLengthTest from './string/index/StringGetLengthTest.test';
import StringCharAtTest from './string/index/StringCharAtTest.test';
import StringIsEmptyTest from './string/compare/StringIsEmptyTest.test';
import StringIsCompressedTest from './string/compare/StringIsCompressedTest.test';
import StringLinkTest from './string/html/StringLinkTest.test';
import StringReplaceTest from './string/replace/StringReplaceTest.test';
import StringReplaceAllTest from './string/replace/StringReplaceAllTest.test';
import StringReplaceCharTest from './string/replace/StringReplaceCharTest.test';
import StringIndexOfTest from './string/search/StringIndexOfTest.test';
import StringLastIndexOfTest from './string/search/StringLastIndexOfTest.test';
import StringSearchTest from './string/search/StringSearchTest.test';
import StringMatchTest from './string/search/StringMatchTest.test';
import StringMatchAllTest from './string/search/StringMatchAllTest.test';
import StringSmallTest from './string/html/StringSmallTest.test';
import StringStrikeTest from './string/html/StringStrikeTest.test';
import StringStringTypeTest from './string/compare/StringStringTypeTest.test';
import StringToStringTest from './string/convert/StringToStringTest.test';
import StringValueOfTest from './string/convert/StringValueOfTest.test';
import StringIteratorTest from './string/convert/StringIteratorTest.test';
import StringSubTest from './string/html/StringSubTest.test';
import StringSubstringTest from './string/slice/StringSubstringTest.test';
import StringConcatTest from './string/slice/StringConcatTest.test';
import StringJoinTest from './string/slice/StringJoinTest.test';
import StringGetCharsTest from './string/index/StringGetCharsTest.test';
import StringGetBytesTest from './string/index/StringGetBytesTest.test';
import StringSupTest from './string/html/StringSupTest.test';
import StringCodePointAtTest from './string/index/StringCodePointAtTest.test';
import StringCodePointCountTest from './string/index/StringCodePointCountTest.test';
import StringCharCodeAtTest from './string/index/StringCharCodeAtTest.test';
import StringIsWellFormedTest from './string/encode/StringIsWellFormedTest.test';
import StringToWellFormedTest from './string/encode/StringToWellFormedTest.test';
import StringNormalizeTest from './string/encode/StringNormalizeTest.test';
import StringFromCharCodeTest from './string/encode/StringFromCharCodeTest.test';
import StringFromCodePointTest from './string/encode/StringFromCodePointTest.test';
import StringSplitTest from './string/slice/StringSplitTest.test';
import StringSubstrTest from './string/slice/StringSubstrTest.test';
import StringSliceTest from './string/slice/StringSliceTest.test';
import StringTrimTest from './string/trim/StringTrimTest.test';
import StringToLocaleLowerCaseTest from './string/case/StringToLocaleLowerCaseTest.test';
import StringToLocaleUpperCaseTest from './string/case/StringToLocaleUpperCaseTest.test';
import StringPadLeftTest from './string/pad/StringPadLeftTest.test';
import StringPadRightTest from './string/pad/StringPadRightTest.test';
import StringAtTest from './string/index/StringAtTest.test';
import StringContentEqualsTest from './string/compare/StringContentEqualsTest.test';
import StringTrimStartTest from './string/trim/StringTrimStartTest.test';
import StringTrimEndTest from './string/trim/StringTrimEndTest.test';
import StringTrimLeftTest from './string/trim/StringTrimLeftTest.test';
import StringTrimRightTest from './string/trim/StringTrimRightTest.test';
import StringIncludesTest from './string/compare/StringIncludesTest.test';

export default function testsuite(): void {
  StringAnchorTest();
  StringBigTest();
  StringBlinkTest();
  StringBoldTest();
  StringToLowerCaseTest();
  StringToUpperCaseTest();
  StringPadStartTest();
  StringPadEndTest();
  StringRepeatTest();
  StringEqualsTest();
  StringStartsWithTest();
  StringEndsWithTest();
  StringContainsTest();
  StringCompareToTest();
  StringLocaleCompareTest();
  StringConstructorTest();
  StringFixedTest();
  StringFontcolorTest();
  StringFontsizeTest();
  StringItalicsTest();
  StringGetLengthTest();
  StringCharAtTest();
  StringIsEmptyTest();
  StringIsCompressedTest();
  StringLinkTest();
  StringReplaceTest();
  StringReplaceAllTest();
  StringReplaceCharTest();
  StringIndexOfTest();
  StringLastIndexOfTest();
  StringSearchTest();
  StringMatchTest();
  StringMatchAllTest();
  StringSmallTest();
  StringStrikeTest();
  StringStringTypeTest();
  StringToStringTest();
  StringValueOfTest();
  StringIteratorTest();
  StringSubTest();
  StringSubstringTest();
  StringConcatTest();
  StringJoinTest();
  StringGetCharsTest();
  StringGetBytesTest();
  StringSupTest();
  StringCodePointAtTest();
  StringCodePointCountTest();
  StringCharCodeAtTest();
  StringIsWellFormedTest();
  StringToWellFormedTest();
  StringNormalizeTest();
  StringFromCharCodeTest();
  StringFromCodePointTest();
  StringSplitTest();
  StringSubstrTest();
  StringSliceTest();
  StringTrimTest();
  StringTrimStartTest();
  StringTrimEndTest();
  StringTrimLeftTest();
  StringTrimRightTest();
  StringToLocaleLowerCaseTest();
  StringToLocaleUpperCaseTest();
  StringPadLeftTest();
  StringPadRightTest();
  StringAtTest();
  StringContentEqualsTest();
  StringIncludesTest();
}
