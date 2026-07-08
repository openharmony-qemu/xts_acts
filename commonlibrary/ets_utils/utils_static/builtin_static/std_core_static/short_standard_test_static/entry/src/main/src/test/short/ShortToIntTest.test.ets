'use static'

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

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

function invokeShortToIntInFunction(inputValue: short): int {
  return Short.toInt(inputValue);
}

export default function shortToIntTest(): void {
  describe('ShortToIntTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOINT_0100
     * @tc.name testShortToInt001
     * @tc.desc Verify static toInt with short zero value returns exact int zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroValue: short = 0 as short;
      let actualResult: int = Short.toInt(zeroValue);
      expect(actualResult).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOINT_0200
     * @tc.name testShortToInt002
     * @tc.desc Verify static toInt with positive normal short value preserves exact int value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToInt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveValue: short = 42 as short;
      let actualResult: int = Short.toInt(positiveValue);
      expect(actualResult).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOINT_0300
     * @tc.name testShortToInt003
     * @tc.desc Verify static toInt with Short.MAX_VALUE preserves exact upper boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToInt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxShortValue: short = Short.MAX_VALUE;
      let actualResult: int = Short.toInt(maxShortValue);
      expect(actualResult).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOINT_0400
     * @tc.name testShortToInt004
     * @tc.desc Verify static toInt with negative normal short value preserves sign and exact int value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToInt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeValue: short = (-42) as short;
      let actualResult: int = Short.toInt(negativeValue);
      expect(actualResult).assertEqual(-42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOINT_0500
     * @tc.name testShortToInt005
     * @tc.desc Verify static toInt with Short.MIN_VALUE preserves exact lower boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToInt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minShortValue: short = Short.MIN_VALUE;
      let actualResult: int = Short.toInt(minShortValue);
      expect(actualResult).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOINT_0600
     * @tc.name testShortToInt006
     * @tc.desc Verify static toInt with equivalence matrix covering zero positive negative and boundary short values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToInt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testValues: short[] = [
        0 as short,
        1 as short,
        127 as short,
        Short.MAX_VALUE,
        (-1) as short,
        (-128) as short,
        Short.MIN_VALUE
      ];
      let expectedValues: int[] = [
        0,
        1,
        127,
        32767,
        -1,
        -128,
        -32768
      ];
      let caseCount: int = 7;
      for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
        let actualResult: int = Short.toInt(testValues[caseIndex]);
        expect(actualResult).assertEqual(expectedValues[caseIndex]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOINT_0700
     * @tc.name testShortToInt007
     * @tc.desc Verify static toInt with adjacent short boundaries preserves MAX_VALUE minus one and MIN_VALUE plus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToInt007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxAdjacentValue: short = 32766 as short;
      let minAdjacentValue: short = (-32767) as short;
      let maxAdjacentResult: int = Short.toInt(maxAdjacentValue);
      let minAdjacentResult: int = Short.toInt(minAdjacentValue);
      expect(maxAdjacentResult).assertEqual(32766);
      expect(minAdjacentResult).assertEqual(-32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOINT_0800
     * @tc.name testShortToInt008
     * @tc.desc Verify static toInt returns values within int range for representative short widening conversions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToInt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testValues: short[] = [
        Short.MIN_VALUE,
        (-16384) as short,
        0 as short,
        16384 as short,
        Short.MAX_VALUE
      ];
      let expectedValues: int[] = [
        -32768,
        -16384,
        0,
        16384,
        32767
      ];
      let caseCount: int = 5;
      for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
        let actualResult: int = Short.toInt(testValues[caseIndex]);
        expect(actualResult).assertEqual(expectedValues[caseIndex]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOINT_0900
     * @tc.name testShortToInt009
     * @tc.desc Verify static toInt is callable through Short class name without instance dependency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToInt009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroValue: short = 0 as short;
      let negativeValue: short = (-1) as short;
      let positiveValue: short = 255 as short;
      let zeroResult: int = Short.toInt(zeroValue);
      let negativeResult: int = Short.toInt(negativeValue);
      let positiveResult: int = Short.toInt(positiveValue);
      let repeatedZeroResult: int = Short.toInt(zeroValue);
      let repeatedPositiveResult: int = Short.toInt(positiveValue);
      expect(zeroResult).assertEqual(0);
      expect(negativeResult).assertEqual(-1);
      expect(positiveResult).assertEqual(255);
      expect(repeatedZeroResult).assertEqual(zeroResult);
      expect(repeatedPositiveResult).assertEqual(positiveResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOINT_1000
     * @tc.name testShortToInt010
     * @tc.desc Verify static toInt idempotence with multiple short values under repeated invocations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToInt010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testValues: short[] = [
        0 as short,
        1 as short,
        Short.MAX_VALUE,
        (-1) as short,
        Short.MIN_VALUE
      ];
      let expectedValues: int[] = [
        0,
        1,
        32767,
        -1,
        -32768
      ];
      let caseCount: int = 5;
      for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
        let inputValue: short = testValues[caseIndex];
        let expectedResult: int = expectedValues[caseIndex];
        let firstCallResult: int = Short.toInt(inputValue);
        let secondCallResult: int = Short.toInt(inputValue);
        let thirdCallResult: int = Short.toInt(inputValue);
        expect(firstCallResult).assertEqual(expectedResult);
        expect(secondCallResult).assertEqual(expectedResult);
        expect(thirdCallResult).assertEqual(expectedResult);
        expect(secondCallResult).assertEqual(firstCallResult);
        expect(thirdCallResult).assertEqual(firstCallResult);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOINT_1100
     * @tc.name testShortToInt011
     * @tc.desc Verify static toInt returns consistent conversion results across direct and function invocation contexts
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToInt011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = 255 as short;
      let directResult: int = Short.toInt(inputValue);
      let functionResult: int = invokeShortToIntInFunction(inputValue);
      let repeatedDirectResult: int = Short.toInt(inputValue);
      expect(directResult).assertEqual(255);
      expect(functionResult).assertEqual(255);
      expect(repeatedDirectResult).assertEqual(255);
      expect(functionResult).assertEqual(directResult);
      expect(repeatedDirectResult).assertEqual(directResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOINT_1200
     * @tc.name testShortToInt012
     * @tc.desc Verify static toInt has no side effects when interleaved calls use different short inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToInt012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let primaryInput: short = 1024 as short;
      let secondaryInput: short = 2048 as short;
      let firstPrimaryResult: int = Short.toInt(primaryInput);
      let secondaryResult: int = Short.toInt(secondaryInput);
      let secondPrimaryResult: int = Short.toInt(primaryInput);
      expect(firstPrimaryResult).assertEqual(1024);
      expect(secondaryResult).assertEqual(2048);
      expect(secondPrimaryResult).assertEqual(1024);
      expect(secondPrimaryResult).assertEqual(firstPrimaryResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOINT_1300
     * @tc.name testShortToInt013
     * @tc.desc Verify instance toInt matches static toInt for normal adjacent and boundary short values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToInt013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testValues: short[] = [
        0 as short,
        42 as short,
        (-42) as short,
        32766 as short,
        (-32767) as short,
        Short.MAX_VALUE,
        Short.MIN_VALUE
      ];
      let expectedValues: int[] = [
        0,
        42,
        -42,
        32766,
        -32767,
        32767,
        -32768
      ];
      let caseCount: int = 7;
      for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
        let boxedValue: Short = new Short(testValues[caseIndex]);
        let instanceResult: int = boxedValue.toInt();
        let staticResult: int = Short.toInt(testValues[caseIndex]);
        expect(instanceResult).assertEqual(expectedValues[caseIndex]);
        expect(staticResult).assertEqual(expectedValues[caseIndex]);
        expect(instanceResult).assertEqual(staticResult);
        expect(boxedValue.toShort()).assertEqual(testValues[caseIndex]);
      }
    });
  });
}
