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
import Utils from '../Util.test';

export default function Uint8ArrayLastIndexOf01Test(): void {
  describe('Uint8ArrayLastIndexOf01Test', () => {
    beforeAll(() => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_0100
     * @tc.name testUint8ArrayLastIndexOf001
     * @tc.desc Verify 1-parameter lastIndexOf, searchElement exists in array, should return rightmost match index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 20, 40]);
      expect(arr.lastIndexOf(20)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_0200
     * @tc.name testUint8ArrayLastIndexOf002
     * @tc.desc Verify 1-parameter lastIndexOf, searchElement not in array, should return -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 20, 40]);
      expect(arr.lastIndexOf(99)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_0300
     * @tc.name testUint8ArrayLastIndexOf003
     * @tc.desc Verify 2-parameter lastIndexOf, searchElement within fromIndex range, should return match index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 20, 40]);
      expect(arr.lastIndexOf(20, 3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_0400
     * @tc.name testUint8ArrayLastIndexOf004
     * @tc.desc Verify 2-parameter lastIndexOf, searchElement outside fromIndex range (left), should return -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 20, 40]);
      expect(arr.lastIndexOf(30, 1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_0500
     * @tc.name testUint8ArrayLastIndexOf005
     * @tc.desc Verify 2-parameter lastIndexOf, fromIndex=0 target at index 0, should return 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 20, 40]);
      expect(arr.lastIndexOf(10, 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_0600
     * @tc.name testUint8ArrayLastIndexOf006
     * @tc.desc Verify 2-parameter lastIndexOf, fromIndex=0 target not at index 0, should return -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 20, 40]);
      expect(arr.lastIndexOf(20, 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_0700
     * @tc.name testUint8ArrayLastIndexOf007
     * @tc.desc Verify searchElement=0 (uint8_MIN), array contains 0, should match and return index 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 10, 20]);
      expect(arr.lastIndexOf(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_0800
     * @tc.name testUint8ArrayLastIndexOf008
     * @tc.desc Verify searchElement=255 (uint8_MAX), array contains 255, should match and return index 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 255, 20]);
      expect(arr.lastIndexOf(255)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_0900
     * @tc.name testUint8ArrayLastIndexOf009
     * @tc.desc Verify searchElement=127 (mid value), array contains 127, should match and return index 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 127, 20]);
      expect(arr.lastIndexOf(127)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_1000
     * @tc.name testUint8ArrayLastIndexOf010
     * @tc.desc Verify searchElement=128 (mid value+1), array contains 128, should match and return index 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 128, 20]);
      expect(arr.lastIndexOf(128)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_1100
     * @tc.name testUint8ArrayLastIndexOf011
     * @tc.desc Verify searchElement=256 does not truncate to uint8, 256 !== 0, returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 10, 20]);
      expect(arr.lastIndexOf(256)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_1200
     * @tc.name testUint8ArrayLastIndexOf012
     * @tc.desc Verify searchElement=-1 does not wrap to uint8, -1 !== 255, returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([255, 10, 20]);
      expect(arr.lastIndexOf(-1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_1300
     * @tc.name testUint8ArrayLastIndexOf013
     * @tc.desc Verify searchElement=-255 does not wrap to uint8, -255 !== 1, returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 10, 20]);
      expect(arr.lastIndexOf(-255)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_1400
     * @tc.name testUint8ArrayLastIndexOf014
     * @tc.desc Verify searchElement=NaN, not equal to any uint8 value, should return -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      expect(arr.lastIndexOf(Number.NaN)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_1500
     * @tc.name testUint8ArrayLastIndexOf015
     * @tc.desc Verify searchElement=Infinity, not equal to any uint8 value, should return -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      expect(arr.lastIndexOf(Number.POSITIVE_INFINITY)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_1600
     * @tc.name testUint8ArrayLastIndexOf016
     * @tc.desc Verify searchElement=-Infinity, not equal to any uint8 value, should return -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      expect(arr.lastIndexOf(Number.NEGATIVE_INFINITY)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_1700
     * @tc.name testUint8ArrayLastIndexOf017
     * @tc.desc Verify searchElement=20.0 (integer float), equal to element 20, should match at index 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      expect(arr.lastIndexOf(20.0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_1800
     * @tc.name testUint8ArrayLastIndexOf018
     * @tc.desc Verify searchElement=20.5 (non-integer float), not equal to element 20, should return -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      expect(arr.lastIndexOf(20.5)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_1900
     * @tc.name testUint8ArrayLastIndexOf019
     * @tc.desc Verify searchElement=0.0 (float zero), equal to element 0, should match at index 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 10, 20]);
      expect(arr.lastIndexOf(0.0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_2000
     * @tc.name testUint8ArrayLastIndexOf020
     * @tc.desc Verify searchElement=255.0 (float max value), equal to element 255, should match at index 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 255, 20]);
      expect(arr.lastIndexOf(255.0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_2100
     * @tc.name testUint8ArrayLastIndexOf021
     * @tc.desc Verify searchElement=0xFF (hex 255), equal to element 255, should match at index 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 255, 20]);
      expect(arr.lastIndexOf(0xFF)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_2200
     * @tc.name testUint8ArrayLastIndexOf022
     * @tc.desc Verify searchElement=0o377 (octal 255), equal to element 255, should match at index 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 255, 20]);
      expect(arr.lastIndexOf(0o377)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_2300
     * @tc.name testUint8ArrayLastIndexOf023
     * @tc.desc Verify searchElement=0b11111111 (binary 255), equal to element 255, should match at index 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 255, 20]);
      expect(arr.lastIndexOf(0b11111111)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_2400
     * @tc.name testUint8ArrayLastIndexOf024
     * @tc.desc Verify searchElement=0x80 (hex 128), equal to element 128, should match at index 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 128, 20]);
      expect(arr.lastIndexOf(0x80)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_2500
     * @tc.name testUint8ArrayLastIndexOf025
     * @tc.desc Verify searchElement=0x00 (hex 0), equal to element 0, should match at index 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 10, 20]);
      expect(arr.lastIndexOf(0x00)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_2600
     * @tc.name testUint8ArrayLastIndexOf026
     * @tc.desc Verify searchElement=0o0 (octal 0), equal to element 0, should match at index 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 10, 20]);
      expect(arr.lastIndexOf(0o0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_2700
     * @tc.name testUint8ArrayLastIndexOf027
     * @tc.desc Verify searchElement=0b0 (binary 0), equal to element 0, should match at index 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 10, 20]);
      expect(arr.lastIndexOf(0b0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_2800
     * @tc.name testUint8ArrayLastIndexOf028
     * @tc.desc Verify searchElement=0x14 (hex 20), equal to element 20, should match at index 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      expect(arr.lastIndexOf(0x14)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_2900
     * @tc.name testUint8ArrayLastIndexOf029
     * @tc.desc Verify searchElement=0o24 (octal 20), equal to element 20, should match at index 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      expect(arr.lastIndexOf(0o24)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_3000
     * @tc.name testUint8ArrayLastIndexOf030
     * @tc.desc Verify searchElement=0b10100 (binary 20), equal to element 20, should match at index 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      expect(arr.lastIndexOf(0b10100)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_3100
     * @tc.name testUint8ArrayLastIndexOf031
     * @tc.desc Verify searchElement=0x10 (hex 16), equal to element 16, should match at index 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 16, 20]);
      expect(arr.lastIndexOf(0x10)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_3200
     * @tc.name testUint8ArrayLastIndexOf032
     * @tc.desc Verify searchElement=0o20 (octal 16), equal to element 16, should match at index 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 16, 20]);
      expect(arr.lastIndexOf(0o20)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_3300
     * @tc.name testUint8ArrayLastIndexOf033
     * @tc.desc Verify searchElement=0b10000 (binary 16), equal to element 16, should match at index 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 16, 20]);
      expect(arr.lastIndexOf(0b10000)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_3400
     * @tc.name testUint8ArrayLastIndexOf034
     * @tc.desc Verify searchElement=1e1 (scientific notation 10), equal to element 10, should match at index 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      expect(arr.lastIndexOf(1e1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_3500
     * @tc.name testUint8ArrayLastIndexOf035
     * @tc.desc Verify searchElement=2.55e2 (scientific notation 255), equal to element 255, should match at index 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 255, 20]);
      expect(arr.lastIndexOf(2.55e2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_3600
     * @tc.name testUint8ArrayLastIndexOf036
     * @tc.desc Verify searchElement=1.28e2 (scientific notation 128), equal to element 128, should match at index 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 128, 20]);
      expect(arr.lastIndexOf(1.28e2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_3700
     * @tc.name testUint8ArrayLastIndexOf037
     * @tc.desc Verify searchElement=999999 (large positive beyond uint8 range), should return -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      expect(arr.lastIndexOf(999999)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_3800
     * @tc.name testUint8ArrayLastIndexOf038
     * @tc.desc Verify searchElement=-999999 (large negative), should return -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      expect(arr.lastIndexOf(-999999)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_3900
     * @tc.name testUint8ArrayLastIndexOf039
     * @tc.desc Verify searchElement appears three times, from right to left should return rightmost index 4
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([20, 30, 20, 40, 20]);
      expect(arr.lastIndexOf(20)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_4000
     * @tc.name testUint8ArrayLastIndexOf040
     * @tc.desc Verify searchElement appears twice, fromIndex excludes right side, should return left index 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([20, 30, 20, 40]);
      expect(arr.lastIndexOf(20, 1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_4100
     * @tc.name testUint8ArrayLastIndexOf041
     * @tc.desc Verify searchElement appears twice, fromIndex covers right side, should return right index 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([20, 30, 20, 40]);
      expect(arr.lastIndexOf(20, 2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_4200
     * @tc.name testUint8ArrayLastIndexOf042
     * @tc.desc Verify single element array search existing element, should return 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([20]);
      expect(arr.lastIndexOf(20)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_4300
     * @tc.name testUint8ArrayLastIndexOf043
     * @tc.desc Verify single element array search non-existing element, should return -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([20]);
      expect(arr.lastIndexOf(10)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_4400
     * @tc.name testUint8ArrayLastIndexOf044
     * @tc.desc Verify empty array search searchElement=0, should return -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array();
      expect(arr.lastIndexOf(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_4500
     * @tc.name testUint8ArrayLastIndexOf045
     * @tc.desc Verify empty array search searchElement=255, should return -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array();
      expect(arr.lastIndexOf(255)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_4600
     * @tc.name testUint8ArrayLastIndexOf046
     * @tc.desc Verify all same array [5,5,5,5,5] search 5, from right to left should return index 4
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([5, 5, 5, 5, 5]);
      expect(arr.lastIndexOf(5)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_4700
     * @tc.name testUint8ArrayLastIndexOf047
     * @tc.desc Verify all zero array [0,0,0] search 0, from right to left should return index 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 0, 0]);
      expect(arr.lastIndexOf(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_4800
     * @tc.name testUint8ArrayLastIndexOf048
     * @tc.desc Verify all same array [255,255] search 255, from right to left should return index 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([255, 255]);
      expect(arr.lastIndexOf(255)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_4900
     * @tc.name testUint8ArrayLastIndexOf049
     * @tc.desc Verify first element search, should return index 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      expect(arr.lastIndexOf(10)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_5000
     * @tc.name testUint8ArrayLastIndexOf050
     * @tc.desc Verify last element search, should return last index 4
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      expect(arr.lastIndexOf(50)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_5100
     * @tc.name testUint8ArrayLastIndexOf051
     * @tc.desc Verify long array search element at end, should return last index 9
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      expect(arr.lastIndexOf(10)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_5200
     * @tc.name testUint8ArrayLastIndexOf052
     * @tc.desc Verify long array search element at beginning, should return index 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      expect(arr.lastIndexOf(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_5300
     * @tc.name testUint8ArrayLastIndexOf053
     * @tc.desc Verify long array search element in middle, should return middle index 4
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      expect(arr.lastIndexOf(5)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_5400
     * @tc.name testUint8ArrayLastIndexOf054
     * @tc.desc Verify fromIndex=4 (last index), searchElement=20, should return index 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 20, 40]);
      expect(arr.lastIndexOf(20, 4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_5500
     * @tc.name testUint8ArrayLastIndexOf055
     * @tc.desc Verify fromIndex=2, searchElement=20, should return index 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 20, 40]);
      expect(arr.lastIndexOf(20, 2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_5600
     * @tc.name testUint8ArrayLastIndexOf056
     * @tc.desc Verify fromIndex=1, searchElement=20, should return index 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 20, 40]);
      expect(arr.lastIndexOf(20, 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_5700
     * @tc.name testUint8ArrayLastIndexOf057
     * @tc.desc Verify fromIndex=-1, searchElement=20, should return index 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 20, 40]);
      expect(arr.lastIndexOf(20, -1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_5800
     * @tc.name testUint8ArrayLastIndexOf058
     * @tc.desc Verify fromIndex=-5, searchElement=20, should return -1 (excludes index 1)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 20, 40]);
      expect(arr.lastIndexOf(20, -5)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_5900
     * @tc.name testUint8ArrayLastIndexOf059
     * @tc.desc Verify fromIndex=-6, searchElement=20, should return -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 20, 40]);
      expect(arr.lastIndexOf(20, -6)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_6000
     * @tc.name testUint8ArrayLastIndexOf060
     * @tc.desc Verify fromIndex=5 (beyond array length), searchElement=20, should return index 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 20, 40]);
      expect(arr.lastIndexOf(20, 5)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_6100
     * @tc.name testUint8ArrayLastIndexOf061
     * @tc.desc Verify fromIndex=100 (large positive), searchElement=20, should return index 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 20, 40]);
      expect(arr.lastIndexOf(20, 100)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_6200
     * @tc.name testUint8ArrayLastIndexOf062
     * @tc.desc Verify fromIndex=-100 (large negative), should return -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 20, 40]);
      expect(arr.lastIndexOf(20, -100)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_6300
     * @tc.name testUint8ArrayLastIndexOf063
     * @tc.desc Verify fromIndex=0x00 (hex 0), searchElement=20, should return -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 20, 40]);
      expect(arr.lastIndexOf(20, 0x00)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_6400
     * @tc.name testUint8ArrayLastIndexOf064
     * @tc.desc Verify fromIndex=0o0 (octal 0), searchElement=20, should return -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 20, 40]);
      expect(arr.lastIndexOf(20, 0o0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_6500
     * @tc.name testUint8ArrayLastIndexOf065
     * @tc.desc Verify fromIndex=0b0 (binary 0), searchElement=20, should return -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 20, 40]);
      expect(arr.lastIndexOf(20, 0b0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_6600
     * @tc.name testUint8ArrayLastIndexOf066
     * @tc.desc Verify fromIndex=1, searchElement=0xFF, should return 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([255, 10, 20]);
      expect(arr.lastIndexOf(0xFF, 1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_6700
     * @tc.name testUint8ArrayLastIndexOf067
     * @tc.desc Verify fromIndex=-2, searchElement=0x0A, should return 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 10, 40]);
      expect(arr.lastIndexOf(0x0A, -2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_6800
     * @tc.name testUint8ArrayLastIndexOf068
     * @tc.desc Verify fromIndex=1, searchElement=20 in [20,30,20,40,20], should return 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([20, 30, 20, 40, 20]);
      expect(arr.lastIndexOf(20, 1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_6900
     * @tc.name testUint8ArrayLastIndexOf069
     * @tc.desc Verify empty array, should return -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array();
      expect(arr.lastIndexOf(0, 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_7000
     * @tc.name testUint8ArrayLastIndexOf070
     * @tc.desc Verify empty array with negative fromIndex, should return -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array();
      expect(arr.lastIndexOf(0, -1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_7100
     * @tc.name testUint8ArrayLastIndexOf071
     * @tc.desc Verify fromIndex=1, single element array search element at index 0, should return 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([20]);
      expect(arr.lastIndexOf(20, 1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_7200
     * @tc.name testUint8ArrayLastIndexOf072
     * @tc.desc Verify fromIndex=-1, single element array search element at index 0, should return 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([20]);
      expect(arr.lastIndexOf(20, -1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_7300
     * @tc.name testUint8ArrayLastIndexOf073
     * @tc.desc Verify fromIndex=-1, single element searchElement=0xFF, should return 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([255]);
      expect(arr.lastIndexOf(0xFF, -1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_7400
     * @tc.name testUint8ArrayLastIndexOf074
     * @tc.desc Verify fromIndex=0, searchElement=0b1010 at index 0, should return 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      expect(arr.lastIndexOf(0b1010, 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_7500
     * @tc.name testUint8ArrayLastIndexOf075
     * @tc.desc Verify fromIndex=-1, searchElement=40, full search should return 4
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 20, 40]);
      expect(arr.lastIndexOf(40, -1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_7600
     * @tc.name testUint8ArrayLastIndexOf076
     * @tc.desc Verify fromIndex=0, searchElement=0 at index 0, should return 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 10, 20]);
      expect(arr.lastIndexOf(0, 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_7700
     * @tc.name testUint8ArrayLastIndexOf077
     * @tc.desc Verify fromIndex=0, searchElement=255 at index 1, should return -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 255, 20]);
      expect(arr.lastIndexOf(255, 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_7800
     * @tc.name testUint8ArrayLastIndexOf078
     * @tc.desc Verify fromIndex=1, searchElement=255 at index 1, should return 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 255, 20]);
      expect(arr.lastIndexOf(255, 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF01_7900
     * @tc.name testUint8ArrayLastIndexOf079
     * @tc.desc Verify fromIndex=2, searchElement=255 at index 1, should return 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 255, 20]);
      expect(arr.lastIndexOf(255, 2)).assertEqual(1);
    });
  });
}