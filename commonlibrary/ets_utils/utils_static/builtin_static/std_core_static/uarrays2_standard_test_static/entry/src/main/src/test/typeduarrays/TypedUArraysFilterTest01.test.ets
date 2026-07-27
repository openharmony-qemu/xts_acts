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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function typedUArraysFilterTest01(): void {
  describe('TypedUArraysFilterTest01', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_000100
     * @tc.name testTypedUArraysFilterPart101_001
     * @tc.desc Verify filter 0 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.filter(() => false);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_000200
     * @tc.name testTypedUArraysFilterPart101_002
     * @tc.desc Verify filter 0 - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const result = arr.filter(() => false);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_000300
     * @tc.name testTypedUArraysFilterPart101_003
     * @tc.desc Verify filter 1 - callback Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const result = arr.filter((v) => v > 15);
      expect(Array.from(result).join(',')).assertEqual('20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_000400
     * @tc.name testTypedUArraysFilterPart101_004
     * @tc.desc Verify filter 2 - callback + thisArg Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const threshold = 15;
      const result = arr.filter((v) => v > threshold);
      expect(Array.from(result).join(',')).assertEqual('20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_000500
     * @tc.name testTypedUArraysFilterPart101_005
     * @tc.desc Verify filter 1 - callback Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const result = arr.filter((v) => v > 150);
      expect(Array.from(result).join(',')).assertEqual('200,300');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_000600
     * @tc.name testTypedUArraysFilterPart101_006
     * @tc.desc Verify filter 2 - callback + thisArg Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const limit = 1500;
      const result = arr.filter((v) => v > limit);
      expect(Array.from(result).join(',')).assertEqual('2000,3000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_000700
     * @tc.name testTypedUArraysFilterPart101_007
     * @tc.desc Verify filter 1 - callback BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([100n, 200n, 300n]);
      const result = arr.filter((v) => v > 150n);
      expect(Array.from(result).join(',')).assertEqual('200,300');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_000800
     * @tc.name testTypedUArraysFilterPart101_008
     * @tc.desc Verify filter 2 - callback + thisArg BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([100n, 200n, 300n]);
      const limit = 150n;
      const result = arr.filter((v) => v > limit);
      expect(Array.from(result).join(',')).assertEqual('200,300');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_001100
     * @tc.name testTypedUArraysFilterPart101_011
     * @tc.desc Verify callback true Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 10, 15, 20]);
      const result = arr.filter((v) => v < 10);
      expect(Array.from(result).join(',')).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_001200
     * @tc.name testTypedUArraysFilterPart101_012
     * @tc.desc Verify callback true Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.filter((v) => v === 3);
      expect(Array.from(result).join(',')).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_001300
     * @tc.name testTypedUArraysFilterPart101_013
     * @tc.desc Verify callback true Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.filter((v) => v === 5);
      expect(Array.from(result).join(',')).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_001400
     * @tc.name testTypedUArraysFilterPart101_014
     * @tc.desc Verify callback true Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([2, 4, 6, 8, 10]);
      const result = arr.filter((v) => v > 0);
      expect(Array.from(result).join(',')).assertEqual('2,4,6,8,10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_001500
     * @tc.name testTypedUArraysFilterPart101_015
     * @tc.desc Verify callback index Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40]);
      const result = arr.filter((v, i) => {
        expect(typeof v).assertEqual('number');
        return i === 2;
      });
      expect(Array.from(result).join(',')).assertEqual('30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_001600
     * @tc.name testTypedUArraysFilterPart101_016
     * @tc.desc Verify callback array Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const result = arr.filter((v, i, a) => {
      expect(typeof i).assertEqual('int');
        return a[0] === v;
      });
      expect(Array.from(result).join(',')).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_001700
     * @tc.name testTypedUArraysFilterPart101_017
     * @tc.desc Verify callback Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const result = arr.filter((v) => v > 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_001800
     * @tc.name testTypedUArraysFilterPart101_018
     * @tc.desc Verify callback Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const result = arr.filter((v) => v === 42);
      expect(Array.from(result).join(',')).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_001900
     * @tc.name testTypedUArraysFilterPart101_019
     * @tc.desc Verify callback Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const result = arr.filter((v) => v !== 42);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_002000
     * @tc.name testTypedUArraysFilterPart101_020
     * @tc.desc Verify callback Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([7, 7, 7, 7]);
      const result = arr.filter((v) => v === 7);
      expect(Array.from(result).join(',')).assertEqual('7,7,7,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_002100
     * @tc.name testTypedUArraysFilterPart101_021
     * @tc.desc Verify callback Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([7, 7, 7, 7]);
      const result = arr.filter((v) => v !== 7);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_002200
     * @tc.name testTypedUArraysFilterPart101_022
     * @tc.desc Verify callback false Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const result = arr.filter(() => false);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_002300
     * @tc.name testTypedUArraysFilterPart101_023
     * @tc.desc Verify callback true Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const result = arr.filter(() => true);
      expect(Array.from(result).join(',')).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_002400
     * @tc.name testTypedUArraysFilterPart101_024
     * @tc.desc Verify callback false Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const result = arr.filter(() => false);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_002500
     * @tc.name testTypedUArraysFilterPart101_025
     * @tc.desc Verify callback Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 10, 15]);
      const result = arr.filter((v) => v > 5);
      expect(Array.from(result).join(',')).assertEqual('10,15');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_002700
     * @tc.name testTypedUArraysFilterPart101_027
     * @tc.desc Verify callback array Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.filter((v, i, a) => {
        expect(Array.isArray(a)).assertFalse();
        return i === a.length - 1;
      });
      expect(Array.from(result).join(',')).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_002900
     * @tc.name testTypedUArraysFilterPart101_029
     * @tc.desc Verify callback Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = 30;
      const arr = new Uint8Array([10, 20, 30, 40]);
      const result = arr.filter((v) => v === target);
      expect(Array.from(result).join(',')).assertEqual('30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_003000
     * @tc.name testTypedUArraysFilterPart101_030
     * @tc.desc Verify callback Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      const result = arr.filter((v) => v > 3 && v < 10);
      expect(Array.from(result).join(',')).assertEqual('4,5,6,7,8,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_003100
     * @tc.name testTypedUArraysFilterPart101_031
     * @tc.desc Verify callback Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 15, 25, 35]);
      const result = arr.filter((v) => v > 5);
      expect(Array.from(result).join(',')).assertEqual('15,25,35');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_003200
     * @tc.name testTypedUArraysFilterPart101_032
     * @tc.desc Verify callback Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const result = arr.filter((v) => v === 200);
      expect(Array.from(result).join(',')).assertEqual('200');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_003300
     * @tc.name testTypedUArraysFilterPart101_033
     * @tc.desc Verify callback Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const result = arr.filter((v) => v > 1000);
      expect(Array.from(result).join(',')).assertEqual('2000,3000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_003400
     * @tc.name testTypedUArraysFilterPart101_034
     * @tc.desc Verify callback BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([50n, 150n, 250n, 350n]);
      const result = arr.filter((v) => v > 50n);
      expect(Array.from(result).join(',')).assertEqual('150,250,350');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_003500
     * @tc.name testTypedUArraysFilterPart101_035
     * @tc.desc Verify callback Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2, 3]);
      const result = arr.filter((v) => v > 0);
      expect(Array.from(result).join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_003600
     * @tc.name testTypedUArraysFilterPart101_036
     * @tc.desc Verify callback null Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2]);
      const result = arr.filter((v) => v !== 0);
      expect(Array.from(result).join(',')).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_004100
     * @tc.name testTypedUArraysFilterPart101_041
     * @tc.desc Verify thisArg Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 15, 25, 35]);
      const threshold = 20;
      const result = arr.filter((v) => v > threshold);
      expect(Array.from(result).join(',')).assertEqual('25,35');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_004900
     * @tc.name testTypedUArraysFilterPart101_049
     * @tc.desc Verify thisArg Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40]);
      const min = 15;
      const max = 35;
      const result = arr.filter((v) => v > min && v < max);
      expect(Array.from(result).join(',')).assertEqual('20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_005000
     * @tc.name testTypedUArraysFilterPart101_050
     * @tc.desc Verify thisArg Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40, 50]);
      const result = arr.filter((v) => v > 25);
      expect(Array.from(result).join(',')).assertEqual('30,40,50');
    });

  });
}
