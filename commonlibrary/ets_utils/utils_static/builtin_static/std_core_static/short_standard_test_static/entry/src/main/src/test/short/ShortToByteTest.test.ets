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

export default function shortToByteTest(): void {
  describe('ShortToByteTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOBYTE_0100
     * @tc.name testShortToByte001
     * @tc.desc Verify toByte method with valid short values zero positive and negative for correct byte truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToByte001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroValue: short = 0 as short;
      let positiveValue: short = 42 as short;
      let negativeValue: short = (-1) as short;
      let zeroResult: byte = Short.toByte(zeroValue);
      let positiveResult: byte = Short.toByte(positiveValue);
      let negativeResult: byte = Short.toByte(negativeValue);
      expect(zeroResult).assertEqual(0 as byte);
      expect(positiveResult).assertEqual(42 as byte);
      expect(negativeResult).assertEqual((-1) as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOBYTE_0200
     * @tc.name testShortToByte002
     * @tc.desc Verify toByte method with byte boundary values minus128 and 127 for correct conversion without overflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToByte002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minByteBoundary: short = (-128) as short;
      let maxByteBoundary: short = 127 as short;
      let minByteResult: byte = Short.toByte(minByteBoundary);
      let maxByteResult: byte = Short.toByte(maxByteBoundary);
      expect(minByteResult).assertEqual((-128) as byte);
      expect(maxByteResult).assertEqual(127 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOBYTE_0300
     * @tc.name testShortToByte003
     * @tc.desc Verify toByte method with overflow values 128 and minus129 for correct low 8 bit truncation behavior
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToByte003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveOverflowValue: short = 128 as short;
      let negativeOverflowValue: short = (-129) as short;
      let positiveOverflowResult: byte = Short.toByte(positiveOverflowValue);
      let negativeOverflowResult: byte = Short.toByte(negativeOverflowValue);
      expect(positiveOverflowResult).assertEqual((-128) as byte);
      expect(negativeOverflowResult).assertEqual(127 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOBYTE_0400
     * @tc.name testShortToByte004
     * @tc.desc Verify toByte method with short extreme values minus32768 and 32767 for correct low 8 bit byte truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToByte004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minShortValue: short = Short.MIN_VALUE;
      let maxShortValue: short = Short.MAX_VALUE;
      let minShortResult: byte = Short.toByte(minShortValue);
      let maxShortResult: byte = Short.toByte(maxShortValue);
      expect(minShortResult).assertEqual(0 as byte);
      expect(maxShortResult).assertEqual((-1) as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOBYTE_0500
     * @tc.name testShortToByte005
     * @tc.desc Verify toByte method returns the expected byte conversion result for representative short inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToByte005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroValue: short = 0 as short;
      let positiveValue: short = 99 as short;
      let negativeValue: short = (-50) as short;
      let zeroResult: byte = Short.toByte(zeroValue);
      let positiveResult: byte = Short.toByte(positiveValue);
      let negativeResult: byte = Short.toByte(negativeValue);
      let zeroResultAsInt: int = zeroResult;
      let positiveResultAsInt: int = positiveResult;
      let negativeResultAsInt: int = negativeResult;
      expect(zeroResult).assertEqual(0 as byte);
      expect(positiveResult).assertEqual(99 as byte);
      expect(negativeResult).assertEqual((-50) as byte);
      expect(zeroResultAsInt).assertEqual(0);
      expect(positiveResultAsInt).assertEqual(99);
      expect(negativeResultAsInt).assertEqual(-50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOBYTE_0600
     * @tc.name testShortToByte006
     * @tc.desc Verify toByte method matches expected truncation results across representative short inputs spanning the full range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToByte006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testValues: short[] = [
        Short.MIN_VALUE,
        (-16384) as short,
        (-128) as short,
        0 as short,
        127 as short,
        16383 as short,
        Short.MAX_VALUE
      ];
      let expectedValues: byte[] = [
        0 as byte,
        0 as byte,
        (-128) as byte,
        0 as byte,
        127 as byte,
        (-1) as byte,
        (-1) as byte
      ];
      let caseCount: int = 7;
      for (let i: int = 0; i < caseCount; i++) {
        let actualResult: byte = Short.toByte(testValues[i]);
        expect(actualResult).assertEqual(expectedValues[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOBYTE_0700
     * @tc.name testShortToByte007
     * @tc.desc Verify toByte method with opposite short values for symmetric truncation behavior including overflow complement rules
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToByte007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveFiveValue: short = 5 as short;
      let negativeFiveValue: short = (-5) as short;
      let positiveBoundaryValue: short = 127 as short;
      let negativeBoundaryValue: short = (-127) as short;
      let positiveOverflowValue: short = 128 as short;
      let negativeOverflowValue: short = (-128) as short;
      let positiveFiveResult: byte = Short.toByte(positiveFiveValue);
      let negativeFiveResult: byte = Short.toByte(negativeFiveValue);
      let positiveBoundaryResult: byte = Short.toByte(positiveBoundaryValue);
      let negativeBoundaryResult: byte = Short.toByte(negativeBoundaryValue);
      let positiveOverflowResult: byte = Short.toByte(positiveOverflowValue);
      let negativeOverflowResult: byte = Short.toByte(negativeOverflowValue);
      let positiveFiveAsInt: int = positiveFiveResult;
      let negativeFiveAsInt: int = negativeFiveResult;
      let positiveBoundaryAsInt: int = positiveBoundaryResult;
      let negativeBoundaryAsInt: int = negativeBoundaryResult;
      expect(positiveFiveResult).assertEqual(5 as byte);
      expect(negativeFiveResult).assertEqual((-5) as byte);
      expect(positiveFiveAsInt).assertEqual(-negativeFiveAsInt);
      expect(positiveBoundaryResult).assertEqual(127 as byte);
      expect(negativeBoundaryResult).assertEqual((-127) as byte);
      expect(positiveBoundaryAsInt).assertEqual(-negativeBoundaryAsInt);
      expect(positiveOverflowResult).assertEqual((-128) as byte);
      expect(negativeOverflowResult).assertEqual((-128) as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOBYTE_0800
     * @tc.name testShortToByte008
     * @tc.desc Verify toByte method with various legal short inputs normal overflow and extreme for stable narrowing conversion results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToByte008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let normalValue: short = 0 as short;
      let overflowValue: short = 128 as short;
      let extremeValue: short = Short.MAX_VALUE;
      let conversionResults: byte[] = [];
      conversionResults.push(Short.toByte(normalValue));
      conversionResults.push(Short.toByte(overflowValue));
      conversionResults.push(Short.toByte(extremeValue));
      expect(conversionResults[0]).assertEqual(0 as byte);
      expect(conversionResults[1]).assertEqual((-128) as byte);
      expect(conversionResults[2]).assertEqual((-1) as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOBYTE_0900
     * @tc.name testShortToByte009
     * @tc.desc Verify toByte as static native method callable via class name Short without instance dependency and consistent across repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToByte009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let repeatedInputValue: short = 100 as short;
      let zeroValue: short = 0 as short;
      let maxByteBoundary: short = 127 as short;
      let minByteBoundary: short = (-128) as short;
      let firstRepeatedResult: byte = Short.toByte(repeatedInputValue);
      let secondRepeatedResult: byte = Short.toByte(repeatedInputValue);
      let zeroResult: byte = Short.toByte(zeroValue);
      let maxBoundaryResult: byte = Short.toByte(maxByteBoundary);
      let minBoundaryResult: byte = Short.toByte(minByteBoundary);
      expect(firstRepeatedResult).assertEqual(100 as byte);
      expect(secondRepeatedResult).assertEqual(100 as byte);
      expect(firstRepeatedResult).assertEqual(secondRepeatedResult);
      expect(zeroResult).assertEqual(0 as byte);
      expect(maxBoundaryResult).assertEqual(127 as byte);
      expect(minBoundaryResult).assertEqual((-128) as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOBYTE_1000
     * @tc.name testShortToByte010
     * @tc.desc Verify toByte idempotency with normal short values zero positive and negative across three consecutive identical calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToByte010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testValues: short[] = [
        0 as short,
        42 as short,
        (-1) as short
      ];
      let expectedValues: byte[] = [
        0 as byte,
        42 as byte,
        (-1) as byte
      ];
      let caseCount: int = 3;
      for (let i: int = 0; i < caseCount; i++) {
        let firstResult: byte = Short.toByte(testValues[i]);
        let secondResult: byte = Short.toByte(testValues[i]);
        let thirdResult: byte = Short.toByte(testValues[i]);
        expect(firstResult).assertEqual(expectedValues[i]);
        expect(secondResult).assertEqual(expectedValues[i]);
        expect(thirdResult).assertEqual(expectedValues[i]);
        expect(firstResult).assertEqual(secondResult);
        expect(secondResult).assertEqual(thirdResult);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOBYTE_1100
     * @tc.name testShortToByte011
     * @tc.desc Verify toByte idempotency with byte boundary values minus128 and 127 across three consecutive identical calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToByte011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testValues: short[] = [
        (-128) as short,
        127 as short
      ];
      let expectedValues: byte[] = [
        (-128) as byte,
        127 as byte
      ];
      let caseCount: int = 2;
      for (let i: int = 0; i < caseCount; i++) {
        let firstResult: byte = Short.toByte(testValues[i]);
        let secondResult: byte = Short.toByte(testValues[i]);
        let thirdResult: byte = Short.toByte(testValues[i]);
        expect(firstResult).assertEqual(expectedValues[i]);
        expect(secondResult).assertEqual(expectedValues[i]);
        expect(thirdResult).assertEqual(expectedValues[i]);
        expect(firstResult).assertEqual(secondResult);
        expect(secondResult).assertEqual(thirdResult);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOBYTE_1200
     * @tc.name testShortToByte012
     * @tc.desc Verify toByte idempotency with overflow values 128 minus129 and short extreme 32767 across three consecutive identical calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToByte012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testValues: short[] = [
        128 as short,
        (-129) as short,
        Short.MAX_VALUE
      ];
      let expectedValues: byte[] = [
        (-128) as byte,
        127 as byte,
        (-1) as byte
      ];
      let caseCount: int = 3;
      for (let i: int = 0; i < caseCount; i++) {
        let firstResult: byte = Short.toByte(testValues[i]);
        let secondResult: byte = Short.toByte(testValues[i]);
        let thirdResult: byte = Short.toByte(testValues[i]);
        expect(firstResult).assertEqual(expectedValues[i]);
        expect(secondResult).assertEqual(expectedValues[i]);
        expect(thirdResult).assertEqual(expectedValues[i]);
        expect(firstResult).assertEqual(secondResult);
        expect(secondResult).assertEqual(thirdResult);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOBYTE_1300
     * @tc.name testShortToByte013
     * @tc.desc Verify toByte method with multiple distinct short values for independent results with no shared static state interference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToByte013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValues: short[] = [
        0 as short,
        1 as short,
        (-1) as short,
        127 as short,
        (-128) as short,
        128 as short,
        (-129) as short
      ];
      let expectedValues: byte[] = [
        0 as byte,
        1 as byte,
        (-1) as byte,
        127 as byte,
        (-128) as byte,
        (-128) as byte,
        127 as byte
      ];
      let caseCount: int = 7;
      for (let i: int = 0; i < caseCount; i++) {
        let actualResult: byte = Short.toByte(inputValues[i]);
        expect(actualResult).assertEqual(expectedValues[i]);
      }
      let repeatedOverflowResult: byte = Short.toByte(128 as short);
      expect(repeatedOverflowResult).assertEqual(expectedValues[5]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOBYTE_1400
     * @tc.name testShortToByte014
     * @tc.desc Verify toByte instance and static conversions return the same byte result for a normal short value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToByte014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValue: short = 42 as short;
      let boxedValue: Short = new Short(sourceValue);
      let instanceResult: byte = boxedValue.toByte();
      let staticResult: byte = Short.toByte(sourceValue);
      expect(instanceResult).assertEqual(42 as byte);
      expect(staticResult).assertEqual(42 as byte);
      expect(instanceResult).assertEqual(staticResult);
      expect(boxedValue.toShort()).assertEqual(sourceValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOBYTE_1500
     * @tc.name testShortToByte015
     * @tc.desc Verify toByte instance and static conversions return the same byte result for a byte boundary short value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToByte015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValue: short = (-128) as short;
      let boxedValue: Short = new Short(sourceValue);
      let instanceResult: byte = boxedValue.toByte();
      let staticResult: byte = Short.toByte(sourceValue);
      expect(instanceResult).assertEqual((-128) as byte);
      expect(staticResult).assertEqual((-128) as byte);
      expect(instanceResult).assertEqual(staticResult);
      expect(boxedValue.toShort()).assertEqual(sourceValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOBYTE_1600
     * @tc.name testShortToByte016
     * @tc.desc Verify toByte instance and static conversions return the same byte result for an overflow short value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToByte016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValue: short = 128 as short;
      let boxedValue: Short = new Short(sourceValue);
      let instanceResult: byte = boxedValue.toByte();
      let staticResult: byte = Short.toByte(sourceValue);
      expect(instanceResult).assertEqual((-128) as byte);
      expect(staticResult).assertEqual((-128) as byte);
      expect(instanceResult).assertEqual(staticResult);
      expect(boxedValue.toShort()).assertEqual(sourceValue);
    });
  });
}
