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

export default function typedUArraysToSortedTest04(): void {
  describe('TypedUArraysToSortedTest04', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_0100
     * @tc.name testTypedUArraysToSortedPart202_001
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 100, 100, 100]);
      const result = sortUint16ArrayValue(arr);
expect(result[0]).assertEqual(100);
expect(result[1]).assertEqual(100);
expect(result[2]).assertEqual(100);
expect(result[3]).assertEqual(100);
expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_0200
     * @tc.name testTypedUArraysToSortedPart202_002
     * @tc.desc Verify Uint8Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = sortUint8ArrayValue(arr);
expect(result[0]).assertEqual(1);
expect(result[1]).assertEqual(2);
expect(result[2]).assertEqual(3);
expect(result[3]).assertEqual(4);
expect(result[4]).assertEqual(5);
expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_0300
     * @tc.name testTypedUArraysToSortedPart202_003
     * @tc.desc Verify Uint16Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const result = sortUint16ArrayValue(arr);
expect(result[0]).assertEqual(1);
expect(result[1]).assertEqual(2);
expect(result[2]).assertEqual(3);
expect(result[3]).assertEqual(4);
expect(result[4]).assertEqual(5);
expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_0400
     * @tc.name testTypedUArraysToSortedPart202_004
     * @tc.desc Verify Uint8Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 4, 3, 2, 1]);
      const result = sortUint8ArrayValue(arr);
expect(result[0]).assertEqual(1);
expect(result[1]).assertEqual(2);
expect(result[2]).assertEqual(3);
expect(result[3]).assertEqual(4);
expect(result[4]).assertEqual(5);
expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_0500
     * @tc.name testTypedUArraysToSortedPart202_005
     * @tc.desc Verify Uint16Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([5, 4, 3, 2, 1]);
      const result = sortUint16ArrayValue(arr);
expect(result[0]).assertEqual(1);
expect(result[1]).assertEqual(2);
expect(result[2]).assertEqual(3);
expect(result[3]).assertEqual(4);
expect(result[4]).assertEqual(5);
expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_0600
     * @tc.name testTypedUArraysToSortedPart202_006
     * @tc.desc Verify Uint8Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const result = sortUint8ArrayValue(arr);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_0700
     * @tc.name testTypedUArraysToSortedPart202_007
     * @tc.desc Verify Uint8Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const result = sortUint8ArrayValue(arr);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_0800
     * @tc.name testTypedUArraysToSortedPart202_008
     * @tc.desc Verify Uint16Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0xFFFF, 0, 0x8000]);
      const result = sortUint16ArrayValue(arr);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_0900
     * @tc.name testTypedUArraysToSortedPart202_009
     * @tc.desc Verify Uint16Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0xFFFF, 0, 0x8000]);
      const result = sortUint16ArrayValue(arr);
      expect(result[2]).assertEqual(0xFFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_1000
     * @tc.name testTypedUArraysToSortedPart202_010
     * @tc.desc Verify Uint32Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 0, 2147483647]);
      const result = sortUint32ArrayValue(arr);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_1100
     * @tc.name testTypedUArraysToSortedPart202_011
     * @tc.desc Verify Uint32Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 0, 2147483647]);
      const result = sortUint32ArrayValue(arr);
      expect(result[2]).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_1200
     * @tc.name testTypedUArraysToSortedPart202_012
     * @tc.desc Verify BigUint64Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), 1n, 0n]);
      const result = sortBigUint64ArrayValue(arr);
      expect(result[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_1300
     * @tc.name testTypedUArraysToSortedPart202_013
     * @tc.desc Verify BigUint64Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), 1n, 0n]);
      const result = sortBigUint64ArrayValue(arr);
      expect(result[2]).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_1400
     * @tc.name testTypedUArraysToSortedPart202_014
     * @tc.desc Verify Uint8ClampedArray toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 0, 128]);
      const result = sortUint8ClampedArrayValue(arr);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_1500
     * @tc.name testTypedUArraysToSortedPart202_015
     * @tc.desc Verify Uint8ClampedArray toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 0, 128]);
      const result = sortUint8ClampedArrayValue(arr);
      expect(result[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_1600
     * @tc.name testTypedUArraysToSortedPart202_016
     * @tc.desc Verify Uint8Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const r1 = sortUint8ArrayValue(arr);
      const val10 = r1[0];
      expect(val10).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_1700
     * @tc.name testTypedUArraysToSortedPart202_017
     * @tc.desc Verify Uint16Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([3, 1, 2]);
      const r1 = sortUint16ArrayValue(arr);
      const val11 = r1[0];
      expect(val11).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_1800
     * @tc.name testTypedUArraysToSortedPart202_018
     * @tc.desc Verify Uint8Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const r1 = sortUint8ArrayValue(arr);
      expect(r1[0]).assertEqual(1);

      expect(r1[1]).assertEqual(2);

      expect(r1[2]).assertEqual(3);
      expect(r1[0]).assertEqual(1);

      expect(r1[1]).assertEqual(2);

      expect(r1[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_1900
     * @tc.name testTypedUArraysToSortedPart202_019
     * @tc.desc Verify Uint8Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const r1 = sortUint8ArrayValue(arr);
      expect(r1[0]).assertEqual(1);

      expect(r1[1]).assertEqual(2);

      expect(r1[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_2000
     * @tc.name testTypedUArraysToSortedPart202_020
     * @tc.desc Verify Uint8Array toSorted compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const r1 = sortUint8ArrayValue(arr);
      expect(r1[0]).assertEqual(1);
      expect(r1[1]).assertEqual(2);
      expect(r1[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_2100
     * @tc.name testTypedUArraysToSortedPart202_021
     * @tc.desc Verify Uint8Array toSorted sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const sorted = sortUint8ArrayValue(arr);
      expect(sorted[0]).assertEqual(1);

      expect(sorted[1]).assertEqual(2);

      expect(sorted[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_2200
     * @tc.name testTypedUArraysToSortedPart202_022
     * @tc.desc Verify Uint16Array toSorted sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([300, 100, 200]);
      const sorted = sortUint16ArrayValue(arr);
      expect(sorted[0]).assertEqual(100);

      expect(sorted[1]).assertEqual(200);

      expect(sorted[2]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_2300
     * @tc.name testTypedUArraysToSortedPart202_023
     * @tc.desc Verify Uint8Array toSorted sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Uint8Array([3, 1, 2]);
      const arr2 = new Uint8Array([3, 1, 2]);
      arr1.sort();
      expect(arr1[0]).assertEqual(1);
      expect(arr1[1]).assertEqual(2);
      expect(arr1[2]).assertEqual(3);
      const sorted2 = sortUint8ArrayValue(arr2);
      expect(sorted2[0]).assertEqual(1);
      expect(sorted2[1]).assertEqual(2);
      expect(sorted2[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_2400
     * @tc.name testTypedUArraysToSortedPart202_024
     * @tc.desc Verify Uint16Array toSorted sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Uint16Array([3, 1, 2]);
      const arr2 = new Uint16Array([3, 1, 2]);
      arr1.sort();
      expect(arr1[0]).assertEqual(1);
      expect(arr1[1]).assertEqual(2);
      expect(arr1[2]).assertEqual(3);
      const sorted2 = sortUint16ArrayValue(arr2);
      expect(sorted2[0]).assertEqual(1);
      expect(sorted2[1]).assertEqual(2);
      expect(sorted2[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_2500
     * @tc.name testTypedUArraysToSortedPart202_025
     * @tc.desc Verify Uint8Array toSorted slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const sliced = arr.slice();
      const result = sortUint8ArrayValue(arr);
      expect(result.length).assertEqual(sliced.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_2600
     * @tc.name testTypedUArraysToSortedPart202_026
     * @tc.desc Verify Uint16Array toSorted slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([3, 1, 2]);
      const sliced = arr.slice();
      const result = sortUint16ArrayValue(arr);
      expect(result.length).assertEqual(sliced.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_2700
     * @tc.name testTypedUArraysToSortedPart202_027
     * @tc.desc Verify Uint8Array toSorted length slice length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const sliced = arr.slice();
      const result = sortUint8ArrayValue(arr);
      expect(result.length).assertEqual(sliced.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_2800
     * @tc.name testTypedUArraysToSortedPart202_028
     * @tc.desc Verify Uint8Array toSorted byteLength slice byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const sliced = arr.slice();
      const result = sortUint8ArrayValue(arr);
      expect(result.byteLength).assertEqual(sliced.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_2900
     * @tc.name testTypedUArraysToSortedPart202_029
     * @tc.desc Verify Uint8Array 100 toSorted length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      const result = sortUint8ArrayValue(arr);
      expect(result.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_3000
     * @tc.name testTypedUArraysToSortedPart202_030
     * @tc.desc Verify Uint8Array 100 toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      const result = sortUint8ArrayValue(arr);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_3100
     * @tc.name testTypedUArraysToSortedPart202_031
     * @tc.desc Verify Uint8Array 100 toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      const result = sortUint8ArrayValue(arr);
      expect(result.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_3200
     * @tc.name testTypedUArraysToSortedPart202_032
     * @tc.desc Verify Uint16Array 100 toSorted length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(100);
      const result = sortUint16ArrayValue(arr);
      expect(result.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_3300
     * @tc.name testTypedUArraysToSortedPart202_033
     * @tc.desc Verify Uint16Array 100 toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(100);
      const result = sortUint16ArrayValue(arr);
      expect(result.length).assertEqual(100);
      expect(result[99]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_3400
     * @tc.name testTypedUArraysToSortedPart202_034
     * @tc.desc Verify Uint8Array 0 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 0, 128]);
      const result = sortUint8ArrayValue(arr);
expect(result[0]).assertEqual(0);
expect(result[1]).assertEqual(128);
expect(result[2]).assertEqual(255);
expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_3500
     * @tc.name testTypedUArraysToSortedPart202_035
     * @tc.desc Verify Uint16Array 0 0xFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0xFFFF, 0, 0x7FFF]);
      const result = sortUint16ArrayValue(arr);
expect(result[0]).assertEqual(0);
expect(result[1]).assertEqual(0x7FFF);
expect(result[2]).assertEqual(0xFFFF);
expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_3600
     * @tc.name testTypedUArraysToSortedPart202_036
     * @tc.desc Verify Uint32Array 0 0xFFFFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0xFFFFFFFF, 0, 0x7FFFFFFF]);
      const result = sortUint32ArrayValue(arr);
expect(result[0]).assertEqual(0);
expect(result[1]).assertEqual(0x7FFFFFFF);
expect(result[2]).assertEqual(0xFFFFFFFF);
expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_3700
     * @tc.name testTypedUArraysToSortedPart202_037
     * @tc.desc Verify BigUint64Array 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), 0n, 9223372036854775807n]);
      const result = sortBigUint64ArrayValue(arr);
      expect(result[0]).assertEqual(0n);

      expect(result[1]).assertEqual(9223372036854775807n);

      expect(result[2]).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_3800
     * @tc.name testTypedUArraysToSortedPart202_038
     * @tc.desc Verify Uint8Array 0x80
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0x80, 0, 0xFF]);
      const result = sortUint8ArrayValue(arr);
expect(result[0]).assertEqual(0);
expect(result[1]).assertEqual(0x80);
expect(result[2]).assertEqual(0xFF);
expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_3900
     * @tc.name testTypedUArraysToSortedPart202_039
     * @tc.desc Verify Uint16Array 0x8000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0x8000, 0, 0xFFFF]);
      const result = sortUint16ArrayValue(arr);
expect(result[0]).assertEqual(0);
expect(result[1]).assertEqual(0x8000);
expect(result[2]).assertEqual(0xFFFF);
expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_4000
     * @tc.name testTypedUArraysToSortedPart202_040
     * @tc.desc Verify Uint32Array 0x80000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0x80000000, 0, 0xFFFFFFFF]);
      const result = sortUint32ArrayValue(arr);
expect(result[0]).assertEqual(0);
expect(result[1]).assertEqual(0x80000000);
expect(result[2]).assertEqual(0xFFFFFFFF);
expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_4100
     * @tc.name testTypedUArraysToSortedPart202_041
     * @tc.desc Verify Uint8Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const result = sortUint8ArrayValue(arr);
expect(result[0]).assertEqual(1);
expect(result[1]).assertEqual(2);
expect(result[2]).assertEqual(3);
expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_4200
     * @tc.name testTypedUArraysToSortedPart202_042
     * @tc.desc Verify Uint8Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      
      const result = sortUint8ArrayValue(arr);
expect(result[0]).assertEqual(0);
expect(result[1]).assertEqual(0);
expect(result[2]).assertEqual(0);
expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_4300
     * @tc.name testTypedUArraysToSortedPart202_043
     * @tc.desc Verify buffer+offset Uint8Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, 2, 3);
      
      const result = sortUint8ArrayValue(arr);
expect(result[0]).assertEqual(0);
expect(result[1]).assertEqual(0);
expect(result[2]).assertEqual(0);
expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_4400
     * @tc.name testTypedUArraysToSortedPart202_044
     * @tc.desc Verify buffer+offset Uint16Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint16Array(buf, 4, 3);
      
      const result = sortUint16ArrayValue(arr);
expect(result[0]).assertEqual(0);
expect(result[1]).assertEqual(0);
expect(result[2]).assertEqual(0);
expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_4500
     * @tc.name testTypedUArraysToSortedPart202_045
     * @tc.desc Verify buffer+offset Uint8Array toSorted buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, 2, 3);
      
      const result = sortUint8ArrayValue(arr);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_4600
     * @tc.name testTypedUArraysToSortedPart202_046
     * @tc.desc Verify buffer+offset Uint8Array toSorted byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, 2, 3);
      
      const result = sortUint8ArrayValue(arr);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_4700
     * @tc.name testTypedUArraysToSortedPart202_047
     * @tc.desc Verify buffer+offset Uint8Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, 2, 3);
      
      const result = sortUint8ArrayValue(arr);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_4800
     * @tc.name testTypedUArraysToSortedPart202_048
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const result = sortUint8ArrayValue(arr);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_4900
     * @tc.name testTypedUArraysToSortedPart202_049
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([3, 1, 2]);
      const result = sortUint16ArrayValue(arr);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_5000
     * @tc.name testTypedUArraysToSortedPart202_050
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const result = sortUint8ArrayValue(arr);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_5100
     * @tc.name testTypedUArraysToSortedPart202_051
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const result = sortUint8ArrayValue(arr);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_5200
     * @tc.name testTypedUArraysToSortedPart202_052
     * @tc.desc Verify Uint8Array toSorted toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const result = sortUint8ArrayValue(arr);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_5300
     * @tc.name testTypedUArraysToSortedPart202_053
     * @tc.desc Verify Uint8Array toSorted slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const result = sortUint8ArrayValue(arr);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_5400
     * @tc.name testTypedUArraysToSortedPart202_054
     * @tc.desc Verify Uint8Array toSorted subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const result = sortUint8ArrayValue(arr);
      expect(result[0]).assertEqual(1);

      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_5500
     * @tc.name testTypedUArraysToSortedPart202_055
     * @tc.desc Verify Uint8Array toSorted toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const result = sortUint8ArrayValue(arr);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_5600
     * @tc.name testTypedUArraysToSortedPart202_056
     * @tc.desc Verify Uint8Array toSorted sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const result = sortUint8ArrayValue(arr);
      expect(result[0]).assertEqual(1);

      expect(result[1]).assertEqual(2);

      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_5700
     * @tc.name testTypedUArraysToSortedPart202_057
     * @tc.desc Verify Uint16Array toSorted toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([3, 1, 2]);
      let result = sortUint16ArrayValue(arr);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_5800
     * @tc.name testTypedUArraysToSortedPart202_058
     * @tc.desc Verify Uint16Array toSorted slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([3, 1, 2]);
      let result = sortUint16ArrayValue(arr);
      expect(result[0]).assertEqual(1);

      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART202_5900
     * @tc.name testTypedUArraysToSortedPart202_059
     * @tc.desc Verify Uint16Array toSorted toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart202_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([3, 1, 2]);
      let result = sortUint16ArrayValue(arr);
      expect(result[0]).assertEqual(1);

      expect(result[1]).assertEqual(2);

      expect(result[2]).assertEqual(3);
    });

  });
}
