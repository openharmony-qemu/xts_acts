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

export default function typedUArraysValuesTest03(): void {
  describe('TypedUArraysValuesTest03', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_0100
     * @tc.name testTypedUArraysValuesPart2_001
     * @tc.desc Verify values typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const iter = arr.values();
      const _r = iter.next();
      expect(_r.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_0200
     * @tc.name testTypedUArraysValuesPart2_002
     * @tc.desc Verify values next typeof function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const iter = arr.values();
      expect(iter.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_0300
     * @tc.name testTypedUArraysValuesPart2_003
     * @tc.desc Verify values next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const iter = arr.values();
      let result = iter.next();
      expect(result.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_0400
     * @tc.name testTypedUArraysValuesPart2_004
     * @tc.desc Verify next done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const iter = arr.values();
      let result = iter.next();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_0500
     * @tc.name testTypedUArraysValuesPart2_005
     * @tc.desc Verify values next value Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const iter = arr.values();
      expect(iter.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_0600
     * @tc.name testTypedUArraysValuesPart2_006
     * @tc.desc Verify constructor name Array Iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('testTypedUArraysValuesPart2_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   const arr = new Uint8Array([1, 2, 3]);
    //   const iter = arr.values();
    //   expect((iter['constructor'] as Function).name).assertEqual("Array Iterator");
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_0700
     * @tc.name testTypedUArraysValuesPart2_007
     * @tc.desc Verify values next value Uint8Array 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.values();
      expect(iter.next().value).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_0800
     * @tc.name testTypedUArraysValuesPart2_008
     * @tc.desc Verify values second next value Uint8Array 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.values();
      iter.next();
      expect(iter.next().value).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_0900
     * @tc.name testTypedUArraysValuesPart2_009
     * @tc.desc Verify values third next value Uint8Array 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.values();
      iter.next();
      iter.next();
      expect(iter.next().value).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_1000
     * @tc.name testTypedUArraysValuesPart2_010
     * @tc.desc Verify done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const iter = arr.values();
      iter.next();
      iter.next();
      iter.next();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_1100
     * @tc.name testTypedUArraysValuesPart2_011
     * @tc.desc Verify value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const iter = arr.values();
      expect(iter.next().value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_1200
     * @tc.name testTypedUArraysValuesPart2_012
     * @tc.desc Verify done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const iter = arr.values();
      iter.next();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_1300
     * @tc.name testTypedUArraysValuesPart2_013
     * @tc.desc Verify done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const iter = arr.values();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_1400
     * @tc.name testTypedUArraysValuesPart2_014
     * @tc.desc Verify done value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const iter = arr.values();
      let result = iter.next();
      expect(result.done).assertTrue();
      expect(result.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_1500
     * @tc.name testTypedUArraysValuesPart2_015
     * @tc.desc Verify Uint16Array value Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200]);
      const iter = arr.values();
      let result = iter.next();
      expect(result.value).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_1600
     * @tc.name testTypedUArraysValuesPart2_016
     * @tc.desc Verify Uint32Array value Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100000, 200000]);
      const iter = arr.values();
      let result = iter.next();
      expect(result.value).assertEqual(100000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_1700
     * @tc.name testTypedUArraysValuesPart2_017
     * @tc.desc Verify BigUint64Array value BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n]);
      const iter = arr.values();
      let result = iter.next();
      expect(result.value).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_1800
     * @tc.name testTypedUArraysValuesPart2_018
     * @tc.desc Verify value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2]);
      const iter = arr.values();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_1900
     * @tc.name testTypedUArraysValuesPart2_019
     * @tc.desc Verify value 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 0, 255]);
      const iter = arr.values();
      expect(iter.next().value).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_2000
     * @tc.name testTypedUArraysValuesPart2_020
     * @tc.desc Verify value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([7, 7, 7, 7]);
      const iter = arr.values();
      expect(iter.next().value).assertEqual(7);
      expect(iter.next().value).assertEqual(7);
      expect(iter.next().value).assertEqual(7);
      expect(iter.next().value).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_2100
     * @tc.name testTypedUArraysValuesPart2_021
     * @tc.desc Verify value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      const iter = arr.values();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_2200
     * @tc.name testTypedUArraysValuesPart2_022
     * @tc.desc Verify next done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      const iter = arr.values();
      iter.next();
      iter.next();
      const r1 = iter.next();
      const r2 = iter.next();
      expect(r1.done).assertTrue();
      expect(r2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_2300
     * @tc.name testTypedUArraysValuesPart2_023
     * @tc.desc Verify value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0xFF, 0x80, 0x00]);
      const iter = arr.values();
      expect(iter.next().value).assertEqual(255);
      expect(iter.next().value).assertEqual(128);
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_2400
     * @tc.name testTypedUArraysValuesPart2_024
     * @tc.desc Verify value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      const iter = arr.values();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_2500
     * @tc.name testTypedUArraysValuesPart2_025
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const iter = arr.values();
      let count = 0;
      while (!iter.next().done) { count++; }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_2600
     * @tc.name testTypedUArraysValuesPart2_026
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const iter = arr.values();
      let count = 0;
      while (!iter.next().done) { count++; }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_2700
     * @tc.name testTypedUArraysValuesPart2_027
     * @tc.desc Verify 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([99]);
      const iter = arr.values();
      let count = 0;
      while (!iter.next().done) { count++; }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_2800
     * @tc.name testTypedUArraysValuesPart2_028
     * @tc.desc Verify array values unchanged after values iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.values();
      iter.next();
      iter.next();
      iter.next();
      const val0: number = arr[0];
      expect(val0).assertEqual(10);
      const val1: number = arr[1];
      expect(val1).assertEqual(20);
      const val2: number = arr[2];
      expect(val2).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_2900
     * @tc.name testTypedUArraysValuesPart2_029
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const iter = arr.values();
      while (!iter.next().done) {}
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_3000
     * @tc.name testTypedUArraysValuesPart2_030
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_3100
     * @tc.name testTypedUArraysValuesPart2_031
     * @tc.desc Verify values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const iter1 = arr.values();
      const iter2 = arr.values();
      expect(iter1.next().value).assertEqual(1);
      expect(iter2.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_3200
     * @tc.name testTypedUArraysValuesPart2_032
     * @tc.desc Verify Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const iter = arr.values();
      const collected = Array.from(iter);
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(1);
      expect(collected[1]).assertEqual(2);
      expect(collected[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_3300
     * @tc.name testTypedUArraysValuesPart2_033
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      arr.fill(7);
      expect(arr[0]).assertEqual(7);
      expect(arr[4]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_3400
     * @tc.name testTypedUArraysValuesPart2_034
     * @tc.desc Verify fill with offset and length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.fill(9, 1, 4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(9);
      expect(arr[3]).assertEqual(9);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_3500
     * @tc.name testTypedUArraysValuesPart2_035
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 2);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(5);
    });

  });
}
