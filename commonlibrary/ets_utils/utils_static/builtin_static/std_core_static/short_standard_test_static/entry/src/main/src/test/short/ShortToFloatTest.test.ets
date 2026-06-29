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

export default function shortToFloatTest(): void {
  describe('ShortToFloatTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOFLOAT_0100
     * @tc.name testShortToFloat001
     * @tc.desc Verify static toFloat with zero value returns exact float zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToFloat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroValue: short = 0 as short;
      let actualResult: float = Short.toFloat(zeroValue);
      expect(actualResult).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOFLOAT_0200
     * @tc.name testShortToFloat002
     * @tc.desc Verify static toFloat with positive short value returns exact float value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToFloat002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveValue: short = 9 as short;
      let actualResult: float = Short.toFloat(positiveValue);
      expect(actualResult).assertEqual(9.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOFLOAT_0300
     * @tc.name testShortToFloat003
     * @tc.desc Verify static toFloat with large positive short value preserves exact float conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToFloat003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let largePositiveValue: short = 10000 as short;
      let actualResult: float = Short.toFloat(largePositiveValue);
      expect(actualResult).assertEqual(10000.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOFLOAT_0400
     * @tc.name testShortToFloat004
     * @tc.desc Verify static toFloat with negative short value returns exact float value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToFloat004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeValue: short = (-123) as short;
      let actualResult: float = Short.toFloat(negativeValue);
      expect(actualResult).assertEqual((-123.0f));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOFLOAT_0500
     * @tc.name testShortToFloat005
     * @tc.desc Verify static toFloat with Short.MAX_VALUE preserves exact boundary conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToFloat005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxShortValue: short = Short.MAX_VALUE;
      let actualResult: float = Short.toFloat(maxShortValue);
      expect(actualResult).assertEqual(32767.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOFLOAT_0600
     * @tc.name testShortToFloat006
     * @tc.desc Verify static toFloat return type is float and value matches exact conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToFloat006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = 42 as short;
      let actualResult: float = Short.toFloat(inputValue);
      expect(actualResult).assertEqual(42.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOFLOAT_0700
     * @tc.name testShortToFloat007
     * @tc.desc Verify static toFloat with positive integer matrix preserves float precision without loss
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToFloat007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testValues: short[] = [
        1 as short,
        255 as short,
        1024 as short,
        16384 as short,
        Short.MAX_VALUE
      ];
      let expectedValues: float[] = [
        1.0f,
        255.0f,
        1024.0f,
        16384.0f,
        32767.0f
      ];
      let caseCount: int = 5;
      for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
        let actualResult: float = Short.toFloat(testValues[caseIndex]);
        expect(actualResult).assertEqual(expectedValues[caseIndex]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOFLOAT_0800
     * @tc.name testShortToFloat008
     * @tc.desc Verify static toFloat with negative integer matrix preserves exact float conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToFloat008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testValues: short[] = [
        (-1) as short,
        (-128) as short,
        Short.MIN_VALUE,
        (-10000) as short
      ];
      let expectedValues: float[] = [
        (-1.0f),
        (-128.0f),
        (-32768.0f),
        (-10000.0f)
      ];
      let caseCount: int = 4;
      for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
        let actualResult: float = Short.toFloat(testValues[caseIndex]);
        expect(actualResult).assertEqual(expectedValues[caseIndex]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOFLOAT_0900
     * @tc.name testShortToFloat009
     * @tc.desc Verify static toFloat with repeated positive input keeps idempotent conversion consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToFloat009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let repeatedValue: short = 100 as short;
      let firstResult: float = Short.toFloat(repeatedValue);
      let secondResult: float = Short.toFloat(repeatedValue);
      let thirdResult: float = Short.toFloat(repeatedValue);
      expect(firstResult).assertEqual(100.0f);
      expect(secondResult).assertEqual(100.0f);
      expect(thirdResult).assertEqual(100.0f);
      expect(firstResult).assertEqual(secondResult);
      expect(secondResult).assertEqual(thirdResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOFLOAT_1000
     * @tc.name testShortToFloat010
     * @tc.desc Verify static toFloat with repeated Short.MIN_VALUE input keeps idempotent boundary conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToFloat010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let repeatedValue: short = Short.MIN_VALUE;
      let firstResult: float = Short.toFloat(repeatedValue);
      let secondResult: float = Short.toFloat(repeatedValue);
      let thirdResult: float = Short.toFloat(repeatedValue);
      expect(firstResult).assertEqual((-32768.0f));
      expect(secondResult).assertEqual((-32768.0f));
      expect(thirdResult).assertEqual((-32768.0f));
      expect(firstResult).assertEqual(secondResult);
      expect(secondResult).assertEqual(thirdResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOFLOAT_1100
     * @tc.name testShortToFloat011
     * @tc.desc Verify static toFloat with repeated Short.MAX_VALUE input keeps idempotent boundary conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToFloat011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let repeatedValue: short = Short.MAX_VALUE;
      let firstResult: float = Short.toFloat(repeatedValue);
      let secondResult: float = Short.toFloat(repeatedValue);
      let thirdResult: float = Short.toFloat(repeatedValue);
      expect(firstResult).assertEqual(32767.0f);
      expect(secondResult).assertEqual(32767.0f);
      expect(thirdResult).assertEqual(32767.0f);
      expect(firstResult).assertEqual(secondResult);
      expect(secondResult).assertEqual(thirdResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOFLOAT_1200
     * @tc.name testShortToFloat012
     * @tc.desc Verify static toFloat with repeated zero input keeps idempotent conversion consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToFloat012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let repeatedValue: short = 0 as short;
      let firstResult: float = Short.toFloat(repeatedValue);
      let secondResult: float = Short.toFloat(repeatedValue);
      let thirdResult: float = Short.toFloat(repeatedValue);
      expect(firstResult).assertEqual(0.0f);
      expect(secondResult).assertEqual(0.0f);
      expect(thirdResult).assertEqual(0.0f);
      expect(firstResult).assertEqual(secondResult);
      expect(secondResult).assertEqual(thirdResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOFLOAT_1300
     * @tc.name testShortToFloat013
     * @tc.desc Verify instance toFloat matches static toFloat for normal adjacent and boundary short values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToFloat013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testValues: short[] = [
        0 as short,
        42 as short,
        (-42) as short,
        32766 as short,
        (-32767) as short,
        Short.MAX_VALUE,
        Short.MIN_VALUE
      ];
      let expectedValues: float[] = [
        0.0f,
        42.0f,
        (-42.0f),
        32766.0f,
        (-32767.0f),
        32767.0f,
        (-32768.0f)
      ];
      let caseCount: int = 7;
      for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
        let boxedValue: Short = new Short(testValues[caseIndex]);
        let instanceResult: float = boxedValue.toFloat();
        let staticResult: float = Short.toFloat(testValues[caseIndex]);
        expect(instanceResult).assertEqual(expectedValues[caseIndex]);
        expect(staticResult).assertEqual(expectedValues[caseIndex]);
        expect(instanceResult).assertEqual(staticResult);
        expect(boxedValue.toShort()).assertEqual(testValues[caseIndex]);
      }
    });
  });
}
