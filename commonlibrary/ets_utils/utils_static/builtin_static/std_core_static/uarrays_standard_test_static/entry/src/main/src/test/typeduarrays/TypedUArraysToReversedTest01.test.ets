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


export default function typedUArraysToReversedTest01(): void {
  describe('TypedUArraysToReversedTest01', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_0100
     * @tc.name testTypedUArraysToReversed01001
     * @tc.desc Verify toReversed 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = reverseUint8ArrayValue(arr);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_0200
     * @tc.name testTypedUArraysToReversed01002
     * @tc.desc Verify toReversed 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30, 40, 50]);
      let result = reverseUint16ArrayValue(arr);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_0300
     * @tc.name testTypedUArraysToReversed01003
     * @tc.desc Verify toReversed 0 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300, 400, 500]);
      let result = reverseUint32ArrayValue(arr);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_0400
     * @tc.name testTypedUArraysToReversed01004
     * @tc.desc Verify toReversed 0 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = reverseUint8ClampedArrayValue(arr);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_0500
     * @tc.name testTypedUArraysToReversed01005
     * @tc.desc Verify toReversed 0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = reverseBigUint64ArrayValue(arr);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_0600
     * @tc.name testTypedUArraysToReversed01006
     * @tc.desc Verify toReversed Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = reverseUint8ArrayValue(arr);
      const val0 = result[0];
      expect(val0).assertEqual(3);
      const val1 = result[2];
      expect(val1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_0700
     * @tc.name testTypedUArraysToReversed01007
     * @tc.desc Verify toReversed Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = reverseUint8ArrayValue(arr);
      const val2 = result[0];
      expect(val2).assertEqual(5);
      const val3 = result[1];
      expect(val3).assertEqual(4);
      const val4 = result[3];
      expect(val4).assertEqual(2);
      const val5 = result[4];
      expect(val5).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_0800
     * @tc.name testTypedUArraysToReversed01008
     * @tc.desc Verify toReversed Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30, 40, 50]);
      let result = reverseUint16ArrayValue(arr);
      const val6 = result[0];
      expect(val6).assertEqual(50);
      const val7 = result[1];
      expect(val7).assertEqual(40);
      const val8 = result[3];
      expect(val8).assertEqual(20);
      const val9 = result[4];
      expect(val9).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_0900
     * @tc.name testTypedUArraysToReversed01009
     * @tc.desc Verify toReversed Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300, 400, 500]);
      let result = reverseUint32ArrayValue(arr);
      const val10 = result[0];
      expect(val10).assertEqual(500);
      const val11 = result[4];
      expect(val11).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_1000
     * @tc.name testTypedUArraysToReversed01010
     * @tc.desc Verify toReversed Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      let result = reverseUint8ClampedArrayValue(arr);
      const val12 = result[0];
      expect(val12).assertEqual(40);
      const val13 = result[1];
      expect(val13).assertEqual(30);
      const val14 = result[2];
      expect(val14).assertEqual(20);
      const val15 = result[3];
      expect(val15).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_1100
     * @tc.name testTypedUArraysToReversed01011
     * @tc.desc Verify toReversed BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = reverseBigUint64ArrayValue(arr);
      const val16 = result[0];
      expect(val16).assertEqual(5n);
      const val17 = result[1];
      expect(val17).assertEqual(4n);
      const val18 = result[3];
      expect(val18).assertEqual(2n);
      const val19 = result[4];
      expect(val19).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_1200
     * @tc.name testTypedUArraysToReversed01012
     * @tc.desc Verify toReversed Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      let result = reverseUint8ArrayValue(arr);
      expect(result.length).assertEqual(1);
      const val20 = result[0];
      expect(val20).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_1300
     * @tc.name testTypedUArraysToReversed01013
     * @tc.desc Verify toReversed Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([99]);
      let result = reverseUint16ArrayValue(arr);
      const val21 = result[0];
      expect(val21).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_1400
     * @tc.name testTypedUArraysToReversed01014
     * @tc.desc Verify toReversed Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([999]);
      let result = reverseUint32ArrayValue(arr);
      const val22 = result[0];
      expect(val22).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_1500
     * @tc.name testTypedUArraysToReversed01015
     * @tc.desc Verify toReversed Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([55]);
      let result = reverseUint8ClampedArrayValue(arr);
      const val23 = result[0];
      expect(val23).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_1600
     * @tc.name testTypedUArraysToReversed01016
     * @tc.desc Verify toReversed BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([42n]);
      let result = reverseBigUint64ArrayValue(arr);
      const val24 = result[0];
      expect(val24).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_1700
     * @tc.name testTypedUArraysToReversed01017
     * @tc.desc Verify toReversed Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([]);
      let result = reverseUint8ArrayValue(arr);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_1800
     * @tc.name testTypedUArraysToReversed01018
     * @tc.desc Verify toReversed Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([]);
      let result = reverseUint16ArrayValue(arr);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_1900
     * @tc.name testTypedUArraysToReversed01019
     * @tc.desc Verify toReversed Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([]);
      let result = reverseUint32ArrayValue(arr);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_2000
     * @tc.name testTypedUArraysToReversed01020
     * @tc.desc Verify toReversed Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      let result = reverseUint8ClampedArrayValue(arr);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_2100
     * @tc.name testTypedUArraysToReversed01021
     * @tc.desc Verify toReversed BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([]);
      let result = reverseBigUint64ArrayValue(arr);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_2200
     * @tc.name testTypedUArraysToReversed01022
     * @tc.desc Verify toReversed Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      let result = reverseUint8ArrayValue(arr);
      const val25 = result[0];
      expect(val25).assertEqual(2);
      const val26 = result[1];
      expect(val26).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_2300
     * @tc.name testTypedUArraysToReversed01023
     * @tc.desc Verify toReversed BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n]);
      let result = reverseBigUint64ArrayValue(arr);
      const val27 = result[0];
      expect(val27).assertEqual(2n);
      const val28 = result[1];
      expect(val28).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_2400
     * @tc.name testTypedUArraysToReversed01024
     * @tc.desc Verify toReversed Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = reverseUint8ArrayValue(arr);
      expect(result === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_2500
     * @tc.name testTypedUArraysToReversed01025
     * @tc.desc Verify toReversed Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30]);
      let result = reverseUint16ArrayValue(arr);
      expect(result === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_2600
     * @tc.name testTypedUArraysToReversed01026
     * @tc.desc Verify toReversed Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300]);
      let result = reverseUint32ArrayValue(arr);
      expect(result === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_2700
     * @tc.name testTypedUArraysToReversed01027
     * @tc.desc Verify toReversed Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let result = reverseUint8ClampedArrayValue(arr);
      expect(result === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_2800
     * @tc.name testTypedUArraysToReversed01028
     * @tc.desc Verify toReversed BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = reverseBigUint64ArrayValue(arr);
      expect(result === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_2900
     * @tc.name testTypedUArraysToReversed01029
     * @tc.desc Verify toReversed Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      let result = reverseUint8ArrayValue(arr);
      expect(result.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_3000
     * @tc.name testTypedUArraysToReversed01030
     * @tc.desc Verify toReversed BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      let result = reverseBigUint64ArrayValue(arr);
      expect(result.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_3100
     * @tc.name testTypedUArraysToReversed01031
     * @tc.desc Verify toReversed Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = reverseUint8ArrayValue(arr);
      const val29 = arr[0] ;
      expect(val29).assertEqual(1);
      const val30 = arr[1] ;
      expect(val30).assertEqual(2);
      const val31 = arr[3] ;
      expect(val31).assertEqual(4);
      const val32 = arr[4] ;
      expect(val32).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_3200
     * @tc.name testTypedUArraysToReversed01032
     * @tc.desc Verify toReversed Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30, 40, 50]);
      let result = reverseUint16ArrayValue(arr);
      const val33 = arr[0] ;
      expect(val33).assertEqual(10);
      const val34 = arr[4] ;
      expect(val34).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_3300
     * @tc.name testTypedUArraysToReversed01033
     * @tc.desc Verify toReversed Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300, 400, 500]);
      let result = reverseUint32ArrayValue(arr);
      const val35 = arr[0] ;
      expect(val35).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_3400
     * @tc.name testTypedUArraysToReversed01034
     * @tc.desc Verify toReversed Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = reverseUint8ClampedArrayValue(arr);
      const val36 = arr[0] ;
      expect(val36).assertEqual(1);
      const val37 = arr[4] ;
      expect(val37).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_3500
     * @tc.name testTypedUArraysToReversed01035
     * @tc.desc Verify toReversed BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = reverseBigUint64ArrayValue(arr);
      const val38 = arr[0];
      expect(val38).assertEqual(1n);
      const val39 = arr[4];
      expect(val39).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_3600
     * @tc.name testTypedUArraysToReversed01036
     * @tc.desc Verify toReversed Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = reverseUint8ArrayValue(arr);
      const val0 = result[0];
      expect(val0).assertEqual(3);
      const val2 = result[2];
      expect(val2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_3700
     * @tc.name testTypedUArraysToReversed01037
     * @tc.desc Verify toReversed Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30]);
      let result = reverseUint16ArrayValue(arr);
      const val0 = result[0];
      expect(val0).assertEqual(30);
      const val2 = result[2];
      expect(val2).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_3800
     * @tc.name testTypedUArraysToReversed01038
     * @tc.desc Verify toReversed Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300]);
      let result = reverseUint32ArrayValue(arr);
      const val0 = result[0];
      expect(val0).assertEqual(300);
      const val2 = result[2];
      expect(val2).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_3900
     * @tc.name testTypedUArraysToReversed01039
     * @tc.desc Verify toReversed Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let result = reverseUint8ClampedArrayValue(arr);
      const val0 = result[0];
      expect(val0).assertEqual(3);
      const val2 = result[2];
      expect(val2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_4000
     * @tc.name testTypedUArraysToReversed01040
     * @tc.desc Verify toReversed BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = reverseBigUint64ArrayValue(arr);
      const val0 = result[0];
      expect(val0).assertEqual(3n);
      const val2 = result[2];
      expect(val2).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_4100
     * @tc.name testTypedUArraysToReversed01041
     * @tc.desc Verify toReversed Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = reverseUint8ArrayValue(arr);
      const val40 = result[0];
      expect(val40).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_4200
     * @tc.name testTypedUArraysToReversed01042
     * @tc.desc Verify toReversed Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const r1 = reverseUint8ArrayValue(arr);
      const r2 = reverseUint8ArrayValue(arr);
      const val41 = r1[0];
      expect(val41).assertEqual(3);
      const val42 = r2[0];
      expect(val42).assertEqual(3);
      const val43 = arr[0] ;
      expect(val43).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_4300
     * @tc.name testTypedUArraysToReversed01043
     * @tc.desc Verify toReversed BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    
  });
}
