'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import UtilTest from './UtilInterface.test';
import Util2Test from './util/UtilInterface2.test';

import Base64HelperTest from './util/Base64HelperTest.test';
import Base64Helper02Test from './util/Base64HelperTest02.test';
import Base64Helper03Test from './util/Base64HelperTest03.test';
import LRUCacheTest from './util/LRUCacheTest.test';
import LRUCache02Test from './util/LRUCacheTest02.test';
import LRUCache03Test from './util/LRUCacheTest03.test';
import LRUCache04Test from './util/LRUCacheTest04.test';
import LRUCache05Test from './util/LRUCacheTest05.test';
import RationalNumberTest from './util/RationalNumberTest.test';
import RationalNumber02Test from './util/RationalNumberTest02.test';
import RationalNumber03Test from './util/RationalNumberTest03.test';
import RationalNumber04Test from './util/RationalNumberTest04.test';
import StringDecoder01Test from './util/StringDecoderTest01.test';
import StringDecoder02Test from './util/StringDecoderTest02.test';
import TextDecoderTest from './util/TextDecoderTest.test';
import TextDecoder02Test from './util/TextDecoderTest02.test';
import TextEncoderTest from './util/TextEncoderTest.test';
import TextEncoder02Test from './util/TextEncoderTest02.test';
import Util1Test from './util/Util.test';

import decodeToStringOptionsProperties01Test from './util01/DecodeToStringOptionsProperties01Test.test';
import decodeToStringOptionsProperties02Test from './util01/DecodeToStringOptionsProperties02Test.test';
import encodeIntoUint8ArrayInfoProperties01Test from './util01/EncodeIntoUint8ArrayInfoProperties01Test.test';
import encodeIntoUint8ArrayInfoProperties02Test from './util01/EncodeIntoUint8ArrayInfoProperties02Test.test';
import rationalNumberCompare01Test from './util01/RationalNumberCompare01Test.test';
import rationalNumberCompare02Test from './util01/RationalNumberCompare02Test.test';
import rationalNumberCompare03Test from './util01/RationalNumberCompare03Test.test';
import rationalNumberConstructor01Test from './util01/RationalNumberConstructor01Test.test';
import rationalNumberCreateRationalFromString01Test from './util01/RationalNumberCreateRationalFromString01Test.test';
import rationalNumberCreateRationalFromString02Test from './util01/RationalNumberCreateRationalFromString02Test.test';
import rationalNumberCreateRationalFromString03Test from './util01/RationalNumberCreateRationalFromString03Test.test';
import rationalNumberEquals01Test from './util01/RationalNumberEquals01Test.test';
import rationalNumberEquals02Test from './util01/RationalNumberEquals02Test.test';
import rationalNumberEquals03Test from './util01/RationalNumberEquals03Test.test';
import rationalNumberGetCommonFactor01Test from './util01/RationalNumberGetCommonFactor01Test.test';
import rationalNumberGetCommonFactor02Test from './util01/RationalNumberGetCommonFactor02Test.test';
import rationalNumberGetDenominator01Test from './util01/RationalNumberGetDenominator01Test.test';
import rationalNumberGetDenominator02Test from './util01/RationalNumberGetDenominator02Test.test';
import rationalNumberGetNumerator01Test from './util01/RationalNumberGetNumerator01Test.test';
import rationalNumberGetNumerator02Test from './util01/RationalNumberGetNumerator02Test.test';
import rationalNumberIsFinite01Test from './util01/RationalNumberIsFinite01Test.test';
import rationalNumberIsFinite02Test from './util01/RationalNumberIsFinite02Test.test';
import rationalNumberIsNaN01Test from './util01/RationalNumberIsNaN01Test.test';
import rationalNumberIsNaN02Test from './util01/RationalNumberIsNaN02Test.test';
import rationalNumberIsZero01Test from './util01/RationalNumberIsZero01Test.test';
import rationalNumberOverview01Test from './util01/RationalNumberOverview01Test.test';
import rationalNumberOverview02Test from './util01/RationalNumberOverview02Test.test';
import rationalNumberOverview03Test from './util01/RationalNumberOverview03Test.test';
import rationalNumberParseRationalNumber01Test from './util01/RationalNumberParseRationalNumber01Test.test';
import rationalNumberParseRationalNumber02Test from './util01/RationalNumberParseRationalNumber02Test.test';
import rationalNumberParseRationalNumber03Test from './util01/RationalNumberParseRationalNumber03Test.test';
import rationalNumberToString01Test from './util01/RationalNumberToString01Test.test';
import rationalNumberToString02Test from './util01/RationalNumberToString02Test.test';
import rationalNumberValueOf01Test from './util01/RationalNumberValueOf01Test.test';
import rationalNumberValueOf02Test from './util01/RationalNumberValueOf02Test.test';

import typesIsRegExpTest from './util02/TypesIsRegExpTest.test';
import typesIsSetIteratorTest from './util02/TypesIsSetIteratorTest.test';
import typesIsSetTest from './util02/TypesIsSetTest.test';
import typesIsTypedArrayTest from './util02/TypesIsTypedArrayTest.test';
import typesIsUint16ArrayTest from './util02/TypesIsUint16ArrayTest.test';
import typesIsUint32ArrayTest from './util02/TypesIsUint32ArrayTest.test';
import typesIsUint8ArrayTest from './util02/TypesIsUint8ArrayTest.test';
import typesIsUint8ClampedArrayTest from './util02/TypesIsUint8ClampedArrayTest.test';
import typesIsWeakMapTest from './util02/TypesIsWeakMapTest.test';
import typesIsWeakSetTest from './util02/TypesIsWeakSetTest.test';
import typesOverviewTest from './util02/TypesOverviewTest.test';
import utilCallbackWrapperTest from './util02/UtilCallbackWrapperTest.test';
import utilErrnoToStringTest from './util02/UtilErrnoToStringTest.test';
import utilFormatTest from './util02/UtilFormatTest.test';
import utilGenerateRandomBinaryUuidTest from './util02/UtilGenerateRandomBinaryUuidTest.test';
import utilGenerateRandomUuidTest from './util02/UtilGenerateRandomUuidTest.test';
import utilGetHashTest from './util02/UtilGetHashTest.test';
import utilGetMainThreadStackTraceTest from './util02/UtilGetMainThreadStackTraceTest.test';

export default function testsuite(): void {
  UtilTest();
  Util2Test();

  Base64HelperTest();
  Base64Helper02Test();
  Base64Helper03Test();
  LRUCacheTest();
  LRUCache02Test();
  LRUCache03Test();
  LRUCache04Test();
  LRUCache05Test();
  RationalNumberTest();
  RationalNumber02Test();
  RationalNumber03Test();
  RationalNumber04Test();
  StringDecoder01Test();
  StringDecoder02Test();
  TextDecoderTest();
  TextDecoder02Test();
  TextEncoderTest();
  TextEncoder02Test();
  Util1Test();

  decodeToStringOptionsProperties01Test();
  decodeToStringOptionsProperties02Test();
  encodeIntoUint8ArrayInfoProperties01Test();
  encodeIntoUint8ArrayInfoProperties02Test();
  rationalNumberCompare01Test();
  rationalNumberCompare02Test();
  rationalNumberCompare03Test();
  rationalNumberConstructor01Test();
  rationalNumberCreateRationalFromString01Test();
  rationalNumberCreateRationalFromString02Test();
  rationalNumberCreateRationalFromString03Test();
  rationalNumberEquals01Test();
  rationalNumberEquals02Test();
  rationalNumberEquals03Test();
  rationalNumberGetCommonFactor01Test();
  rationalNumberGetCommonFactor02Test();
  rationalNumberGetDenominator01Test();
  rationalNumberGetDenominator02Test();
  rationalNumberGetNumerator01Test();
  rationalNumberGetNumerator02Test();
  rationalNumberIsFinite01Test();
  rationalNumberIsFinite02Test();
  rationalNumberIsNaN01Test();
  rationalNumberIsNaN02Test();
  rationalNumberIsZero01Test();
  rationalNumberOverview01Test();
  rationalNumberOverview02Test();
  rationalNumberOverview03Test();
  rationalNumberParseRationalNumber01Test();
  rationalNumberParseRationalNumber02Test();
  rationalNumberParseRationalNumber03Test();
  rationalNumberToString01Test();
  rationalNumberToString02Test();
  rationalNumberValueOf01Test();
  rationalNumberValueOf02Test();

  typesIsRegExpTest();
  typesIsSetIteratorTest();
  typesIsSetTest();
  typesIsTypedArrayTest();
  typesIsUint16ArrayTest();
  typesIsUint32ArrayTest();
  typesIsUint8ArrayTest();
  typesIsUint8ClampedArrayTest();
  typesIsWeakMapTest();
  typesIsWeakSetTest();
  typesOverviewTest();
  utilCallbackWrapperTest();
  utilErrnoToStringTest();
  utilFormatTest();
  utilGenerateRandomBinaryUuidTest();
  utilGenerateRandomUuidTest();
  utilGetHashTest();
  utilGetMainThreadStackTraceTest();
}
