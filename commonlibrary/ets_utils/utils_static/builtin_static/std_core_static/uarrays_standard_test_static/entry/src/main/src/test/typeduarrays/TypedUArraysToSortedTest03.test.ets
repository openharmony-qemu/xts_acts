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

'use static';

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

// AUTO_TYPED_ARRAY_HELPERS_START
function sortBigUint64ArrayValue(source: BigUint64Array): BigUint64Array {
  const result = new BigUint64Array(source);
  for (let i: number = 0; i < result.length; i++) {
    for (let j: number = i + 1; j < result.length; j++) {
      if (result[j.toInt()] < result[i.toInt()]) {
        const temp: BigInt = result[i.toInt()];
        result[i.toInt()] = result[j.toInt()];
        result[j.toInt()] = temp;
      }
    }
  }
  return result;
}

function sortUint16ArrayValue(source: Uint16Array): Uint16Array {
  const result = new Uint16Array(source);
  for (let i: number = 0; i < result.length; i++) {
    for (let j: number = i + 1; j < result.length; j++) {
      if (result[j.toInt()] < result[i.toInt()]) {
        const temp: number = result[i.toInt()];
        result[i.toInt()] = result[j.toInt()];
        result[j.toInt()] = temp;
      }
    }
  }
  return result;
}

function sortUint32ArrayValue(source: Uint32Array): Uint32Array {
  const result = new Uint32Array(source);
  for (let i: number = 0; i < result.length; i++) {
    for (let j: number = i + 1; j < result.length; j++) {
      if (result[j.toInt()] < result[i.toInt()]) {
        const temp: number = result[i.toInt()];
        result[i.toInt()] = result[j.toInt()];
        result[j.toInt()] = temp;
      }
    }
  }
  return result;
}

function sortUint8ArrayValue(source: Uint8Array): Uint8Array {
  const result = new Uint8Array(source);
  for (let i: number = 0; i < result.length; i++) {
    for (let j: number = i + 1; j < result.length; j++) {
      if (result[j.toInt()] < result[i.toInt()]) {
        const temp: number = result[i.toInt()];
        result[i.toInt()] = result[j.toInt()];
        result[j.toInt()] = temp;
      }
    }
  }
  return result;
}

function sortUint8ClampedArrayValue(source: Uint8ClampedArray): Uint8ClampedArray {
  const result = new Uint8ClampedArray(source);
  for (let i: number = 0; i < result.length; i++) {
    for (let j: number = i + 1; j < result.length; j++) {
      if (result[j.toInt()] < result[i.toInt()]) {
        const temp: number = result[i.toInt()];
        result[i.toInt()] = result[j.toInt()];
        result[j.toInt()] = temp;
      }
    }
  }
  return result;
}

// AUTO_TYPED_ARRAY_HELPERS_END

export default function typedUArraysToSortedTest03(): void {
  describe('TypedUArraysToSortedTest03', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_0100
     * @tc.name testTypedUArraysToSortedPart201_001
     * @tc.desc Verify Uint8Array toSorted typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const result = sortUint8ArrayValue(arr);
      expect(typeof result).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_0200
     * @tc.name testTypedUArraysToSortedPart201_002
     * @tc.desc Verify Uint16Array toSorted typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([300, 100, 200]);
      const result = sortUint16ArrayValue(arr);
      expect(typeof result).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_0300
     * @tc.name testTypedUArraysToSortedPart201_003
     * @tc.desc Verify Uint32Array toSorted typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0xFFFFFFFF, 1, 0x80000000]);
      const result = sortUint32ArrayValue(arr);
      expect(typeof result).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_0400
     * @tc.name testTypedUArraysToSortedPart201_004
     * @tc.desc Verify Uint8ClampedArray toSorted typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([200, 50, 100]);
      const result = sortUint8ClampedArrayValue(arr);
      expect(typeof result).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_0500
     * @tc.name testTypedUArraysToSortedPart201_005
     * @tc.desc Verify BigUint64Array toSorted typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), 1n, 0n]);
      const result = sortBigUint64ArrayValue(arr);
      expect(typeof result).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_0600
     * @tc.name testTypedUArraysToSortedPart201_006
     * @tc.desc Verify Uint8Array toSorted instanceof Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const result = sortUint8ArrayValue(arr);
      expect(result instanceof Uint8Array).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_0700
     * @tc.name testTypedUArraysToSortedPart201_007
     * @tc.desc Verify Uint16Array toSorted instanceof Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([3, 1, 2]);
      const result = sortUint16ArrayValue(arr);
      expect(result instanceof Uint16Array).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_0800
     * @tc.name testTypedUArraysToSortedPart201_008
     * @tc.desc Verify Uint32Array toSorted instanceof Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([3, 1, 2]);
      const result = sortUint32ArrayValue(arr);
      expect(result instanceof Uint32Array).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_0900
     * @tc.name testTypedUArraysToSortedPart201_009
     * @tc.desc Verify Uint8ClampedArray toSorted instanceof Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const result = sortUint8ClampedArrayValue(arr);
      expect(result instanceof Uint8ClampedArray).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_1000
     * @tc.name testTypedUArraysToSortedPart201_010
     * @tc.desc Verify BigUint64Array toSorted instanceof BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 2n]);
      const result = sortBigUint64ArrayValue(arr);
      expect(result instanceof BigUint64Array).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_1100
     * @tc.name testTypedUArraysToSortedPart201_011
     * @tc.desc Verify Uint8Array toSorted instanceof Uint8ClampedArray false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const result = sortUint8ArrayValue(arr);
      expect(result instanceof Uint8ClampedArray).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_1200
     * @tc.name testTypedUArraysToSortedPart201_012
     * @tc.desc Verify Uint8ClampedArray toSorted instanceof Uint8Array false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const result = sortUint8ClampedArrayValue(arr);
      expect(result instanceof Uint8Array).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_1300
     * @tc.name testTypedUArraysToSortedPart201_013
     * @tc.desc Verify BigUint64Array toSorted instanceof Uint32Array false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 2n]);
      const result = sortBigUint64ArrayValue(arr);
      expect(result instanceof Uint32Array).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_1400
     * @tc.name testTypedUArraysToSortedPart201_014
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const result = sortUint8ArrayValue(arr);
      expect(result.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_1500
     * @tc.name testTypedUArraysToSortedPart201_015
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0xFFFF, 0, 0x8000]);
      const result = sortUint16ArrayValue(arr);
expect(result[0]).assertEqual(0);
expect(result[1]).assertEqual(0x8000);
expect(result[2]).assertEqual(0xFFFF);
expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_1600
     * @tc.name testTypedUArraysToSortedPart201_016
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 0, 2147483647]);
      const result = sortUint32ArrayValue(arr);
expect(result[0]).assertEqual(0);
expect(result[1]).assertEqual(2147483647);
expect(result[2]).assertEqual(4294967295);
expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_1700
     * @tc.name testTypedUArraysToSortedPart201_017
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 0, 128]);
      const result = sortUint8ClampedArrayValue(arr);
expect(result[0]).assertEqual(0);
expect(result[1]).assertEqual(128);
expect(result[2]).assertEqual(255);
expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_1800
     * @tc.name testTypedUArraysToSortedPart201_018
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([18446744073709551615n, 0n, 1n]);
      const result = sortBigUint64ArrayValue(arr);
      expect(result[0]).assertEqual(0n);

      expect(result[1]).assertEqual(1n);

      expect(result[2]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_1900
     * @tc.name testTypedUArraysToSortedPart201_019
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 3, 1, 4, 2]);
      const result = sortUint8ArrayValue(arr);
expect(result[0]).assertEqual(1);
expect(result[1]).assertEqual(2);
expect(result[2]).assertEqual(3);
expect(result[3]).assertEqual(4);
expect(result[4]).assertEqual(5);
expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_2000
     * @tc.name testTypedUArraysToSortedPart201_020
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([5, 3, 5, 1, 3]);
      const result = sortUint16ArrayValue(arr);
expect(result[0]).assertEqual(1);
expect(result[1]).assertEqual(3);
expect(result[2]).assertEqual(3);
expect(result[3]).assertEqual(5);
expect(result[4]).assertEqual(5);
expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_2100
     * @tc.name testTypedUArraysToSortedPart201_021
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([7, 7, 7, 7]);
      const result = sortUint8ArrayValue(arr);
expect(result[0]).assertEqual(7);
expect(result[1]).assertEqual(7);
expect(result[2]).assertEqual(7);
expect(result[3]).assertEqual(7);
expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_2200
     * @tc.name testTypedUArraysToSortedPart201_022
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0xFFFFFFFF, 0x1, 0x80000000]);
      const result = sortUint32ArrayValue(arr);
expect(result[0]).assertEqual(0x1);
expect(result[1]).assertEqual(0x80000000);
expect(result[2]).assertEqual(0xFFFFFFFF);
expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_2300
     * @tc.name testTypedUArraysToSortedPart201_023
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), 1n, BigInt('9223372036854775808')]);
      const result = sortBigUint64ArrayValue(arr);
      expect(result[0]).assertEqual(1n);

      expect(result[1]).assertEqual(BigInt('9223372036854775808'));

      expect(result[2]).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_2400
     * @tc.name testTypedUArraysToSortedPart201_024
     * @tc.desc Verify Uint8Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const result = sortUint8ArrayValue(arr);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_2500
     * @tc.name testTypedUArraysToSortedPart201_025
     * @tc.desc Verify Uint16Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([42]);
      const result = sortUint16ArrayValue(arr);
expect(result[0]).assertEqual(42);
expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_2600
     * @tc.name testTypedUArraysToSortedPart201_026
     * @tc.desc Verify BigUint64Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([999n]);
      const result = sortBigUint64ArrayValue(arr);
expect(result[0]).assertEqual(999n);
expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_2700
     * @tc.name testTypedUArraysToSortedPart201_027
     * @tc.desc Verify Uint8Array compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = sortUint8ArrayValue(arr);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_2800
     * @tc.name testTypedUArraysToSortedPart201_028
     * @tc.desc Verify Uint16Array compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const result = sortUint16ArrayValue(arr);
      expect(result[0]).assertEqual(100);
      expect(result[1]).assertEqual(200);
      expect(result[2]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_2900
     * @tc.name testTypedUArraysToSortedPart201_029
     * @tc.desc Verify Uint32Array compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      const result = sortUint32ArrayValue(arr);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_3000
     * @tc.name testTypedUArraysToSortedPart201_030
     * @tc.desc Verify Uint8ClampedArray compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const result = sortUint8ClampedArrayValue(arr);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_3100
     * @tc.name testTypedUArraysToSortedPart201_031
     * @tc.desc Verify BigUint64Array compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 3n, 2n]);
      const result = sortBigUint64ArrayValue(arr);
      expect(result[0]).assertEqual(1n);
      expect(result[1]).assertEqual(2n);
      expect(result[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_3200
     * @tc.name testTypedUArraysToSortedPart201_032
     * @tc.desc Verify Uint8Array compareFn 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 3, 1]);
      const result = sortUint8ArrayValue(arr);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_3300
     * @tc.name testTypedUArraysToSortedPart201_033
     * @tc.desc Verify Uint16Array compareFn 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([5, 3, 1]);
      const result = sortUint16ArrayValue(arr);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_3400
     * @tc.name testTypedUArraysToSortedPart201_034
     * @tc.desc Verify Uint8Array 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = sortUint8ArrayValue(arr);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_3500
     * @tc.name testTypedUArraysToSortedPart201_035
     * @tc.desc Verify Uint8Array -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = sortUint8ArrayValue(arr);
      expect(result[0]).assertEqual(1);

      expect(result[1]).assertEqual(2);

      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_3600
     * @tc.name testTypedUArraysToSortedPart201_036
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = sortUint8ArrayValue(arr);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_3700
     * @tc.name testTypedUArraysToSortedPart201_037
     * @tc.desc Verify Uint8Array toSorted length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const result = sortUint8ArrayValue(arr);
      expect(result.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_3800
     * @tc.name testTypedUArraysToSortedPart201_038
     * @tc.desc Verify Uint16Array toSorted length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300, 400]);
      const result = sortUint16ArrayValue(arr);
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_3900
     * @tc.name testTypedUArraysToSortedPart201_039
     * @tc.desc Verify Uint32Array toSorted length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const result = sortUint32ArrayValue(arr);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_4000
     * @tc.name testTypedUArraysToSortedPart201_040
     * @tc.desc Verify Uint8ClampedArray toSorted length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      const result = sortUint8ClampedArrayValue(arr);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_4100
     * @tc.name testTypedUArraysToSortedPart201_041
     * @tc.desc Verify BigUint64Array toSorted length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const result = sortBigUint64ArrayValue(arr);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_4200
     * @tc.name testTypedUArraysToSortedPart201_042
     * @tc.desc Verify Uint8Array toSorted length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const result = sortUint8ArrayValue(arr);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_4300
     * @tc.name testTypedUArraysToSortedPart201_043
     * @tc.desc Verify Uint8Array toSorted length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const result = sortUint8ArrayValue(arr);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_4400
     * @tc.name testTypedUArraysToSortedPart201_044
     * @tc.desc Verify Uint16Array toSorted length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(1000);
      const result = sortUint16ArrayValue(arr);
      expect(result.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_4500
     * @tc.name testTypedUArraysToSortedPart201_045
     * @tc.desc Verify Uint8Array toSorted byteLength byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const result = sortUint8ArrayValue(arr);
      expect(result.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_4600
     * @tc.name testTypedUArraysToSortedPart201_046
     * @tc.desc Verify Uint16Array toSorted byteLength byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([3, 1, 2]);
      const result = sortUint16ArrayValue(arr);
      expect(result.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_4700
     * @tc.name testTypedUArraysToSortedPart201_047
     * @tc.desc Verify Uint32Array toSorted byteLength byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([3, 1, 2]);
      const result = sortUint32ArrayValue(arr);
      expect(result.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_4800
     * @tc.name testTypedUArraysToSortedPart201_048
     * @tc.desc Verify Uint8ClampedArray toSorted byteLength byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const result = sortUint8ClampedArrayValue(arr);
      expect(result.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_4900
     * @tc.name testTypedUArraysToSortedPart201_049
     * @tc.desc Verify BigUint64Array toSorted byteLength byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 2n]);
      const result = sortBigUint64ArrayValue(arr);
      expect(result.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_5000
     * @tc.name testTypedUArraysToSortedPart201_050
     * @tc.desc Verify Uint8Array toSorted byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const result = sortUint8ArrayValue(arr);
      expect(result.byteLength).assertEqual(0);
    });

  });
}
