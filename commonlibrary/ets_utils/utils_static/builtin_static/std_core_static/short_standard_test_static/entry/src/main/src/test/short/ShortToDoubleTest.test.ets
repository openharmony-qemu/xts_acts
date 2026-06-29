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
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function shortToDoubleTest(): void {
  describe('ShortToDoubleTest', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TODOUBLE_0100
     * @tc.name testShortToDouble001
     * @tc.desc Verify static toDouble with positive short values preserves exact double conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToDouble001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let smallPositiveValue: short = 1 as short;
      let middlePositiveValue: short = 100 as short;
      let smallPositiveResult: double = Short.toDouble(smallPositiveValue);
      let middlePositiveResult: double = Short.toDouble(middlePositiveValue);
      expect(smallPositiveResult).assertEqual(1.0);
      expect(middlePositiveResult).assertEqual(100.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TODOUBLE_0200
     * @tc.name testShortToDouble002
     * @tc.desc Verify static toDouble with negative short values preserves exact double conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToDouble002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let smallNegativeValue: short = (-1) as short;
      let middleNegativeValue: short = (-100) as short;
      let smallNegativeResult: double = Short.toDouble(smallNegativeValue);
      let middleNegativeResult: double = Short.toDouble(middleNegativeValue);
      expect(smallNegativeResult).assertEqual(-1.0);
      expect(middleNegativeResult).assertEqual(-100.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TODOUBLE_0300
     * @tc.name testShortToDouble003
     * @tc.desc Verify static toDouble with Short.MAX_VALUE preserves exact boundary conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToDouble003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxShortValue: short = Short.MAX_VALUE;
      let actualResult: double = Short.toDouble(maxShortValue);
      expect(actualResult).assertEqual(32767.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TODOUBLE_0400
     * @tc.name testShortToDouble004
     * @tc.desc Verify static toDouble with Short.MIN_VALUE preserves exact boundary conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToDouble004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minShortValue: short = Short.MIN_VALUE;
      let actualResult: double = Short.toDouble(minShortValue);
      expect(actualResult).assertEqual(-32768.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TODOUBLE_0500
     * @tc.name testShortToDouble005
     * @tc.desc Verify static toDouble with zero and representative valid short values returns exact double values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToDouble005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroValue: short = 0 as short;
      let positiveByteOverflowValue: short = 128 as short;
      let negativeMiddleValue: short = (-256) as short;
      let zeroResult: double = Short.toDouble(zeroValue);
      let positiveByteOverflowResult: double = Short.toDouble(positiveByteOverflowValue);
      let negativeMiddleResult: double = Short.toDouble(negativeMiddleValue);
      expect(zeroResult).assertEqual(0.0);
      expect(positiveByteOverflowResult).assertEqual(128.0);
      expect(negativeMiddleResult).assertEqual(-256.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TODOUBLE_0600
     * @tc.name testShortToDouble006
     * @tc.desc Verify static toDouble precision across short zero sign boundary and adjacent boundary values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToDouble006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testValues: short[] = [
        0 as short,
        1 as short,
        (-1) as short,
        32766 as short,
        (-32767) as short,
        127 as short,
        (-128) as short
      ];
      let expectedValues: double[] = [
        0.0,
        1.0,
        -1.0,
        32766.0,
        -32767.0,
        127.0,
        -128.0
      ];
      let caseCount: int = 7;
      for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
        let actualResult: double = Short.toDouble(testValues[caseIndex]);
        expect(actualResult).assertEqual(expectedValues[caseIndex]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TODOUBLE_0700
     * @tc.name testShortToDouble007
     * @tc.desc Verify static toDouble callable via Short class name without instance dependency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToDouble007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroValue: short = 0 as short;
      let positiveValue: short = 1 as short;
      let negativeValue: short = (-1) as short;
      let maxShortValue: short = Short.MAX_VALUE;
      let minShortValue: short = Short.MIN_VALUE;
      let zeroResult: double = Short.toDouble(zeroValue);
      let positiveResult: double = Short.toDouble(positiveValue);
      let negativeResult: double = Short.toDouble(negativeValue);
      let maxShortResult: double = Short.toDouble(maxShortValue);
      let minShortResult: double = Short.toDouble(minShortValue);
      expect(zeroResult).assertEqual(0.0);
      expect(positiveResult).assertEqual(1.0);
      expect(negativeResult).assertEqual(-1.0);
      expect(maxShortResult).assertEqual(32767.0);
      expect(minShortResult).assertEqual(-32768.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TODOUBLE_0800
     * @tc.name testShortToDouble008
     * @tc.desc Verify static toDouble idempotence with same short input across repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToDouble008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let repeatedValue: short = 12345 as short;
      let firstResult: double = Short.toDouble(repeatedValue);
      let secondResult: double = Short.toDouble(repeatedValue);
      let thirdResult: double = Short.toDouble(repeatedValue);
      expect(firstResult).assertEqual(12345.0);
      expect(secondResult).assertEqual(12345.0);
      expect(thirdResult).assertEqual(12345.0);
      expect(firstResult).assertEqual(secondResult);
      expect(secondResult).assertEqual(thirdResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TODOUBLE_0900
     * @tc.name testShortToDouble009
     * @tc.desc Verify static toDouble idempotence with diverse short values including boundary extremes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToDouble009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testValues: short[] = [
        0 as short,
        256 as short,
        (-128) as short,
        Short.MAX_VALUE,
        Short.MIN_VALUE
      ];
      let expectedValues: double[] = [
        0.0,
        256.0,
        -128.0,
        32767.0,
        -32768.0
      ];
      let caseCount: int = 5;
      for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
        let firstResult: double = Short.toDouble(testValues[caseIndex]);
        let secondResult: double = Short.toDouble(testValues[caseIndex]);
        let thirdResult: double = Short.toDouble(testValues[caseIndex]);
        expect(firstResult).assertEqual(expectedValues[caseIndex]);
        expect(secondResult).assertEqual(expectedValues[caseIndex]);
        expect(thirdResult).assertEqual(expectedValues[caseIndex]);
        expect(firstResult).assertEqual(secondResult);
        expect(secondResult).assertEqual(thirdResult);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TODOUBLE_1000
     * @tc.name testShortToDouble010
     * @tc.desc Verify instance toDouble matches static toDouble for normal adjacent and boundary short values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToDouble010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testValues: short[] = [
        0 as short,
        42 as short,
        (-42) as short,
        32766 as short,
        (-32767) as short,
        Short.MAX_VALUE,
        Short.MIN_VALUE
      ];
      let expectedValues: double[] = [
        0.0,
        42.0,
        -42.0,
        32766.0,
        -32767.0,
        32767.0,
        -32768.0
      ];
      let caseCount: int = 7;
      for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
        let boxedValue: Short = new Short(testValues[caseIndex]);
        let instanceResult: double = boxedValue.toDouble();
        let staticResult: double = Short.toDouble(testValues[caseIndex]);
        expect(instanceResult).assertEqual(expectedValues[caseIndex]);
        expect(staticResult).assertEqual(expectedValues[caseIndex]);
        expect(instanceResult).assertEqual(staticResult);
        expect(boxedValue.toShort()).assertEqual(testValues[caseIndex]);
      }
    });
  });
}
