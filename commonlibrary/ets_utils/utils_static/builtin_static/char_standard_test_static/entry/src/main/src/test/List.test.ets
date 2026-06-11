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
import CharIsBinDigitStaticCharTest from "./charStatic/CharIsBinDigitStaticCharTest.test";
import CharIsDecDigitStaticCharTest from "./charStatic/CharIsDecDigitStaticCharTest.test";
import CharIsHexDigitStaticCharTest from "./charStatic/CharIsHexDigitStaticCharTest.test";
import CharIsInBasicMultilingualPlaneStaticCharTest from "./charStatic/CharIsInBasicMultilingualPlaneStaticCharTest.test";
import CharIsInBasicMultilingualPlaneStaticUTF16Test from "./charStatic/CharIsInBasicMultilingualPlaneStaticUTF16Test.test";
import CharIsLetterStaticCharTest from "./charStatic/CharIsLetterStaticCharTest.test";
import CharIsLowerCaseStaticCharTest from "./charStatic/CharIsLowerCaseStaticCharTest.test";
import CharIsPartOfSurrogatePairStaticCharTest from "./charStatic/CharIsPartOfSurrogatePairStaticCharTest.test";
import CharIsUpperCaseStaticCharTest from "./charStatic/CharIsUpperCaseStaticCharTest.test";
import CharIsWhiteSpaceStaticCharTest from "./charStatic/CharIsWhiteSpaceStaticCharTest.test";
import CharToByteStaticTest from "./charStatic/CharToByteStaticTest.test";
import CharToCharStaticTest from "./charStatic/CharToCharStaticTest.test";
import CharToDoubleStaticTest from "./charStatic/CharToDoubleStaticTest.test";
import CharToFloatStaticTest from "./charStatic/CharToFloatStaticTest.test";
import CharToIntStaticTest from "./charStatic/CharToIntStaticTest.test";
import CharToLongStaticTest from "./charStatic/CharToLongStaticTest.test";
import CharToLowerCaseStaticCharTest from "./charStatic/CharToLowerCaseStaticCharTest.test";
import CharToShortStaticTest from "./charStatic/CharToShortStaticTest.test";
import CharToUpperCaseStaticCharTest from "./charStatic/CharToUpperCaseStaticCharTest.test";

import CharCharsToCodePointTest from "./char/CharCharsToCodePointTest.test";
import CharCodeUnitsToEncodeTest from "./char/CharCodeUnitsToEncodeTest.test";
import CharCompareTest from "./char/CharCompareTest.test";
import CharCompareToTest from "./char/CharCompareToTest.test";
import CharConstructor1Test from "./char/CharConstructor1Test.test";
import CharConstructor2Test from "./char/CharConstructor2Test.test";
import CharEqualsTest from "./char/CharEqualsTest.test";
import CharGetHighSurrogateTest from "./char/CharGetHighSurrogateTest.test";
import CharGetLowSurrogateTest from "./char/CharGetLowSurrogateTest.test";
import CharIsBinDigitInstanceTest from "./char/CharIsBinDigitInstanceTest.test";
import CharIsDecDigitInstanceTest from "./char/CharIsDecDigitInstanceTest.test";
import CharIsHexDigitInstanceTest from "./char/CharIsHexDigitInstanceTest.test";
import CharIsHighSurrogateTest from "./char/CharIsHighSurrogateTest.test";
import CharIsInBasicMultilingualPlaneInstanceTest from "./char/CharIsInBasicMultilingualPlaneInstanceTest.test";
import CharIsLetterInstanceTest from "./char/CharIsLetterInstanceTest.test";
import CharIsLowerCaseInstanceTest from "./char/CharIsLowerCaseInstanceTest.test";
import CharIsLowSurrogateTest from "./char/CharIsLowSurrogateTest.test";
import CharIsPartOfSurrogatePairInstanceTest from "./char/CharIsPartOfSurrogatePairInstanceTest.test";
import CharIsUpperCaseInstanceTest from "./char/CharIsUpperCaseInstanceTest.test";
import CharIsValidCodePointTest from "./char/CharIsValidCodePointTest.test";
import CharIsWhiteSpaceInstanceTest from "./char/CharIsWhiteSpaceInstanceTest.test";
import CharPropertiesTest from "./char/CharPropertiesTest.test";
import CharToByteTest from "./char/CharToByteTest.test";
import CharToCharTest from "./char/CharToCharTest.test";
import CharToDoubleTest from "./char/CharToDoubleTest.test";
import CharToFloatTest from "./char/CharToFloatTest.test";
import CharToIntTest from "./char/CharToIntTest.test";
import CharToLongTest from "./char/CharToLongTest.test";
import CharToLowerCaseInstanceTest from "./char/CharToLowerCaseInstanceTest.test";
import CharToShortTest from "./char/CharToShortTest.test";
import CharToStringTest from "./char/CharToStringTest.test";
import CharToUpperCaseInstanceTest from "./char/CharToUpperCaseInstanceTest.test";
import CloneableCloneTest from "./char/CloneableCloneTest.test";

export default function testsuite(): void {
  CharIsBinDigitStaticCharTest();
  CharIsDecDigitStaticCharTest();
  CharIsHexDigitStaticCharTest();
  CharIsInBasicMultilingualPlaneStaticCharTest();
  CharIsInBasicMultilingualPlaneStaticUTF16Test();
  CharIsLetterStaticCharTest();
  CharIsLowerCaseStaticCharTest();
  CharIsPartOfSurrogatePairStaticCharTest();
  CharIsUpperCaseStaticCharTest();
  CharIsWhiteSpaceStaticCharTest();
  CharToByteStaticTest();
  CharToCharStaticTest();
  CharToDoubleStaticTest();
  CharToFloatStaticTest();
  CharToIntStaticTest();
  CharToLongStaticTest();
  CharToLowerCaseStaticCharTest();
  CharToShortStaticTest();
  CharToUpperCaseStaticCharTest();

  CharCharsToCodePointTest();
  CharCodeUnitsToEncodeTest();
  CharCompareTest();
  CharCompareToTest();
  CharConstructor1Test();
  CharConstructor2Test();
  CharEqualsTest();
  CharGetHighSurrogateTest();
  CharGetLowSurrogateTest();
  CharIsBinDigitInstanceTest();
  CharIsDecDigitInstanceTest();
  CharIsHexDigitInstanceTest();
  CharIsHighSurrogateTest();
  CharIsInBasicMultilingualPlaneInstanceTest();
  CharIsLetterInstanceTest();
  CharIsLowerCaseInstanceTest();
  CharIsLowSurrogateTest();
  CharIsPartOfSurrogatePairInstanceTest();
  CharIsUpperCaseInstanceTest();
  CharIsValidCodePointTest();
  CharIsWhiteSpaceInstanceTest();
  CharPropertiesTest();
  CharToByteTest();
  CharToCharTest();
  CharToDoubleTest();
  CharToFloatTest();
  CharToIntTest();
  CharToLongTest();
  CharToLowerCaseInstanceTest();
  CharToShortTest();
  CharToStringTest();
  CharToUpperCaseInstanceTest();
  CloneableCloneTest();
}
