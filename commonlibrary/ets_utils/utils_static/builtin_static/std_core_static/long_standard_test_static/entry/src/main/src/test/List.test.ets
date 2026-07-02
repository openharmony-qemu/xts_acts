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

}