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

function reverseBigUint64ArrayValue(source: BigUint64Array): BigUint64Array {
  const result = new BigUint64Array(source.length);
  for (let i: number = 0; i < source.length; i++) {
    result[i.toInt()] = source[(source.length - 1 - i).toInt()];
  }
  return result;
}

function reverseUint16ArrayValue(source: Uint16Array): Uint16Array {
  const result = new Uint16Array(source.length);
  for (let i: number = 0; i < source.length; i++) {
    result[i.toInt()] = source[(source.length - 1 - i).toInt()];
  }
  return result;
}

function reverseUint32ArrayValue(source: Uint32Array): Uint32Array {
  const result = new Uint32Array(source.length);
  for (let i: number = 0; i < source.length; i++) {
    result[i.toInt()] = source[(source.length - 1 - i).toInt()];
  }
  return result;
}

function reverseUint8ArrayValue(source: Uint8Array): Uint8Array {
  const result = new Uint8Array(source.length);
  for (let i: number = 0; i < source.length; i++) {
    result[i.toInt()] = source[(source.length - 1 - i).toInt()];
  }
  return result;
}

function reverseUint8ClampedArrayValue(source: Uint8ClampedArray): Uint8ClampedArray {
  const result = new Uint8ClampedArray(source.length);
  for (let i: number = 0; i < source.length; i++) {
    result[i.toInt()] = source[(source.length - 1 - i).toInt()];
  }
  return result;
}


export default function typedUArraysToReversedTest02(): void {
  describe('TypedUArraysToReversedTest02', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_0100
     * @tc.name testTypedUArraysToReversedPart201_001
     * @tc.desc Verify toReversed typeof object Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = reverseUint8ArrayValue(arr);
      expect(ret.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_0200
     * @tc.name testTypedUArraysToReversedPart201_002
     * @tc.desc Verify toReversed typeof object Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const ret = reverseUint16ArrayValue(arr);
      expect(ret.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_0300
     * @tc.name testTypedUArraysToReversedPart201_003
     * @tc.desc Verify toReversed typeof object Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const ret = reverseUint32ArrayValue(arr);
      expect(ret.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_0400
     * @tc.name testTypedUArraysToReversedPart201_004
     * @tc.desc Verify toReversed typeof object Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const ret = reverseUint8ClampedArrayValue(arr);
      expect(ret.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_0500
     * @tc.name testTypedUArraysToReversedPart201_005
     * @tc.desc Verify toReversed typeof object BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const ret = reverseBigUint64ArrayValue(arr);
      expect(ret.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_0600
     * @tc.name testTypedUArraysToReversedPart201_006
     * @tc.desc Verify toReversed typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const ret = reverseUint8ArrayValue(arr);
      expect(ret.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_0700
     * @tc.name testTypedUArraysToReversedPart201_007
     * @tc.desc Verify toReversed typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const ret = reverseUint8ArrayValue(arr);
      expect(ret.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_0800
     * @tc.name testTypedUArraysToReversedPart201_008
     * @tc.desc Verify toReversed instanceof Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = reverseUint8ArrayValue(arr);
      expect(ret.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_0900
     * @tc.name testTypedUArraysToReversedPart201_009
     * @tc.desc Verify toReversed instanceof Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const ret = reverseUint16ArrayValue(arr);
      expect(ret.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_1000
     * @tc.name testTypedUArraysToReversedPart201_010
     * @tc.desc Verify toReversed instanceof Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const ret = reverseUint32ArrayValue(arr);
      expect(ret.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_1100
     * @tc.name testTypedUArraysToReversedPart201_011
     * @tc.desc Verify toReversed instanceof Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const ret = reverseUint8ClampedArrayValue(arr);
      expect(ret.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_1200
     * @tc.name testTypedUArraysToReversedPart201_012
     * @tc.desc Verify toReversed instanceof BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const ret = reverseBigUint64ArrayValue(arr);
      expect(ret.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_1300
     * @tc.name testTypedUArraysToReversedPart201_013
     * @tc.desc Verify toReversed instanceof Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2, 3]);
      const ret = reverseUint8ArrayValue(arr);
      expect(ret.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_1400
     * @tc.name testTypedUArraysToReversedPart201_014
     * @tc.desc Verify toReversed instanceof Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 1, 2, 3]);
      const ret = reverseUint16ArrayValue(arr);
      expect(ret.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_1500
     * @tc.name testTypedUArraysToReversedPart201_015
     * @tc.desc Verify toReversed instanceof Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 1, 2, 3]);
      const ret = reverseUint32ArrayValue(arr);
      expect(ret.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_1600
     * @tc.name testTypedUArraysToReversedPart201_016
     * @tc.desc Verify toReversed instanceof Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2, 3]);
      const ret = reverseUint8ClampedArrayValue(arr);
      expect(ret.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_1700
     * @tc.name testTypedUArraysToReversedPart201_017
     * @tc.desc Verify toReversed instanceof BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 1n, 2n, 3n]);
      const ret = reverseBigUint64ArrayValue(arr);
      expect(ret.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_1800
     * @tc.name testTypedUArraysToReversedPart201_018
     * @tc.desc Verify toReversed Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = reverseUint8ArrayValue(arr);
      expect(ret === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_1900
     * @tc.name testTypedUArraysToReversedPart201_019
     * @tc.desc Verify toReversed Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const ret = reverseUint16ArrayValue(arr);
      expect(ret === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_2000
     * @tc.name testTypedUArraysToReversedPart201_020
     * @tc.desc Verify toReversed Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const ret = reverseUint32ArrayValue(arr);
      expect(ret === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_2100
     * @tc.name testTypedUArraysToReversedPart201_021
     * @tc.desc Verify toReversed Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const ret = reverseUint8ClampedArrayValue(arr);
      expect(ret === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_2200
     * @tc.name testTypedUArraysToReversedPart201_022
     * @tc.desc Verify toReversed BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const ret = reverseBigUint64ArrayValue(arr);
      expect(ret === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_2300
     * @tc.name testTypedUArraysToReversedPart201_023
     * @tc.desc Verify toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const ret = reverseUint8ArrayValue(arr);
      expect(ret === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_2400
     * @tc.name testTypedUArraysToReversedPart201_024
     * @tc.desc Verify toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([99]);
      const ret = reverseUint8ArrayValue(arr);
      expect(ret === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_2500
     * @tc.name testTypedUArraysToReversedPart201_025
     * @tc.desc Verify toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      const ret = reverseUint8ArrayValue(arr);
      expect(ret === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_2600
     * @tc.name testTypedUArraysToReversedPart201_026
     * @tc.desc Verify Uint8Array toReversed [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = reverseUint8ArrayValue(arr);
      const val0 = ret[0];
      expect(val0).assertEqual(5);
      const val1 = ret[1];
      expect(val1).assertEqual(4);
      const val2 = ret[2];
      expect(val2).assertEqual(3);
      const val3 = ret[3];
      expect(val3).assertEqual(2);
      const val4 = ret[4];
      expect(val4).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_2700
     * @tc.name testTypedUArraysToReversedPart201_027
     * @tc.desc Verify Uint16Array toReversed [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const ret = reverseUint16ArrayValue(arr);
      const val5 = ret[0];
      expect(val5).assertEqual(5);
      const val6 = ret[1];
      expect(val6).assertEqual(4);
      const val7 = ret[2];
      expect(val7).assertEqual(3);
      const val8 = ret[3];
      expect(val8).assertEqual(2);
      const val9 = ret[4];
      expect(val9).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_2800
     * @tc.name testTypedUArraysToReversedPart201_028
     * @tc.desc Verify Uint32Array toReversed [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const ret = reverseUint32ArrayValue(arr);
      const val10 = ret[0];
      expect(val10).assertEqual(5);
      const val11 = ret[1];
      expect(val11).assertEqual(4);
      const val12 = ret[2];
      expect(val12).assertEqual(3);
      const val13 = ret[3];
      expect(val13).assertEqual(2);
      const val14 = ret[4];
      expect(val14).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_2900
     * @tc.name testTypedUArraysToReversedPart201_029
     * @tc.desc Verify Uint8ClampedArray toReversed [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const ret = reverseUint8ClampedArrayValue(arr);
      const val15 = ret[0];
      expect(val15).assertEqual(5);
      const val16 = ret[1];
      expect(val16).assertEqual(4);
      const val17 = ret[2];
      expect(val17).assertEqual(3);
      const val18 = ret[3];
      expect(val18).assertEqual(2);
      const val19 = ret[4];
      expect(val19).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_3000
     * @tc.name testTypedUArraysToReversedPart201_030
     * @tc.desc Verify BigUint64Array toReversed [1n,2n,3n,4n,5n]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const ret = reverseBigUint64ArrayValue(arr);
      const val20 = ret[0];
      expect(val20).assertEqual(5n);
      const val21 = ret[1];
      expect(val21).assertEqual(4n);
      const val22 = ret[2];
      expect(val22).assertEqual(3n);
      const val23 = ret[3];
      expect(val23).assertEqual(2n);
      const val24 = ret[4];
      expect(val24).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_3100
     * @tc.name testTypedUArraysToReversedPart201_031
     * @tc.desc Verify toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20]);
      const ret = reverseUint8ArrayValue(arr);
      const val25 = ret[0];
      expect(val25).assertEqual(20);
      const val26 = ret[1];
      expect(val26).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_3200
     * @tc.name testTypedUArraysToReversedPart201_032
     * @tc.desc Verify toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([100, 200, 30]);
      const ret = reverseUint8ArrayValue(arr);
      const val27 = ret[0];
      expect(val27).assertEqual(30);
      const val28 = ret[1];
      expect(val28).assertEqual(200);
      const val29 = ret[2];
      expect(val29).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_3300
     * @tc.name testTypedUArraysToReversedPart201_033
     * @tc.desc Verify toReversed Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0xFF, 0x80, 0x01]);
      const ret = reverseUint8ArrayValue(arr);
      const val30 = ret[0];
      expect(val30).assertEqual(0x01);
      const val31 = ret[1];
      expect(val31).assertEqual(0x80);
      const val32 = ret[2];
      expect(val32).assertEqual(0xFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_3400
     * @tc.name testTypedUArraysToReversedPart201_034
     * @tc.desc Verify toReversed Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0xFFFF, 0x8000, 0x0001]);
      const ret = reverseUint16ArrayValue(arr);
      const val33 = ret[0];
      expect(val33).assertEqual(0x0001);
      const val34 = ret[1];
      expect(val34).assertEqual(0x8000);
      const val35 = ret[2];
      expect(val35).assertEqual(0xFFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_3500
     * @tc.name testTypedUArraysToReversedPart201_035
     * @tc.desc Verify toReversed Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0xFFFFFFFF, 0x80000000, 0x00000001]);
      const ret = reverseUint32ArrayValue(arr);
      const val36 = ret[0];
      expect(val36).assertEqual(0x00000001);
      const val37 = ret[1];
      expect(val37).assertEqual(0x80000000);
      const val38 = ret[2];
      expect(val38).assertEqual(0xFFFFFFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_3600
     * @tc.name testTypedUArraysToReversedPart201_036
     * @tc.desc Verify toReversed BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      const ret = reverseBigUint64ArrayValue(arr);
      const val39 = ret[0];
      expect(val39).assertEqual(4n);
      const val40 = ret[1];
      expect(val40).assertEqual(3n);
      const val41 = ret[2];
      expect(val41).assertEqual(2n);
      const val42 = ret[3];
      expect(val42).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_3700
     * @tc.name testTypedUArraysToReversedPart201_037
     * @tc.desc Verify toReversed Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 127, 255]);
      const ret = reverseUint8ArrayValue(arr);
      const val43 = ret[0];
      expect(val43).assertEqual(255);
      const val44 = ret[1];
      expect(val44).assertEqual(127);
      const val45 = ret[2];
      expect(val45).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_3800
     * @tc.name testTypedUArraysToReversedPart201_038
     * @tc.desc Verify toReversed length 5 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = reverseUint8ArrayValue(arr);
      expect(ret.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_3900
     * @tc.name testTypedUArraysToReversedPart201_039
     * @tc.desc Verify toReversed length 5 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const ret = reverseUint16ArrayValue(arr);
      expect(ret.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_4000
     * @tc.name testTypedUArraysToReversedPart201_040
     * @tc.desc Verify toReversed length 5 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const ret = reverseUint32ArrayValue(arr);
      expect(ret.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_4100
     * @tc.name testTypedUArraysToReversedPart201_041
     * @tc.desc Verify toReversed length 5 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const ret = reverseUint8ClampedArrayValue(arr);
      expect(ret.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_4200
     * @tc.name testTypedUArraysToReversedPart201_042
     * @tc.desc Verify toReversed length 5 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const ret = reverseBigUint64ArrayValue(arr);
      expect(ret.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_4300
     * @tc.name testTypedUArraysToReversedPart201_043
     * @tc.desc Verify toReversed length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const ret = reverseUint8ArrayValue(arr);
      expect(ret.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_4400
     * @tc.name testTypedUArraysToReversedPart201_044
     * @tc.desc Verify toReversed length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const ret = reverseUint8ArrayValue(arr);
      expect(ret.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_4500
     * @tc.name testTypedUArraysToReversedPart201_045
     * @tc.desc Verify toReversed length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      const ret = reverseUint8ArrayValue(arr);
      expect(ret.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_4600
     * @tc.name testTypedUArraysToReversedPart201_046
     * @tc.desc Verify toReversed length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const ret = reverseUint8ArrayValue(arr);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_4700
     * @tc.name testTypedUArraysToReversedPart201_047
     * @tc.desc Verify toReversed length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = reverseUint8ArrayValue(arr);
      expect(ret.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_4800
     * @tc.name testTypedUArraysToReversedPart201_048
     * @tc.desc Verify toReversed byteLength 5 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = reverseUint8ArrayValue(arr);
      expect(ret.byteLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_4900
     * @tc.name testTypedUArraysToReversedPart201_049
     * @tc.desc Verify toReversed byteLength 10 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const ret = reverseUint16ArrayValue(arr);
      expect(ret.byteLength).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_5000
     * @tc.name testTypedUArraysToReversedPart201_050
     * @tc.desc Verify toReversed byteLength 20 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    
  });
}
