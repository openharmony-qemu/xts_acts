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

export default function typedUArraysDefaultIteratorTest01(): void {
  describe('TypedUArraysDefaultIteratorTest01', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_0100
     * @tc.name testTypedUArraysDefaultIterator0101_001
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(1);
      expect(result1.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_0200
     * @tc.name testTypedUArraysDefaultIterator0101_002
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const iterator = arr.values();
      let result = iterator.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_0300
     * @tc.name testTypedUArraysDefaultIterator0101_003
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(42);
      expect(result1.done).assertFalse();
      const result2 = iterator.next();
      expect(result2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_0400
     * @tc.name testTypedUArraysDefaultIterator0101_004
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40, 50]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(10);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(20);
      const result3 = iterator.next();
      expect(result3.value).assertEqual(30);
      const result4 = iterator.next();
      expect(result4.value).assertEqual(40);
      const result5 = iterator.next();
      expect(result5.value).assertEqual(50);
      const result6 = iterator.next();
      expect(result6.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_0500
     * @tc.name testTypedUArraysDefaultIterator0101_005
     * @tc.desc Verify 0 for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 10, 15]);
      const collected: Array<number> = [];
      for (let i = 0; i < arr.length; i++) { const item = arr[i.toInt()]; 
        collected.push(item);
      }
      expect(collected[0]).assertEqual(5);
      expect(collected[1]).assertEqual(10);
      expect(collected[2]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_0600
     * @tc.name testTypedUArraysDefaultIterator0101_006
     * @tc.desc Verify 0 Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([100, 200, 50]);
      let result = Array.from(arr);
      expect(result[0]).assertEqual(100);
      expect(result[1]).assertEqual(200);
      expect(result[2]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_0700
     * @tc.name testTypedUArraysDefaultIterator0101_007
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([7, 14, 21]);
      let result = arr.slice();
      expect(result[0]).assertEqual(7);
      expect(result[1]).assertEqual(14);
      expect(result[2]).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_0800
     * @tc.name testTypedUArraysDefaultIterator0101_008
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      const iterator = arr.values();
      expect(typeof iterator.next).assertEqual('function');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_0900
     * @tc.name testTypedUArraysDefaultIterator0101_009
     * @tc.desc Verify 0 next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([100]);
      const iterator = arr.values();
      let result = iterator.next();
      expect(typeof result.value).assertEqual('number');
      expect(typeof result.done).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_1000
     * @tc.name testTypedUArraysDefaultIterator0101_010
     * @tc.desc Verify length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const iterator = arr.values();
      let result = iterator.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_1100
     * @tc.name testTypedUArraysDefaultIterator0101_011
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(1);
      expect(result1.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_1200
     * @tc.name testTypedUArraysDefaultIterator0101_012
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(1);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(2);
      expect(result2.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_1300
     * @tc.name testTypedUArraysDefaultIterator0101_013
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(1);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(2);
      const result3 = iterator.next();
      expect(result3.value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_1400
     * @tc.name testTypedUArraysDefaultIterator0101_014
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      const iterator = arr.values();
      let count = 0;
      let sum = 0;
      let result = iterator.next();
      while (!result.done) {
        sum += (result.value as number);
        count++;
        result = iterator.next();
      }
      expect(count).assertEqual(10);
      expect(sum).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_1500
     * @tc.name testTypedUArraysDefaultIterator0101_015
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i.toInt()] = i;
      }
      const iterator = arr.values();
      let sum = 0;
      let count = 0;
      let result = iterator.next();
      while (!result.done) {
        sum += (result.value as number);
        count++;
        result = iterator.next();
      }
      expect(count).assertEqual(100);
      expect(sum).assertEqual(4950);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_1600
     * @tc.name testTypedUArraysDefaultIterator0101_016
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      const iterator = arr.values();
      let result = iterator.next();
      while (!result.done) {
        expect(result.value).assertEqual(0);
        result = iterator.next();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_1700
     * @tc.name testTypedUArraysDefaultIterator0101_017
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42, 42, 42, 42]);
      const iterator = arr.values();
      let result = iterator.next();
      while (!result.done) {
        expect(result.value).assertEqual(42);
        result = iterator.next();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_1800
     * @tc.name testTypedUArraysDefaultIterator0101_018
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 0, 2, 0]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(0);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_1900
     * @tc.name testTypedUArraysDefaultIterator0101_019
     * @tc.desc Verify 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 128, 255]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(255);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(128);
      const result3 = iterator.next();
      expect(result3.value).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_2000
     * @tc.name testTypedUArraysDefaultIterator0101_020
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0xFF, 0x80, 0x01]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(255);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(128);
      const result3 = iterator.next();
      expect(result3.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_2100
     * @tc.name testTypedUArraysDefaultIterator0101_021
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0o377, 0o100, 0o1]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(255);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(64);
      const result3 = iterator.next();
      expect(result3.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_2200
     * @tc.name testTypedUArraysDefaultIterator0101_022
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0b11111111, 0b10000000, 0b00000001]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(255);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(128);
      const result3 = iterator.next();
      expect(result3.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_2300
     * @tc.name testTypedUArraysDefaultIterator0101_023
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([-1, -2, -128, -256]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(255);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(254);
      const result3 = iterator.next();
      expect(result3.value).assertEqual(128);
      const result4 = iterator.next();
      expect(result4.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_2400
     * @tc.name testTypedUArraysDefaultIterator0101_024
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([256, 512, 1000, 300]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(0);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(0);
      const result3 = iterator.next();
      expect(result3.value).assertEqual(232);
      const result4 = iterator.next();
      expect(result4.value).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_2500
     * @tc.name testTypedUArraysDefaultIterator0101_025
     * @tc.desc Verify NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([Number.NaN, 1, 2]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(0);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_2600
     * @tc.name testTypedUArraysDefaultIterator0101_026
     * @tc.desc Verify Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY, 1]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(0);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(0);
      const result3 = iterator.next();
      expect(result3.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_2700
     * @tc.name testTypedUArraysDefaultIterator0101_027
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(0);
      const iterator = arr.values();
      let result = iterator.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_2800
     * @tc.name testTypedUArraysDefaultIterator0101_028
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1]);
      const iterator = arr.values();
      let result = iterator.next();
      expect(result.value).assertEqual(1);
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_2900
     * @tc.name testTypedUArraysDefaultIterator0101_029
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(100);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(200);
      const result3 = iterator.next();
      expect(result3.value).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_3000
     * @tc.name testTypedUArraysDefaultIterator0101_030
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535, 32767, 0xFFFF]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(65535);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(32767);
      const result3 = iterator.next();
      expect(result3.value).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_3100
     * @tc.name testTypedUArraysDefaultIterator0101_031
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0xFFFF, 0x8000, 0x0001]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(65535);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(32768);
      const result3 = iterator.next();
      expect(result3.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_3200
     * @tc.name testTypedUArraysDefaultIterator0101_032
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([-1, -2, -32768]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(65535);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(65534);
      const result3 = iterator.next();
      expect(result3.value).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_3300
     * @tc.name testTypedUArraysDefaultIterator0101_033
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65536, 100000]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(0);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(34464);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_3400
     * @tc.name testTypedUArraysDefaultIterator0101_034
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      const iterator = arr.values();
      let result = iterator.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_3500
     * @tc.name testTypedUArraysDefaultIterator0101_035
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1]);
      const iterator = arr.values();
      let result = iterator.next();
      expect(result.value).assertEqual(1);
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_3600
     * @tc.name testTypedUArraysDefaultIterator0101_036
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(1000);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(2000);
      const result3 = iterator.next();
      expect(result3.value).assertEqual(3000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_3700
     * @tc.name testTypedUArraysDefaultIterator0101_037
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 2147483647, 0xFFFFFFFF]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(4294967295);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(2147483647);
      const result3 = iterator.next();
      expect(result3.value).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_3800
     * @tc.name testTypedUArraysDefaultIterator0101_038
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0xFFFFFFFF, 0x80000000, 0x00000001]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(4294967295);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(2147483648);
      const result3 = iterator.next();
      expect(result3.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_3900
     * @tc.name testTypedUArraysDefaultIterator0101_039
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([-1, -2, -2147483648]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(4294967295);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(4294967294);
      const result3 = iterator.next();
      expect(result3.value).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_4000
     * @tc.name testTypedUArraysDefaultIterator0101_040
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0);
      const iterator = arr.values();
      let result = iterator.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_4100
     * @tc.name testTypedUArraysDefaultIterator0101_041
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n]);
      const iterator = arr.values();
      let result = iterator.next();
      expect(result.value).assertEqual(1n);
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_4200
     * @tc.name testTypedUArraysDefaultIterator0101_042
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([100n, 200n, 300n]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(100n);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(200n);
      const result3 = iterator.next();
      expect(result3.value).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_4300
     * @tc.name testTypedUArraysDefaultIterator0101_043
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), 0n]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(BigInt('18446744073709551615'));
      const result2 = iterator.next();
      expect(result2.value).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_4400
     * @tc.name testTypedUArraysDefaultIterator0101_044
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n]);
      const iterator = arr.values();
      let result = iterator.next();
      while (!result.done) {
        expect(result.value).assertEqual(0n);
        result = iterator.next();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_4500
     * @tc.name testTypedUArraysDefaultIterator0101_045
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const iterator = arr.values();
      let result = iterator.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_4600
     * @tc.name testTypedUArraysDefaultIterator0101_046
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const iterator = arr.values();
      let result = iterator.next();
      expect(result.value).assertEqual(1);
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_4700
     * @tc.name testTypedUArraysDefaultIterator0101_047
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(10);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(20);
      const result3 = iterator.next();
      expect(result3.value).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_4800
     * @tc.name testTypedUArraysDefaultIterator0101_048
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 128, 0]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(255);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(128);
      const result3 = iterator.next();
      expect(result3.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_4900
     * @tc.name testTypedUArraysDefaultIterator0101_049
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1, -100, -256]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(0);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(0);
      const result3 = iterator.next();
      expect(result3.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_5000
     * @tc.name testTypedUArraysDefaultIterator0101_050
     * @tc.desc Verify Uint8ClampedArray iterates with saturation for over-range values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([256, 1000, 300]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(255);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(255);
      const result3 = iterator.next();
      expect(result3.value).assertEqual(255);
    });

  });
}
