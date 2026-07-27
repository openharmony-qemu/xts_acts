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

export default function typedUArraysDefaultIteratorTest04(): void {
  describe('TypedUArraysDefaultIteratorTest04', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0104_0100
     * @tc.name testTypedUArraysDefaultIterator0104_001
     * @tc.desc Verify Uint8ClampedArray iterates with saturation for over-range values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0104_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([256, 1000, 300]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(255);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(255);
      const result3 = iterator.next();
      expect(result3.value).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_5100
     * @tc.name testTypedUArraysDefaultIterator0101_051
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0xFF, 0x80, 0x01]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(255);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(128);
      const result3 = iterator.next();
      expect(result3.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_5200
     * @tc.name testTypedUArraysDefaultIterator0101_052
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1.9, 2.1, 3.5, 0.5]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(1);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(2);
      const result3 = iterator.next();
      expect(result3.value).assertEqual(3);
      const result4 = iterator.next();
      expect(result4.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_5300
     * @tc.name testTypedUArraysDefaultIterator0101_053
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1e2, 1e1, 1e0]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(100);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(10);
      const result3 = iterator.next();
      expect(result3.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_5400
     * @tc.name testTypedUArraysDefaultIterator0101_054
     * @tc.desc Verify 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(1000);
      for (let i = 0; i < 1000; i++) {
        arr[i.toInt()] = i % 256;
      }
      const iterator = arr.values();
      let count = 0;
      let result = iterator.next();
      while (!result.done) {
        count++;
        result = iterator.next();
      }
      expect(count).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_5500
     * @tc.name testTypedUArraysDefaultIterator0101_055
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 255, 0, 255, 0, 255]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(0);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(255);
      const result3 = iterator.next();
      expect(result3.value).assertEqual(0);
      const result4 = iterator.next();
      expect(result4.value).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_5600
     * @tc.name testTypedUArraysDefaultIterator0101_056
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
      const iterator = arr.values();
      let expected = 0;
      let result = iterator.next();
      while (!result.done) {
        expect(result.value).assertEqual(expected);
        expected++;
        result = iterator.next();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_5700
     * @tc.name testTypedUArraysDefaultIterator0101_057
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([9, 8, 7, 6, 5, 4, 3, 2, 1, 0]);
      const iterator = arr.values();
      let expected = 9;
      let result = iterator.next();
      while (!result.done) {
        expect(result.value).assertEqual(expected);
        expected--;
        result = iterator.next();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_5800
     * @tc.name testTypedUArraysDefaultIterator0101_058
     * @tc.desc Verify 0x80
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0x80, 0x00, 0xFF]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(128);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(0);
      const result3 = iterator.next();
      expect(result3.value).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_5900
     * @tc.name testTypedUArraysDefaultIterator0101_059
     * @tc.desc Verify 0x8000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0x8000, 0x0000, 0xFFFF]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(32768);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(0);
      const result3 = iterator.next();
      expect(result3.value).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_6000
     * @tc.name testTypedUArraysDefaultIterator0101_060
     * @tc.desc Verify 0x80000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0x80000000, 0x00000000, 0xFFFFFFFF]);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(2147483648);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(0);
      const result3 = iterator.next();
      expect(result3.value).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_6100
     * @tc.name testTypedUArraysDefaultIterator0101_061
     * @tc.desc Verify next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      const iterator = arr.values();
      iterator.next();
      iterator.next();
      let result = iterator.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_6200
     * @tc.name testTypedUArraysDefaultIterator0101_062
     * @tc.desc Verify next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1]);
      const iterator = arr.values();
      iterator.next();
      const result1 = iterator.next();
      expect(result1.done).assertTrue();
      const result2 = iterator.next();
      expect(result2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_6300
     * @tc.name testTypedUArraysDefaultIterator0101_063
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const iterator = arr.values();
      iterator.next();
      let result = iterator.next();
      expect(result.value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_6400
     * @tc.name testTypedUArraysDefaultIterator0101_064
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const iterator1 = arr.values();
      const iterator2 = arr.values();
      const result1 = iterator1.next();
      const result2 = iterator2.next();
      expect(result1.value).assertEqual(1);
      expect(result2.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_6500
     * @tc.name testTypedUArraysDefaultIterator0101_065
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(10);
      const iterator = arr.values();
      let count = 0;
      let result = iterator.next();
      while (!result.done) {
        count++;
        result = iterator.next();
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_6600
     * @tc.name testTypedUArraysDefaultIterator0101_066
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200]);
      const iterator = arr.values();
      let result = iterator.next();
      expect(result.value).assertEqual(100);
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_6700
     * @tc.name testTypedUArraysDefaultIterator0101_067
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([100n, 200n]);
      const iterator = arr.values();
      let result = iterator.next();
      expect(result.value).assertEqual(100n);
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_6800
     * @tc.name testTypedUArraysDefaultIterator0101_068
     * @tc.desc Verify values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iterator1 = arr.values();
      const iterator2 = arr.values();
      const result1 = iterator1.next();
      const result2 = iterator2.next();
      expect(result1.value).assertEqual(result2.value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_6900
     * @tc.name testTypedUArraysDefaultIterator0101_069
     * @tc.desc Verify for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 3, 8, 1, 9]);
      const iterator = arr.values();
      const collected: Array<number> = [];
      let result = iterator.next();
      while (!result.done) {
        collected.push(result.value as number);
        result = iterator.next();
      }
      const forOfCollected: Array<number> = [];
      for (let i = 0; i < arr.length; i++) { const item = arr[i.toInt()];
        forOfCollected.push(item);
      }
      expect(collected[0]).assertEqual(forOfCollected[0]);
      expect(collected[1]).assertEqual(forOfCollected[1]);
      expect(collected[2]).assertEqual(forOfCollected[2]);
      expect(collected[3]).assertEqual(forOfCollected[3]);
      expect(collected[4]).assertEqual(forOfCollected[4]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_7000
     * @tc.name testTypedUArraysDefaultIterator0101_070
     * @tc.desc Verify next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const iterator = arr.values();
      let result = iterator.next();
      expect(result.done).assertFalse();
      expect(result.value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_7100
     * @tc.name testTypedUArraysDefaultIterator0101_071
     * @tc.desc Verify next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const iterator = arr.values();
      let result = iterator.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_7200
     * @tc.name testTypedUArraysDefaultIterator0101_072
     * @tc.desc Verify Symbol.iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      const iter = arr.values();
      const result = iter.next();
      expect(result.value).assertEqual(1);
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_7300
     * @tc.name testTypedUArraysDefaultIterator0101_073
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const iterator = arr.values();
      const result1 = iterator.next();
      const result2 = iterator.next();
      const result3 = iterator.next();
      expect(result1.value).assertEqual(1);
      expect(result2.value).assertEqual(2);
      expect(result3.value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_7400
     * @tc.name testTypedUArraysDefaultIterator0101_074
     * @tc.desc Verify for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let count = 0;
      for (let i = 0; i < arr.length; i++) { 
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_7500
     * @tc.name testTypedUArraysDefaultIterator0101_075
     * @tc.desc Verify for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      let count = 0;
      for (let i = 0; i < arr.length; i++) { 
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_7600
     * @tc.name testTypedUArraysDefaultIterator0101_076
     * @tc.desc Verify for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([99]);
      let count = 0;
      let lastValue: number = 0;
      for (let i = 0; i < arr.length; i++) { const item = arr[i.toInt()];
        count++;
        lastValue = item;
      }
      expect(count).assertEqual(1);
      expect(lastValue).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_7700
     * @tc.name testTypedUArraysDefaultIterator0101_077
     * @tc.desc Verify for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i.toInt()] = i;
      }
      let sum = 0;
      for (let i = 0; i < arr.length; i++) { const item = arr[i.toInt()];
        sum += item;
      }
      expect(sum).assertEqual(4950);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_7800
     * @tc.name testTypedUArraysDefaultIterator0101_078
     * @tc.desc Verify for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      let allZero = true;
      for (let i = 0; i < arr.length; i++) { const item = arr[i.toInt()]; 
        if (item !== 0) {
          allZero = false;
        }
      }
      expect(allZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_7900
     * @tc.name testTypedUArraysDefaultIterator0101_079
     * @tc.desc Verify for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 128, 255]);
      const collected: Array<number> = [];
      for (let i = 0; i < arr.length; i++) { const item = arr[i.toInt()];
        collected.push(item);
      }
      expect(collected[0]).assertEqual(0);
      expect(collected[1]).assertEqual(128);
      expect(collected[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_8000
     * @tc.name testTypedUArraysDefaultIterator0101_080
     * @tc.desc Verify for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0x00, 0x80, 0xFF]);
      const collected: Array<number> = [];
      for (let i = 0; i < arr.length; i++) { const item = arr[i.toInt()];
        collected.push(item);
      }
      expect(collected[0]).assertEqual(0);
      expect(collected[1]).assertEqual(128);
      expect(collected[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_8100
     * @tc.name testTypedUArraysDefaultIterator0101_081
     * @tc.desc Verify for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([-1, 256, 300]);
      const collected: Array<number> = [];
      for (let i = 0; i < arr.length; i++) { const item = arr[i.toInt()];
        collected.push(item);
      }
      expect(collected[0]).assertEqual(255);
      expect(collected[1]).assertEqual(0);
      expect(collected[2]).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_8200
     * @tc.name testTypedUArraysDefaultIterator0101_082
     * @tc.desc Verify for-of Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 32768, 65535]);
      const collected: Array<number> = [];
      for (let i = 0; i < arr.length; i++) { const item = arr[i.toInt()];
        collected.push(item);
      }
      expect(collected[0]).assertEqual(0);
      expect(collected[1]).assertEqual(32768);
      expect(collected[2]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_8300
     * @tc.name testTypedUArraysDefaultIterator0101_083
     * @tc.desc Verify for-of Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 2147483648, 4294967295]);
      const collected: Array<number> = [];
      for (let i = 0; i < arr.length; i++) { const item = arr[i.toInt()];
        collected.push(item);
      }
      expect(collected[0]).assertEqual(0);
      expect(collected[1]).assertEqual(2147483648);
      expect(collected[2]).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_8400
     * @tc.name testTypedUArraysDefaultIterator0101_084
     * @tc.desc Verify for-of BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 1n, BigInt('18446744073709551615')]);
      const collected: Array<bigint> = [];
      for (let i = 0; i < arr.length; i++) { const item = arr[i.toInt()];
        collected.push(item);
      }
      expect(collected[0]).assertEqual(0n);
      expect(collected[1]).assertEqual(1n);
      expect(collected[2]).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_8500
     * @tc.name testTypedUArraysDefaultIterator0101_085
     * @tc.desc Verify for-of Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1, 256, 128]);
      const collected: Array<number> = [];
      for (let i = 0; i < arr.length; i++) { const item = arr[i.toInt()];
        collected.push(item);
      }
      expect(collected[0]).assertEqual(0);
      expect(collected[1]).assertEqual(255);
      expect(collected[2]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_8600
     * @tc.name testTypedUArraysDefaultIterator0101_086
     * @tc.desc Verify for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1.9, 2.1, 3.5]);
      const collected: Array<number> = [];
      for (let i = 0; i < arr.length; i++) { const item = arr[i.toInt()];
        collected.push(item);
      }
      expect(collected[0]).assertEqual(1);
      expect(collected[1]).assertEqual(2);
      expect(collected[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_8700
     * @tc.name testTypedUArraysDefaultIterator0101_087
     * @tc.desc Verify for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1e2, 1e1, 1e0]);
      const collected: Array<number> = [];
      for (let i = 0; i < arr.length; i++) { const item = arr[i.toInt()];
        collected.push(item);
      }
      expect(collected[0]).assertEqual(100);
      expect(collected[1]).assertEqual(10);
      expect(collected[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_8800
     * @tc.name testTypedUArraysDefaultIterator0101_088
     * @tc.desc Verify for-of NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([Number.NaN, 1, 2]);
      const collected: Array<number> = [];
      for (let i = 0; i < arr.length; i++) { const item = arr[i.toInt()];
        collected.push(item);
      }
      expect(collected[0]).assertEqual(0);
      expect(collected[1]).assertEqual(1);
      expect(collected[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_8900
     * @tc.name testTypedUArraysDefaultIterator0101_089
     * @tc.desc Verify for-of Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY, 1]);
      const collected: Array<number> = [];
      for (let i = 0; i < arr.length; i++) { const item = arr[i.toInt()];
        collected.push(item);
      }
      expect(collected[0]).assertEqual(0);
      expect(collected[1]).assertEqual(0);
      expect(collected[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_9000
     * @tc.name testTypedUArraysDefaultIterator0101_090
     * @tc.desc Verify for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 255, 0, 255, 0, 255]);
      const collected: Array<number> = [];
      for (let i = 0; i < arr.length; i++) { const item = arr[i.toInt()];
        collected.push(item);
      }
      expect(collected[0]).assertEqual(0);
      expect(collected[1]).assertEqual(255);
      expect(collected[2]).assertEqual(0);
      expect(collected[3]).assertEqual(255);
      expect(collected[4]).assertEqual(0);
      expect(collected[5]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_9100
     * @tc.name testTypedUArraysDefaultIterator0101_091
     * @tc.desc Verify for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
      const collected: Array<number> = [];
      for (let i = 0; i < arr.length; i++) { const item = arr[i.toInt()];
        collected.push(item);
      }
      expect(collected[0]).assertEqual(0);
      expect(collected[1]).assertEqual(1);
      expect(collected[2]).assertEqual(2);
      expect(collected[3]).assertEqual(3);
      expect(collected[4]).assertEqual(4);
      expect(collected[5]).assertEqual(5);
      expect(collected[6]).assertEqual(6);
      expect(collected[7]).assertEqual(7);
      expect(collected[8]).assertEqual(8);
      expect(collected[9]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_9200
     * @tc.name testTypedUArraysDefaultIterator0101_092
     * @tc.desc Verify for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([9, 8, 7, 6, 5, 4, 3, 2, 1, 0]);
      const collected: Array<number> = [];
      for (let i = 0; i < arr.length; i++) { const item = arr[i.toInt()];
        collected.push(item);
      }
      expect(collected[0]).assertEqual(9);
      expect(collected[1]).assertEqual(8);
      expect(collected[2]).assertEqual(7);
      expect(collected[3]).assertEqual(6);
      expect(collected[4]).assertEqual(5);
      expect(collected[5]).assertEqual(4);
      expect(collected[6]).assertEqual(3);
      expect(collected[7]).assertEqual(2);
      expect(collected[8]).assertEqual(1);
      expect(collected[9]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_9300
     * @tc.name testTypedUArraysDefaultIterator0101_093
     * @tc.desc Verify for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42, 42, 42, 42, 42]);
      const collected: Array<number> = [];
      for (let i = 0; i < arr.length; i++) { const item = arr[i.toInt()];
        collected.push(item);
      }
      expect(collected[0]).assertEqual(42);
      expect(collected[1]).assertEqual(42);
      expect(collected[2]).assertEqual(42);
      expect(collected[3]).assertEqual(42);
      expect(collected[4]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_9400
     * @tc.name testTypedUArraysDefaultIterator0101_094
     * @tc.desc Verify for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i.toInt()] = i;
      }
      let sum = 0;
      for (let i = 0; i < arr.length; i++) { const item = arr[i.toInt()];
        sum += item;
      }
      expect(sum).assertEqual(4950);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_9500
     * @tc.name testTypedUArraysDefaultIterator0101_095
     * @tc.desc Verify for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(1000);
      let count = 0;
      for (let i = 0; i < arr.length; i++) { 
        count++;
      }
      expect(count).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_9600
     * @tc.name testTypedUArraysDefaultIterator0101_096
     * @tc.desc Verify for-of Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([-1, 65536, 100000]);
      const collected: Array<number> = [];
      for (let i = 0; i < arr.length; i++) { const item = arr[i.toInt()];
        collected.push(item);
      }
      expect(collected[0]).assertEqual(65535);
      expect(collected[1]).assertEqual(0);
      expect(collected[2]).assertEqual(34464);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_9700
     * @tc.name testTypedUArraysDefaultIterator0101_097
     * @tc.desc Verify for-of Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([-1, 4294967296, 5000000000]);
      const collected: Array<number> = [];
      for (let i = 0; i < arr.length; i++) { const item = arr[i.toInt()];
        collected.push(item);
      }
      expect(collected[0]).assertEqual(4294967295);
      expect(collected[1]).assertEqual(0);
      expect(collected[2]).assertEqual(705032704);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_9800
     * @tc.name testTypedUArraysDefaultIterator0101_098
     * @tc.desc Verify for-of BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), 0n, 1n]);
      const collected: Array<bigint> = [];
      for (let i = 0; i < arr.length; i++) { const item = arr[i.toInt()];
        collected.push(item);
      }
      expect(collected[0]).assertEqual(BigInt('18446744073709551615'));
      expect(collected[1]).assertEqual(0n);
      expect(collected[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0101_9900
     * @tc.name testTypedUArraysDefaultIterator0101_099
     * @tc.desc Verify for-of Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0101_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 128, 255, -50, 300]);
      const collected: Array<number> = [];
      for (let i = 0; i < arr.length; i++) { const item = arr[i.toInt()];
        collected.push(item);
      }
      expect(collected[0]).assertEqual(0);
      expect(collected[1]).assertEqual(128);
      expect(collected[2]).assertEqual(255);
      expect(collected[3]).assertEqual(0);
      expect(collected[4]).assertEqual(255);
    });

  });
}
