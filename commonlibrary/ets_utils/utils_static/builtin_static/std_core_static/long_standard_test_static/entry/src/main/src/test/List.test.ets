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

import longAddTest from "./long/LongAddTest.test";
import longCompareToTest from "./long/LongCompareToTest.test";
import longConstructor1Test from "./long/LongConstructor1Test.test";
import longConstructor2Test from "./long/LongConstructor2Test.test";
import longChainTest from "./long/LongChainTest.test";
import longCrossTypeAddTest from "./long/LongCrossTypeAddTest.test";
import longCrossTypeCmpTest from "./long/LongCrossTypeCmpTest.test";
import longCrossTypeSubDivTest from "./long/LongCrossTypeSubDivTest.test";
import longDivTest from "./long/LongDivTest.test";
import longBoundaryTest from "./long/LongBoundaryTest.test";
import longEqualsTest from "./long/LongEqualsTest.test";
import longIsGreaterEqualThanTest from "./long/LongIsGreaterEqualThanTest.test";
import longIsGreaterThanTest from "./long/LongIsGreaterThanTest.test";
import longIsLessEqualThanTest from "./long/LongIsLessEqualThanTest.test";
import longIsLessThanTest from "./long/LongIsLessThanTest.test";
import longMulTest from "./long/LongMulTest.test";
import longParseIntTest from "./long/LongParseIntTest.test";
import longParseIntRadixTest from "./long/LongParseIntRadixTest.test";
import longStaticConstantTest from "./long/LongStaticConstantTest.test";
import longSubTest from "./long/LongSubTest.test";
import longToByte1Test from "./long/LongToByte1Test.test";
import longToByte2Test from "./long/LongToByte2Test.test";
import longToChar1Test from "./long/LongToChar1Test.test";
import longToChar2Test from "./long/LongToChar2Test.test";
import longToDouble1Test from "./long/LongToDouble1Test.test";
import longToDouble2Test from "./long/LongToDouble2Test.test";
import longToFloat1Test from "./long/LongToFloat1Test.test";
import longToFloat2Test from "./long/LongToFloat2Test.test";
import longToInt1Test from "./long/LongToInt1Test.test";
import longToInt2Test from "./long/LongToInt2Test.test";
import longToLocaleString1Test from "./long/LongToLocaleString1Test.test";
import longToLocaleString2Test from "./long/LongToLocaleString2Test.test";
import longTolong1Test from "./long/LongToLong1Test.test";
import longTolong2Test from "./long/LongToLong2Test.test";
import longToShort1Test from "./long/LongToShort1Test.test";
import longToShort2Test from "./long/LongToShort2Test.test";
import longToString1Test from "./long/LongToString1Test.test";
import longToString2Test from "./long/LongToString2Test.test";
import longToString3Test from "./long/LongToString3Test.test";
import longToStringRadixTest from "./long/LongToStringRadixTest.test";
import longMinValuePlusCaseTest from './long/LongMinValuePlusCaseTest.test';

import longAdd1Test from "./long1/LongAdd1Test.test";
import longCompareTo1Test from "./long1/LongCompareTo1Test.test";
import longConstructor3Test from "./long1/LongConstructor3Test.test";
import longDiv1Test from "./long1/LongDiv1Test.test";
import longEquals1Test from "./long1/LongEquals1Test.test";
import longIsGreaterEqualThan1Test from "./long1/LongIsGreaterEqualThan1Test.test";
import longIsGreaterThan1Test from "./long1/LongIsGreaterThan1Test.test";
import longIsLessEqualThan1Test from "./long1/LongIsLessEqualThan1Test.test";
import longIsLessThan1Test from "./long1/LongIsLessThan1Test.test";
import longMul1Test from "./long1/LongMul1Test.test";
import longOverall1Part1Test from "./long1/LongOverall1Part1Test.test";
import longOverall1Part2Test from "./long1/LongOverall1Part2Test.test";
import longOverall1Part3Test from "./long1/LongOverall1Part3Test.test";
import longOverall1Part4Test from "./long1/LongOverall1Part4Test.test";
import longOverall1Part5Test from "./long1/LongOverall1Part5Test.test";
import longParseInt1Test from "./long1/LongParseInt1Test.test";
import longProperty1Part1Test from "./long1/LongProperty1Part1Test.test";
import longProperty1Part2Test from "./long1/LongProperty1Part2Test.test";
import longProperty1Part3Test from "./long1/LongProperty1Part3Test.test";
import longSub1Test from "./long1/LongSub1Test.test";
import longToByte3Part1Test from "./long1/LongToByte3Part1Test.test";
import longToChar3Part1Test from "./long1/LongToChar3Part1Test.test";
import longToChar3Part2Test from "./long1/LongToChar3Part2Test.test";
import longToDouble3Test from "./long1/LongToDouble3Test.test";
import longToFloat3Test from "./long1/LongToFloat3Test.test";
import longToInt3Test from "./long1/LongToInt3Test.test";
import longToLocaleString3Test from "./long1/LongToLocaleString3Test.test";
import longToLong3Test from "./long1/LongToLong3Test.test";
import longToShort3Test from "./long1/LongToShort3Test.test";
import longToString4Test from "./long1/LongToString4Test.test";

export default function testSuite(): void {

  longAddTest();
  longCompareToTest();
  longConstructor1Test();
  longConstructor2Test();
  longChainTest();
  longCrossTypeAddTest();
  longCrossTypeCmpTest();
  longCrossTypeSubDivTest();
  longDivTest();
  longBoundaryTest();
  longEqualsTest();
  longIsGreaterEqualThanTest();
  longIsGreaterThanTest();
  longIsLessEqualThanTest();
  longIsLessThanTest();
  longMulTest();
  longParseIntTest();
  longParseIntRadixTest();
  longStaticConstantTest();
  longSubTest();
  longToByte1Test();
  longToByte2Test();
  longToChar1Test();
  longToChar2Test();
  longToDouble1Test();
  longToDouble2Test();
  longToFloat1Test();
  longToFloat2Test();
  longToInt1Test();
  longToInt2Test();
  longToLocaleString1Test();
  longToLocaleString2Test();
  longTolong1Test();
  longTolong2Test();
  longToShort1Test();
  longToShort2Test();
  longToString1Test();
  longToString2Test();
  longToString3Test();
  longToStringRadixTest();
  longMinValuePlusCaseTest();

  longAdd1Test();
  longCompareTo1Test();
  longConstructor3Test();
  longDiv1Test();
  longEquals1Test();
  longIsGreaterEqualThan1Test();
  longIsGreaterThan1Test();
  longIsLessEqualThan1Test();
  longIsLessThan1Test();
  longMul1Test();
  longOverall1Part1Test();
  longOverall1Part2Test();
  longOverall1Part3Test();
  longOverall1Part4Test();
  longOverall1Part5Test();
  longParseInt1Test();
  longProperty1Part1Test();
  longProperty1Part2Test();
  longProperty1Part3Test();
  longSub1Test();
  longToByte3Part1Test();
  longToChar3Part1Test();
  longToChar3Part2Test();
  longToDouble3Test();
  longToFloat3Test();
  longToInt3Test();
  longToLocaleString3Test();
  longToLong3Test();
  longToShort3Test();
  longToString4Test();

}