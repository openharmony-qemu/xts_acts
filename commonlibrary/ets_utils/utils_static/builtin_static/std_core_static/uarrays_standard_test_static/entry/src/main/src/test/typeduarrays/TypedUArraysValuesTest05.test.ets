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

export default function typedUArraysValuesTest05(): void {
  describe('TypedUArraysValuesTest05', (): void => {
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
     * @tc.desc Verify independent iterators don't interfere
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const iter1 = arr.values();
      const iter2 = arr.values();
      while (!iter1.next().done) {}
      expect(iter2.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_0200
     * @tc.name testTypedUArraysValuesPart2_002
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const iter = arr.values();
      while (!iter.next().done) {}
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_0300
     * @tc.name testTypedUArraysValuesPart2_003
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const iter1 = arr.values();
      const iter2 = arr.values();
      expect(iter1 !== iter2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_0400
     * @tc.name testTypedUArraysValuesPart2_004
     * @tc.desc Verify Symbol.iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('testTypedUArraysValuesPart2_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   const arr = new Uint8Array([1, 2, 3]);
    //   const iter = arr.values();
    //   expect(typeof (iter as Object)[Symbol.iterator]).assertEqual("function");
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_0500
     * @tc.name testTypedUArraysValuesPart2_005
     * @tc.desc Verify Symbol.iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('testTypedUArraysValuesPart2_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   const arr = new Uint8Array([1, 2, 3]);
    //   const iter = arr.values();
    //   expect((iter as Object)[Symbol.iterator] as Object).assertEqual(iter);
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_0600
     * @tc.name testTypedUArraysValuesPart2_006
     * @tc.desc Verify Uint16Array Symbol.iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('testTypedUArraysValuesPart2_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   const arr = new Uint16Array([100, 200]);
    //   const iter = arr.values();
    //   expect(typeof (iter as Object)[Symbol.iterator]).assertEqual("function");
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_0700
     * @tc.name testTypedUArraysValuesPart2_007
     * @tc.desc Verify BigUint64Array Symbol.iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('testTypedUArraysValuesPart2_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   const arr = new BigUint64Array([1n, 2n]);
    //   const iter = arr.values();
    //   expect(typeof (iter as Object)[Symbol.iterator]).assertEqual("function");
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_0800
     * @tc.name testTypedUArraysValuesPart2_008
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = Array.from(arr.values());
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_0900
     * @tc.name testTypedUArraysValuesPart2_009
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      let result = Array.from(arr.values());
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_1000
     * @tc.name testTypedUArraysValuesPart2_010
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      let result = Array.from(arr.values());
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_1100
     * @tc.name testTypedUArraysValuesPart2_011
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      let result = Array.from(arr.values());
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(100);
      expect(result[1]).assertEqual(200);
      expect(result[2]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_1200
     * @tc.name testTypedUArraysValuesPart2_012
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = Array.from(arr.values());
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1n);
      expect(result[1]).assertEqual(2n);
      expect(result[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_1300
     * @tc.name testTypedUArraysValuesPart2_013
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      expect(arr.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_1400
     * @tc.name testTypedUArraysValuesPart2_014
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = Array.from(arr.values());
      const val3: number = result[0];
      expect(val3).assertEqual(10);
      const val4: number = result[1];
      expect(val4).assertEqual(20);
      const val5: number = result[2];
      expect(val5).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_1500
     * @tc.name testTypedUArraysValuesPart2_015
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 200, 255]);
      let result = Array.from(arr.values());
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(100);
      expect(result[1]).assertEqual(200);
      expect(result[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_1600
     * @tc.name testTypedUArraysValuesPart2_016
     * @tc.desc Verify for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const collected: number[] = [];
      for (const v of arr.values()) { collected.push(v); }
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(10);
      expect(collected[1]).assertEqual(20);
      expect(collected[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_1700
     * @tc.name testTypedUArraysValuesPart2_017
     * @tc.desc Verify for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      let count = 0;
      for (const _ of arr.values()) { count++; }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_1800
     * @tc.name testTypedUArraysValuesPart2_018
     * @tc.desc Verify for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([99]);
      const collected: number[] = [];
      for (const v of arr.values()) { collected.push(v); }
      expect(collected.length).assertEqual(1);
      expect(collected[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_1900
     * @tc.name testTypedUArraysValuesPart2_019
     * @tc.desc Verify for...of Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1000, 2000]);
      const collected: number[] = [];
      for (const v of arr.values()) { collected.push(v); }
      expect(collected.length).assertEqual(2);
      expect(collected[0]).assertEqual(1000);
      expect(collected[1]).assertEqual(2000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_2000
     * @tc.name testTypedUArraysValuesPart2_020
     * @tc.desc Verify for...of BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([100n, 200n]);
      const collected: BigInt[] = [];
      for (const v of arr.values()) { collected.push(v); }
      expect(collected.length).assertEqual(2);
      expect(collected[0]).assertEqual(100n);
      expect(collected[1]).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_2100
     * @tc.name testTypedUArraysValuesPart2_021
     * @tc.desc Verify for...of Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 100, 150]);
      const collected: number[] = [];
      for (const v of arr.values()) { collected.push(v); }
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(50);
      expect(collected[1]).assertEqual(100);
      expect(collected[2]).assertEqual(150);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_2200
     * @tc.name testTypedUArraysValuesPart2_022
     * @tc.desc Verify Array.from BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n, 10n, 15n]);
      let result = Array.from(arr.values());
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(5n);
      expect(result[1]).assertEqual(10n);
      expect(result[2]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_2300
     * @tc.name testTypedUArraysValuesPart2_023
     * @tc.desc Verify Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 10, 15]);
      let result = Array.from(arr.values());
      const val6: number = result[0];
      expect(val6).assertEqual(5);
      const val7: number = result[1];
      expect(val7).assertEqual(10);
      const val8: number = result[2];
      expect(val8).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_2400
     * @tc.name testTypedUArraysValuesPart2_024
     * @tc.desc Verify Array.from Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1000, 2000, 3000]);
      let result = Array.from(arr.values());
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1000);
      expect(result[1]).assertEqual(2000);
      expect(result[2]).assertEqual(3000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_2500
     * @tc.name testTypedUArraysValuesPart2_025
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const values = Array.from(arr.values());
      const a: number = values[0];
      const b: number = values[1];
      const c: number = values[2];
      expect(a).assertEqual(10);
      expect(b).assertEqual(20);
      expect(c).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_2600
     * @tc.name testTypedUArraysValuesPart2_026
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const values = Array.from(arr.values());
      const a: number = values[0];
      expect(a).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_2700
     * @tc.name testTypedUArraysValuesPart2_027
     * @tc.desc Verify undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      const values = Array.from(arr.values());
      expect(values.length).assertEqual(2);
      expect(values[0]).assertEqual(1);
      expect(values[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_2800
     * @tc.name testTypedUArraysValuesPart2_028
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n]);
      const values = Array.from(arr.values());
      const a: BigInt = values[0];
      const b: BigInt = values[1];
      expect(a).assertEqual(10n);
      expect(b).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_2900
     * @tc.name testTypedUArraysValuesPart2_029
     * @tc.desc Verify "@@toStringTag" Array Iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('testTypedUArraysValuesPart2_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   const arr = new Uint8Array([1, 2, 3]);
    //   const iter = arr.values();
    //   const val9 = (iter as any)["@@toStringTag"];
    //   expect(val9).assertEqual("Array Iterator");
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_3000
     * @tc.name testTypedUArraysValuesPart2_030
     * @tc.desc Verify Uint16Array "@@toStringTag"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('testTypedUArraysValuesPart2_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   const arr = new Uint16Array([100, 200]);
    //   const iter = arr.values();
    //   const val10 = (iter as any)["@@toStringTag"];
    //   expect(val10).assertEqual("Array Iterator");
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_3100
     * @tc.name testTypedUArraysValuesPart2_031
     * @tc.desc Verify BigUint64Array "@@toStringTag"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('testTypedUArraysValuesPart2_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   const arr = new BigUint64Array([1n, 2n]);
    //   const iter = arr.values();
    //   const val11 = (iter as any)["@@toStringTag"];
    //   expect(val11).assertEqual("Array Iterator");
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_3200
     * @tc.name testTypedUArraysValuesPart2_032
     * @tc.desc Verify Uint8ClampedArray "@@toStringTag"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('testTypedUArraysValuesPart2_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   const arr = new Uint8ClampedArray([100, 200]);
    //   const iter = arr.values();
    //   const val12 = (iter as any)["@@toStringTag"];
    //   expect(val12).assertEqual("Array Iterator");
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_3300
     * @tc.name testTypedUArraysValuesPart2_033
     * @tc.desc Verify Uint32Array "@@toStringTag"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('testTypedUArraysValuesPart2_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   const arr = new Uint32Array([100000, 200000]);
    //   const iter = arr.values();
    //   const val13 = (iter as any)["@@toStringTag"];
    //   expect(val13).assertEqual("Array Iterator");
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_3400
     * @tc.name testTypedUArraysValuesPart2_034
     * @tc.desc Verify ArrayBuffer value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_3500
     * @tc.name testTypedUArraysValuesPart2_035
     * @tc.desc Verify value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 4, 4);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_3600
     * @tc.name testTypedUArraysValuesPart2_036
     * @tc.desc Verify value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1, 2, 3, 4, 5];
      const arr = new Uint8Array(src);
      const iter = arr.values();
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_3700
     * @tc.name testTypedUArraysValuesPart2_037
     * @tc.desc Verify set Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      arr.set([10, 20, 30]);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_3800
     * @tc.name testTypedUArraysValuesPart2_038
     * @tc.desc Verify set with offset Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      arr.set([1, 2, 3], 1);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_3900
     * @tc.name testTypedUArraysValuesPart2_039
     * @tc.desc Verify indexOf Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 20]);
      expect(arr.indexOf(20)).assertEqual(1);
      expect(arr.indexOf(99)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_4000
     * @tc.name testTypedUArraysValuesPart2_040
     * @tc.desc Verify includes Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      expect(arr.includes(20)).assertTrue();
      expect(arr.includes(99)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_4100
     * @tc.name testTypedUArraysValuesPart2_041
     * @tc.desc Verify join Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      expect(arr.join()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_4200
     * @tc.name testTypedUArraysValuesPart2_042
     * @tc.desc Verify join with separator Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([10, 20, 30]);
      expect(arr.join('-')).assertEqual('10-20-30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART2_4300
     * @tc.name testTypedUArraysValuesPart2_043
     * @tc.desc Verify slice Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart2_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const sub = arr.slice(1, 4);
      expect(sub[0]).assertEqual(2);
      expect(sub[2]).assertEqual(4);
    });

  });
}
