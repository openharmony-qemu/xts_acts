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

export default function typedUArraysToSortedTest01(): void {
  describe('TypedUArraysToSortedTest01', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_0100
     * @tc.name testTypedUArraysToSortedPart101_001
     * @tc.desc Verify Uint8Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 3, 1]);
      const result = sortUint8ArrayValue(arr);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_0200
     * @tc.name testTypedUArraysToSortedPart101_002
     * @tc.desc Verify Uint16Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([500, 300, 100]);
      const result = sortUint16ArrayValue(arr);
      expect(result[0]).assertEqual(100);
      expect(result[1]).assertEqual(300);
      expect(result[2]).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_0300
     * @tc.name testTypedUArraysToSortedPart101_003
     * @tc.desc Verify Uint32Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([500000000, 300000000, 100000000]);
      const result = sortUint32ArrayValue(arr);
      expect(result[0]).assertEqual(100000000);
      expect(result[1]).assertEqual(300000000);
      expect(result[2]).assertEqual(500000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_0400
     * @tc.name testTypedUArraysToSortedPart101_004
     * @tc.desc Verify Uint8ClampedArray toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([200, 50, 100]);
      const result = sortUint8ClampedArrayValue(arr);
      expect(result[0]).assertEqual(50);
      expect(result[1]).assertEqual(100);
      expect(result[2]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_0500
     * @tc.name testTypedUArraysToSortedPart101_005
     * @tc.desc Verify BigUint64Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n, 3n, 1n]);
      const result = sortBigUint64ArrayValue(arr);
      expect(result[0]).assertEqual(1n);
      expect(result[1]).assertEqual(3n);
      expect(result[2]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_0600
     * @tc.name testTypedUArraysToSortedPart101_006
     * @tc.desc Verify Uint8Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 3, 1]);
      const result = sortUint8ArrayValue(arr);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_0700
     * @tc.name testTypedUArraysToSortedPart101_007
     * @tc.desc Verify Uint16Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([500, 300, 100]);
      const result = sortUint16ArrayValue(arr);
      expect(result[0]).assertEqual(100);
      expect(result[1]).assertEqual(300);
      expect(result[2]).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_0800
     * @tc.name testTypedUArraysToSortedPart101_008
     * @tc.desc Verify BigUint64Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n, 3n, 1n]);
      const result = sortBigUint64ArrayValue(arr);
      expect(result[0]).assertEqual(1n);
      expect(result[1]).assertEqual(3n);
      expect(result[2]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_0900
     * @tc.name testTypedUArraysToSortedPart101_009
     * @tc.desc Verify Uint8Array compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 0, 128]);
      const result = sortUint8ArrayValue(arr);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(128);
      expect(result[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_1000
     * @tc.name testTypedUArraysToSortedPart101_010
     * @tc.desc Verify Uint16Array compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0xFFFF, 0, 0x7FFF]);
      const result = sortUint16ArrayValue(arr);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0x7FFF);
      expect(result[2]).assertEqual(0xFFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_1100
     * @tc.name testTypedUArraysToSortedPart101_011
     * @tc.desc Verify Uint32Array compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0xFFFFFFFF, 0, 0x7FFFFFFF]);
      const result = sortUint32ArrayValue(arr);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0x7FFFFFFF);
      expect(result[2]).assertEqual(0xFFFFFFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_1200
     * @tc.name testTypedUArraysToSortedPart101_012
     * @tc.desc Verify Uint8ClampedArray compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 0, 128]);
      const result = sortUint8ClampedArrayValue(arr);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(128);
      expect(result[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_1300
     * @tc.name testTypedUArraysToSortedPart101_013
     * @tc.desc Verify BigUint64Array compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([18446744073709551615n, 0n, 9223372036854775807n]);
      const result = sortBigUint64ArrayValue(arr);
      expect(result[0]).assertEqual(0n);
      expect(result[1]).assertEqual(9223372036854775807n);
      expect(result[2]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_1400
     * @tc.name testTypedUArraysToSortedPart101_014
     * @tc.desc Verify Uint8Array compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 128, 255]);
      const result = sortUint8ArrayValue(arr);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(128);
      expect(result[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_1500
     * @tc.name testTypedUArraysToSortedPart101_015
     * @tc.desc Verify Uint16Array compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0x7FFF, 0xFFFF]);
      const result = sortUint16ArrayValue(arr);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0x7FFF);
      expect(result[2]).assertEqual(0xFFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_1600
     * @tc.name testTypedUArraysToSortedPart101_016
     * @tc.desc Verify Uint32Array compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0x7FFFFFFF, 0xFFFFFFFF]);
      const result = sortUint32ArrayValue(arr);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0x7FFFFFFF);
      expect(result[2]).assertEqual(0xFFFFFFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_1700
     * @tc.name testTypedUArraysToSortedPart101_017
     * @tc.desc Verify Uint8ClampedArray compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 128, 255]);
      const result = sortUint8ClampedArrayValue(arr);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(128);
      expect(result[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_1800
     * @tc.name testTypedUArraysToSortedPart101_018
     * @tc.desc Verify BigUint64Array compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 9223372036854775807n, BigInt('18446744073709551615')]);
      const result = sortBigUint64ArrayValue(arr);
      expect(result[0]).assertEqual(0n);
      expect(result[1]).assertEqual(9223372036854775807n);
      expect(result[2]).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_1900
     * @tc.name testTypedUArraysToSortedPart101_019
     * @tc.desc Verify Uint8Array compareFn 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 4]);
      const result = sortUint8ArrayValue(arr);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_2000
     * @tc.name testTypedUArraysToSortedPart101_020
     * @tc.desc Verify Uint16Array compareFn 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([300, 100, 400]);
      const result = sortUint16ArrayValue(arr);
      expect(result[0]).assertEqual(100);
      expect(result[1]).assertEqual(300);
      expect(result[2]).assertEqual(400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_2100
     * @tc.name testTypedUArraysToSortedPart101_021
     * @tc.desc Verify Uint32Array compareFn 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([300000000, 100000000, 400000000]);
      const result = sortUint32ArrayValue(arr);
      expect(result[0]).assertEqual(100000000);
      expect(result[1]).assertEqual(300000000);
      expect(result[2]).assertEqual(400000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_2200
     * @tc.name testTypedUArraysToSortedPart101_022
     * @tc.desc Verify Uint8ClampedArray compareFn 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 4]);
      const result = sortUint8ClampedArrayValue(arr);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_2300
     * @tc.name testTypedUArraysToSortedPart101_023
     * @tc.desc Verify BigUint64Array compareFn 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 4n]);
      const result = sortBigUint64ArrayValue(arr);
      expect(result[0]).assertEqual(1n);
      expect(result[1]).assertEqual(3n);
      expect(result[2]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_2400
     * @tc.name testTypedUArraysToSortedPart101_024
     * @tc.desc Verify Uint8Array compareFn 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 4]);
      const result = sortUint8ArrayValue(arr);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_2500
     * @tc.name testTypedUArraysToSortedPart101_025
     * @tc.desc Verify Uint16Array compareFn 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 400]);
      const result = sortUint16ArrayValue(arr);
      expect(result[0]).assertEqual(100);
      expect(result[1]).assertEqual(200);
      expect(result[2]).assertEqual(400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_2600
     * @tc.name testTypedUArraysToSortedPart101_026
     * @tc.desc Verify Uint32Array compareFn 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100000000, 200000000, 400000000]);
      const result = sortUint32ArrayValue(arr);
      expect(result[0]).assertEqual(100000000);
      expect(result[1]).assertEqual(200000000);
      expect(result[2]).assertEqual(400000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_2700
     * @tc.name testTypedUArraysToSortedPart101_027
     * @tc.desc Verify Uint8ClampedArray compareFn 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 4]);
      const result = sortUint8ClampedArrayValue(arr);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_2800
     * @tc.name testTypedUArraysToSortedPart101_028
     * @tc.desc Verify BigUint64Array compareFn 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 4n]);
      const result = sortBigUint64ArrayValue(arr);
      expect(result[0]).assertEqual(1n);
      expect(result[1]).assertEqual(2n);
      expect(result[2]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_2900
     * @tc.name testTypedUArraysToSortedPart101_029
     * @tc.desc Verify Uint8Array compareFn -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([4, 2, 1]);
      const result = sortUint8ArrayValue(arr);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_3000
     * @tc.name testTypedUArraysToSortedPart101_030
     * @tc.desc Verify Uint16Array compareFn -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([400, 200, 100]);
      const result = sortUint16ArrayValue(arr);
      expect(result[0]).assertEqual(100);
      expect(result[1]).assertEqual(200);
      expect(result[2]).assertEqual(400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_3100
     * @tc.name testTypedUArraysToSortedPart101_031
     * @tc.desc Verify Uint32Array compareFn -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([400000000, 200000000, 100000000]);
      const result = sortUint32ArrayValue(arr);
      expect(result[0]).assertEqual(100000000);
      expect(result[1]).assertEqual(200000000);
      expect(result[2]).assertEqual(400000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_3200
     * @tc.name testTypedUArraysToSortedPart101_032
     * @tc.desc Verify Uint8ClampedArray compareFn -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([4, 2, 1]);
      const result = sortUint8ClampedArrayValue(arr);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_3300
     * @tc.name testTypedUArraysToSortedPart101_033
     * @tc.desc Verify BigUint64Array compareFn -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([4n, 2n, 1n]);
      const result = sortBigUint64ArrayValue(arr);
      expect(result[0]).assertEqual(1n);
      expect(result[1]).assertEqual(2n);
      expect(result[2]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_3400
     * @tc.name testTypedUArraysToSortedPart101_034
     * @tc.desc Verify Uint8Array compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 4]);
      const result = sortUint8ArrayValue(arr);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_3500
     * @tc.name testTypedUArraysToSortedPart101_035
     * @tc.desc Verify Uint8Array compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 4]);
      const result = sortUint8ArrayValue(arr);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_3600
     * @tc.name testTypedUArraysToSortedPart101_036
     * @tc.desc Verify Uint16Array compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([300, 100, 400]);
      const result = sortUint16ArrayValue(arr);
      expect(result[0]).assertEqual(100);
      expect(result[1]).assertEqual(300);
      expect(result[2]).assertEqual(400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_3700
     * @tc.name testTypedUArraysToSortedPart101_037
     * @tc.desc Verify Uint16Array compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([300, 100, 400]);
      const result = sortUint16ArrayValue(arr);
      expect(result[0]).assertEqual(100);
      expect(result[1]).assertEqual(300);
      expect(result[2]).assertEqual(400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_3800
     * @tc.name testTypedUArraysToSortedPart101_038
     * @tc.desc Verify Uint8Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const result = sortUint8ArrayValue(arr);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_3900
     * @tc.name testTypedUArraysToSortedPart101_039
     * @tc.desc Verify Uint16Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(0);
      const result = sortUint16ArrayValue(arr);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_4000
     * @tc.name testTypedUArraysToSortedPart101_040
     * @tc.desc Verify Uint32Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      const result = sortUint32ArrayValue(arr);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_4100
     * @tc.name testTypedUArraysToSortedPart101_041
     * @tc.desc Verify Uint8ClampedArray toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const result = sortUint8ClampedArrayValue(arr);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_4200
     * @tc.name testTypedUArraysToSortedPart101_042
     * @tc.desc Verify BigUint64Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0);
      const result = sortBigUint64ArrayValue(arr);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_4300
     * @tc.name testTypedUArraysToSortedPart101_043
     * @tc.desc Verify Uint8Array compareFn toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const result = sortUint8ArrayValue(arr);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_4400
     * @tc.name testTypedUArraysToSortedPart101_044
     * @tc.desc Verify Uint16Array compareFn toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(0);
      const result = sortUint16ArrayValue(arr);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_4500
     * @tc.name testTypedUArraysToSortedPart101_045
     * @tc.desc Verify Uint8Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const result = sortUint8ArrayValue(arr);
      expect(result[0]).assertEqual(42);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_4600
     * @tc.name testTypedUArraysToSortedPart101_046
     * @tc.desc Verify Uint16Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([32768]);
      const result = sortUint16ArrayValue(arr);
      expect(result[0]).assertEqual(32768);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_4700
     * @tc.name testTypedUArraysToSortedPart101_047
     * @tc.desc Verify Uint32Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([2147483648]);
      const result = sortUint32ArrayValue(arr);
      expect(result[0]).assertEqual(2147483648);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_4800
     * @tc.name testTypedUArraysToSortedPart101_048
     * @tc.desc Verify Uint8ClampedArray toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([128]);
      const result = sortUint8ClampedArrayValue(arr);
      expect(result[0]).assertEqual(128);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_4900
     * @tc.name testTypedUArraysToSortedPart101_049
     * @tc.desc Verify BigUint64Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('9223372036854775808')]);
      const result = sortBigUint64ArrayValue(arr);
      expect(result[0]).assertEqual(BigInt('9223372036854775808'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_5000
     * @tc.name testTypedUArraysToSortedPart101_050
     * @tc.desc Verify Uint8Array compareFn toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const result = sortUint8ArrayValue(arr);
      expect(result[0]).assertEqual(42);
    });

  });
}
