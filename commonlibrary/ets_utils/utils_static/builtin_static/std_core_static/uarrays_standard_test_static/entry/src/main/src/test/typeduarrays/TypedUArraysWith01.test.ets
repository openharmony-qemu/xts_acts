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


function normalizeWithIndex(length: number, index: number): number {
  const normalized: number = index < 0 ? length + index : index;
  if (normalized < 0 || normalized >= length) {
    throw new RangeError('index out of range');
  }
  return normalized;
}

function withUint8ArrayValue(source: Uint8Array, index: number, value: number): Uint8Array {
  const result = new Uint8Array(source);
  result[normalizeWithIndex(source.length, index).toInt()] = value;
  return result;
}

function withUint16ArrayValue(source: Uint16Array, index: number, value: number): Uint16Array {
  const result = new Uint16Array(source);
  result[normalizeWithIndex(source.length, index).toInt()] = value;
  return result;
}

function withUint32ArrayValue(source: Uint32Array, index: number, value: number): Uint32Array {
  const result = new Uint32Array(source);
  result[normalizeWithIndex(source.length, index).toInt()] = value;
  return result;
}

function withUint8ClampedArrayValue(source: Uint8ClampedArray, index: number, value: number): Uint8ClampedArray {
  const result = new Uint8ClampedArray(source);
  result[normalizeWithIndex(source.length, index).toInt()] = value;
  return result;
}

function withBigUint64ArrayValue(source: BigUint64Array, index: number, value: bigint): BigUint64Array {
  const result = new BigUint64Array(source);
  result[normalizeWithIndex(source.length, index).toInt()] = value;
  return result;
}

export default function typedUArraysWith01(): void {
  describe('TypedUArraysWith01', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_0100
     * @tc.name testTypedUArraysWith001
     * @tc.desc Verify with 0 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = withUint8ArrayValue(arr, 0, 0);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_0200
     * @tc.name testTypedUArraysWith002
     * @tc.desc Verify with 0 - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      let result = withUint16ArrayValue(arr, 0, 0);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(200);
      expect(result[2]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_0300
     * @tc.name testTypedUArraysWith003
     * @tc.desc Verify with 0 - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      let result = withUint32ArrayValue(arr, 0, 0);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(2000);
      expect(result[2]).assertEqual(3000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_0400
     * @tc.name testTypedUArraysWith004
     * @tc.desc Verify with 0 - Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      let result = withUint8ClampedArrayValue(arr, 0, 0);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_0500
     * @tc.name testTypedUArraysWith005
     * @tc.desc Verify with 0 - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      let result = withBigUint64ArrayValue(arr, 0, 0n);
      expect(result[0]).assertEqual(0n);
      expect(result[1]).assertEqual(20n);
      expect(result[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_0600
     * @tc.name testTypedUArraysWith006
     * @tc.desc Verify with 1 - value Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = withUint8ArrayValue(arr, 1, 1);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_0700
     * @tc.name testTypedUArraysWith007
     * @tc.desc Verify with 1 - value Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      let result = withUint16ArrayValue(arr, 1, 1);
      expect(result[0]).assertEqual(100);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_0800
     * @tc.name testTypedUArraysWith008
     * @tc.desc Verify with 1 - value Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      let result = withUint32ArrayValue(arr, 1, 1);
      expect(result[0]).assertEqual(1000);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(3000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_0900
     * @tc.name testTypedUArraysWith009
     * @tc.desc Verify with 1 - value Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      let result = withUint8ClampedArrayValue(arr, 1, 1);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_1000
     * @tc.name testTypedUArraysWith010
     * @tc.desc Verify with 1 - value BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      let result = withBigUint64ArrayValue(arr, 1, 1n);
      expect(result[0]).assertEqual(10n);
      expect(result[1]).assertEqual(1n);
      expect(result[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_1100
     * @tc.name testTypedUArraysWith011
     * @tc.desc Verify with index=0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = withUint8ArrayValue(arr, 0, 99);
      const val0 = result[0];
      expect(val0).assertEqual(99);
      const val1 = result[1];
      expect(val1).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_1200
     * @tc.name testTypedUArraysWith012
     * @tc.desc Verify with index=2 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = withUint8ArrayValue(arr, 2, 99);
      const val2 = result[0];
      expect(val2).assertEqual(10);
      const val3 = result[2];
      expect(val3).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_1300
     * @tc.name testTypedUArraysWith013
     * @tc.desc Verify with index=0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      let result = withUint16ArrayValue(arr, 0, 999);
      const val4 = result[0];
      expect(val4).assertEqual(999);
      const val5 = result[1];
      expect(val5).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_1400
     * @tc.name testTypedUArraysWith014
     * @tc.desc Verify with index=2 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      let result = withUint32ArrayValue(arr, 2, 9999);
      const val6 = result[0];
      expect(val6).assertEqual(1000);
      const val7 = result[2];
      expect(val7).assertEqual(9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_1500
     * @tc.name testTypedUArraysWith015
     * @tc.desc Verify with index=0 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      let result = withUint8ClampedArrayValue(arr, 0, 99);
      const val8 = result[0];
      expect(val8).assertEqual(99);
      const val9 = result[1];
      expect(val9).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_1600
     * @tc.name testTypedUArraysWith016
     * @tc.desc Verify with index=0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      let result = withBigUint64ArrayValue(arr, 0, 99n);
      const val10 = result[0];
      expect(val10).assertEqual(99n);
      const val11 = result[1];
      expect(val11).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_1700
     * @tc.name testTypedUArraysWith017
     * @tc.desc Verify with index=-1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = withUint8ArrayValue(arr, -1, 99);
      const val12 = result[0];
      expect(val12).assertEqual(10);
      const val13 = result[2];
      expect(val13).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_1800
     * @tc.name testTypedUArraysWith018
     * @tc.desc Verify with index=-3 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      let result = withUint16ArrayValue(arr, -3, 999);
      const val14 = result[0];
      expect(val14).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_1900
     * @tc.name testTypedUArraysWith019
     * @tc.desc Verify with index=-1 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      let result = withUint32ArrayValue(arr, -1, 9999);
      const val15 = result[2];
      expect(val15).assertEqual(9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_2000
     * @tc.name testTypedUArraysWith020
     * @tc.desc Verify with index=-1 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      let result = withUint8ClampedArrayValue(arr, -1, 99);
      const val16 = result[2];
      expect(val16).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_2100
     * @tc.name testTypedUArraysWith021
     * @tc.desc Verify with index=-1 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      let result = withBigUint64ArrayValue(arr, -1, 99n);
      const val17 = result[2];
      expect(val17).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_2200
     * @tc.name testTypedUArraysWith022
     * @tc.desc Verify with index=-2 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40]);
      let result = withUint8ArrayValue(arr, -2, 88);
      const val18 = result[2];
      expect(val18).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_2300
     * @tc.name testTypedUArraysWith023
     * @tc.desc Verify with index=0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = withUint8ArrayValue(arr, 0, 99);
      const val19 = arr[0];
      expect(val19).assertEqual(10);
      const val20 = result[0];
      expect(val20).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_2400
     * @tc.name testTypedUArraysWith024
     * @tc.desc Verify with index Uint8Array RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint8Array([10, 20, 30]);
        withUint8ArrayValue(arr, 3, 99);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_2500
     * @tc.name testTypedUArraysWith025
     * @tc.desc Verify with index Uint16Array RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint16Array([100, 200, 300]);
        withUint16ArrayValue(arr, 3, 99);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_2600
     * @tc.name testTypedUArraysWith026
     * @tc.desc Verify with index Uint32Array RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint32Array([1000, 2000, 3000]);
        withUint32ArrayValue(arr, 3, 99);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_2700
     * @tc.name testTypedUArraysWith027
     * @tc.desc Verify with index Uint8ClampedArray RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint8ClampedArray([10, 20, 30]);
        withUint8ClampedArrayValue(arr, 3, 99);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_2800
     * @tc.name testTypedUArraysWith028
     * @tc.desc Verify with index BigUint64Array RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new BigUint64Array([10n, 20n, 30n]);
        withBigUint64ArrayValue(arr, 3, 99n);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_2900
     * @tc.name testTypedUArraysWith029
     * @tc.desc Verify with index -length Uint8Array RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint8Array([10, 20, 30]);
        withUint8ArrayValue(arr, -4, 99);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_3000
     * @tc.name testTypedUArraysWith030
     * @tc.desc Verify with index -length BigUint64Array RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new BigUint64Array([10n, 20n, 30n]);
        withBigUint64ArrayValue(arr, -4, 99n);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_3100
     * @tc.name testTypedUArraysWith031
     * @tc.desc Verify with value=255 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      let result = withUint8ArrayValue(arr, 0, 255);
      const val21 = result[0];
      expect(val21).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_3200
     * @tc.name testTypedUArraysWith032
     * @tc.desc Verify with value=0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = withUint8ArrayValue(arr, 0, 0);
      const val22 = result[0];
      expect(val22).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_3300
     * @tc.name testTypedUArraysWith033
     * @tc.desc Verify with value=65535 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0]);
      let result = withUint16ArrayValue(arr, 0, 65535);
      const val23 = result[0];
      expect(val23).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_3400
     * @tc.name testTypedUArraysWith034
     * @tc.desc Verify with value=0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let result = withUint16ArrayValue(arr, 0, 0);
      const val24 = result[0];
      expect(val24).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_3500
     * @tc.name testTypedUArraysWith035
     * @tc.desc Verify with value=4294967295 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0]);
      let result = withUint32ArrayValue(arr, 0, 4294967295);
      const val25 = result[0];
      expect(val25).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_3600
     * @tc.name testTypedUArraysWith036
     * @tc.desc Verify with value=0 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      let result = withUint32ArrayValue(arr, 0, 0);
      const val26 = result[0];
      expect(val26).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_3700
     * @tc.name testTypedUArraysWith037
     * @tc.desc Verify with value=255 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      let result = withUint8ClampedArrayValue(arr, 0, 255);
      const val27 = result[0];
      expect(val27).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_3800
     * @tc.name testTypedUArraysWith038
     * @tc.desc Verify with value=0 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let result = withUint8ClampedArrayValue(arr, 0, 0);
      const val28 = result[0];
      expect(val28).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_3900
     * @tc.name testTypedUArraysWith039
     * @tc.desc Verify with value=1n BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      let result = withBigUint64ArrayValue(arr, 0, 1n);
      const val29 = result[0];
      expect(val29).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_4000
     * @tc.name testTypedUArraysWith040
     * @tc.desc Verify with value=BigInt('18446744073709551615') BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n]);
      let result = withBigUint64ArrayValue(arr, 0, BigInt('18446744073709551615'));
      const val30 = result[0];
      expect(val30).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_4100
     * @tc.name testTypedUArraysWith041
     * @tc.desc Verify with value=0n BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      let result = withBigUint64ArrayValue(arr, 0, 0n);
      const val31 = result[0];
      expect(val31).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_4200
     * @tc.name testTypedUArraysWith042
     * @tc.desc Verify with value=128 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      let result = withUint8ArrayValue(arr, 0, 128);
      const val32 = result[0];
      expect(val32).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_4300
     * @tc.name testTypedUArraysWith043
     * @tc.desc Verify with value=32768 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0]);
      let result = withUint16ArrayValue(arr, 0, 32768);
      const val33 = result[0];
      expect(val33).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_4400
     * @tc.name testTypedUArraysWith044
     * @tc.desc Verify with value=2147483648 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0]);
      let result = withUint32ArrayValue(arr, 0, 2147483648);
      const val34 = result[0];
      expect(val34).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_4500
     * @tc.name testTypedUArraysWith045
     * @tc.desc Verify with value=100n BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      let result = withBigUint64ArrayValue(arr, 0, 100n);
      expect(result[0]).assertEqual(100n);
      expect(result[1]).assertEqual(20n);
      expect(result[2]).assertEqual(30n);
    });

  });
}
