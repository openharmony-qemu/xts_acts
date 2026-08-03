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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function typedUArraysMapPartTest02(): void {
  describe('TypedUArraysMapPartTest02', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_0100
     * @tc.name testTypedUArraysMapPartTestFileB001
     * @tc.desc Verify includes Uint8Array found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      expect(arr.includes(20)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_0200
     * @tc.name testTypedUArraysMapPartTestFileB002
     * @tc.desc Verify includes Uint8Array not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      expect(arr.includes(99)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_0300
     * @tc.name testTypedUArraysMapPartTestFileB003
     * @tc.desc Verify includes Uint16Array found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      expect(arr.includes(200)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_0400
     * @tc.name testTypedUArraysMapPartTestFileB004
     * @tc.desc Verify includes Uint32Array found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      expect(arr.includes(2000)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_0500
     * @tc.name testTypedUArraysMapPartTestFileB005
     * @tc.desc Verify includes BigUint64Array found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      expect(arr.includes(20n)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_0600
     * @tc.name testTypedUArraysMapPartTestFileB006
     * @tc.desc Verify includes Uint8ClampedArray found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      expect(arr.includes(20)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_0700
     * @tc.name testTypedUArraysMapPartTestFileB007
     * @tc.desc Verify indexOf Uint8Array found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      expect(arr.indexOf(20)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_0800
     * @tc.name testTypedUArraysMapPartTestFileB008
     * @tc.desc Verify indexOf Uint8Array not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      expect(arr.indexOf(99)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_0900
     * @tc.name testTypedUArraysMapPartTestFileB009
     * @tc.desc Verify indexOf BigUint64Array found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      expect(arr.indexOf(20n)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_1000
     * @tc.name testTypedUArraysMapPartTestFileB010
     * @tc.desc Verify indexOf Uint16Array from index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300, 200]);
      expect(arr.indexOf(200, 2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_1100
     * @tc.name testTypedUArraysMapPartTestFileB011
     * @tc.desc Verify entries Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20]);
      let count = 0;
      const iter = arr.entries();
      for (const entry of iter) {
        count++;
        if (count === 1) {
          expect(entry[0]).assertEqual(0);
          expect(entry[1]).assertEqual(10);
        }
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_1200
     * @tc.name testTypedUArraysMapPartTestFileB012
     * @tc.desc Verify keys Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let count = 0;
      for (const key of arr.keys()) {
        count++;
        if (count === 1) {
          expect(key).assertEqual(0);
        }
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_1300
     * @tc.name testTypedUArraysMapPartTestFileB013
     * @tc.desc Verify values Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let count = 0;
      for (const val of arr.values()) {
        count++;
        if (count === 1) {
          expect(val).assertEqual(10);
        }
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_1400
     * @tc.name testTypedUArraysMapPartTestFileB014
     * @tc.desc Verify Symbol.iterator Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20]);
      let count = 0;
      for (let v of arr) {
        count++;
        if (count === 1) {
          expect(v).assertEqual(10);
        }
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_1500
     * @tc.name testTypedUArraysMapPartTestFileB015
     * @tc.desc Verify entries BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n]);
      let count = 0;
      for (const entry of arr.entries()) {
        count++;
        if (count === 1) {
          expect(entry[0]).assertEqual(0);
          expect(entry[1]).assertEqual(10n);
        }
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_1600
     * @tc.name testTypedUArraysMapPartTestFileB016
     * @tc.desc Verify slice Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40]);
      const result = arr.slice(1, 3);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(20);
      expect(result[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_1700
     * @tc.name testTypedUArraysMapPartTestFileB017
     * @tc.desc Verify slice BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n, 40n]);
      const result = arr.slice(1, 3);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_1800
     * @tc.name testTypedUArraysMapPartTestFileB018
     * @tc.desc Verify subarray BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const result = arr.subarray(0, 2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_1900
     * @tc.name testTypedUArraysMapPartTestFileB019
     * @tc.desc Verify reverse Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const result = arr.reverse();
      expect(result[0]).assertEqual(30);
      expect(result[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_2000
     * @tc.name testTypedUArraysMapPartTestFileB020
     * @tc.desc Verify reverse BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const result = arr.reverse();
      expect(result[0]).assertEqual(30n);
      expect(result[2]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_2100
     * @tc.name testTypedUArraysMapPartTestFileB021
     * @tc.desc Verify toReversed Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const result = arr.toReversed();
      expect(arr[0]).assertEqual(10);
      expect(result[0]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_2200
     * @tc.name testTypedUArraysMapPartTestFileB022
     * @tc.desc Verify sort Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([30, 10, 20]);
      const result = arr.sort();
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_2300
     * @tc.name testTypedUArraysMapPartTestFileB023
     * @tc.desc Verify sort BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([30n, 10n, 20n]);
      arr.sort();
      expect(arr[0]).assertEqual(10n);
      expect(arr[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_2400
     * @tc.name testTypedUArraysMapPartTestFileB024
     * @tc.desc Verify toSorted Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([30, 10, 20]);
      const result = arr.toSorted();
      expect(arr[0]).assertEqual(30);
      expect(result[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_2500
     * @tc.name testTypedUArraysMapPartTestFileB025
     * @tc.desc Verify join Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      expect(arr.join(',')).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_2600
     * @tc.name testTypedUArraysMapPartTestFileB026
     * @tc.desc Verify join BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      expect(arr.join(',')).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_2700
     * @tc.name testTypedUArraysMapPartTestFileB027
     * @tc.desc Verify toString Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      expect(arr.toString()).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_2800
     * @tc.name testTypedUArraysMapPartTestFileB028
     * @tc.desc Verify toString BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      expect(arr.toString()).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_2900
     * @tc.name testTypedUArraysMapPartTestFileB029
     * @tc.desc Verify toLocaleString Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const result = arr.toLocaleString();
      expect(result.includes('10')).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_3000
     * @tc.name testTypedUArraysMapPartTestFileB030
     * @tc.desc Verify reduce Uint8Array sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_3100
     * @tc.name testTypedUArraysMapPartTestFileB031
     * @tc.desc Verify reduce BigUint64Array sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_3200
     * @tc.name testTypedUArraysMapPartTestFileB032
     * @tc.desc Verify valueOf Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const result = arr.valueOf();
      expect(result[0]).assertEqual(10);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_3300
     * @tc.name testTypedUArraysMapPartTestFileB033
     * @tc.desc Verify valueOf BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const result = arr.valueOf();
      expect(result[0]).assertEqual(10n);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_3400
     * @tc.name testTypedUArraysMapPartTestFileB034
     * @tc.desc Verify slice Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300, 400]);
      const result = arr.slice(0, 2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_3500
     * @tc.name testTypedUArraysMapPartTestFileB035
     * @tc.desc Verify subarray Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const result = arr.subarray(1);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(2000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_3600
     * @tc.name testTypedUArraysMapPartTestFileB036
     * @tc.desc Verify reverse Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      arr.reverse();
      expect(arr[0]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_3700
     * @tc.name testTypedUArraysMapPartTestFileB037
     * @tc.desc Verify sort Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([3000, 1000, 2000]);
      arr.sort();
      expect(arr[0]).assertEqual(1000);
      expect(arr[2]).assertEqual(3000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_3800
     * @tc.name testTypedUArraysMapPartTestFileB038
     * @tc.desc Verify join Uint16Array default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      expect(arr.join()).assertEqual('100,200,300');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_3900
     * @tc.name testTypedUArraysMapPartTestFileB039
     * @tc.desc Verify filter Uint8Array empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.filter((v) => v > 999);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_4000
     * @tc.name testTypedUArraysMapPartTestFileB040
     * @tc.desc Verify map with callback using index Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const result = arr.map((v, i) => v + i);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(21);
      expect(result[2]).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_4100
     * @tc.name testTypedUArraysMapPartTestFileB041
     * @tc.desc Verify map BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0);
      let result = arr.map((v) => v);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_4200
     * @tc.name testTypedUArraysMapPartTestFileB042
     * @tc.desc Verify map Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      let result = arr.map((v) => v >= 0 ? v : v);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_4300
     * @tc.name testTypedUArraysMapPartTestFileB043
     * @tc.desc Verify map byteLength Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.map((v) => v >= 0 ? v : v);
      expect(result.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_4400
     * @tc.name testTypedUArraysMapPartTestFileB044
     * @tc.desc Verify map byteLength Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let result = arr.map((v) => v >= 0 ? v : v);
      expect(result.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_4500
     * @tc.name testTypedUArraysMapPartTestFileB045
     * @tc.desc Verify map byteLength Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      let result = arr.map((v) => v >= 0 ? v : v);
      expect(result.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_4600
     * @tc.name testTypedUArraysMapPartTestFileB046
     * @tc.desc Verify map byteLength BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.map((v) => v);
      expect(result.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_4700
     * @tc.name testTypedUArraysMapPartTestFileB047
     * @tc.desc Verify map byteLength Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let result = arr.map((v) => v >= 0 ? v : v);
      expect(result.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_4800
     * @tc.name testTypedUArraysMapPartTestFileB048
     * @tc.desc Verify map byteOffset Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.map((v) => v >= 0 ? v : v);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_4900
     * @tc.name testTypedUArraysMapPartTestFileB049
     * @tc.desc Verify map isView Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.map((v) => v >= 0 ? v : v);
      expect(ArrayBuffer.isView(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_5000
     * @tc.name testTypedUArraysMapPartTestFileB050
     * @tc.desc Verify map buffer Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.map((v) => v >= 0 ? v : v);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_5100
     * @tc.name testTypedUArraysMapPartTestFileB051
     * @tc.desc Verify map callback Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.map((v) => v >= 0 ? v : v);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_5200
     * @tc.name testTypedUArraysMapPartTestFileB052
     * @tc.desc Verify map callback Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let result = arr.map((v) => v >= 0 ? v : v);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_5300
     * @tc.name testTypedUArraysMapPartTestFileB053
     * @tc.desc Verify map callback Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      let result = arr.map((v) => v >= 0 ? v : v);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_5400
     * @tc.name testTypedUArraysMapPartTestFileB054
     * @tc.desc Verify map callback BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.map((v) => v >= 0n ? v : v);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_5500
     * @tc.name testTypedUArraysMapPartTestFileB055
     * @tc.desc Verify map callback Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let result = arr.map((v) => v >= 0 ? v : v);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_5600
     * @tc.name testTypedUArraysMapPartTestFileB056
     * @tc.desc Verify map callback BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.map((v) => v);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_5700
     * @tc.name testTypedUArraysMapPartTestFileB057
     * @tc.desc Verify map callback 1e10 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      let result = arr.map((v) => v >= 0 ? v : v);
      const val37 = result[0];
      expect(val37).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_5800
     * @tc.name testTypedUArraysMapPartTestFileB058
     * @tc.desc Verify map callback Math.PI Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.map((v) => v >= 0 ? v : v);
      const val39 = result[0];
      expect(val39).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_5900
     * @tc.name testTypedUArraysMapPartTestFileB059
     * @tc.desc Verify map - callback + thisArg Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let result = arr.map((v) => v >= 0 ? v : v);
      const val48 = result[0];
      expect(val48).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_6000
     * @tc.name testTypedUArraysMapPartTestFileB060
     * @tc.desc Verify map - callback + thisArg BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.map((v) => v);
      const val50 = result[0];
      expect(val50).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART102_6100
     * @tc.name testTypedUArraysMapPartTestFileB061
     * @tc.desc Verify map - callback + thisArg Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileB061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let result = arr.map((v) => v >= 0 ? v : v);
      const val51 = result[0];
      expect(val51).assertEqual(1);
    });
  });
}
