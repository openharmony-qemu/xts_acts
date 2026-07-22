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

export default function typedUArraysWith02(): void {
  describe('TypedUArraysWith02', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_0110
     * @tc.name testTypedUArraysWith001
     * @tc.desc Verify with 0 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n]);
      let result = withBigUint64ArrayValue(arr, 0, 100n);
      const val35 = result[0];
      expect(val35).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_4600
     * @tc.name testTypedUArraysWith046
     * @tc.desc Verify with Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = withUint8ArrayValue(arr, 1, 99);
      expect(result).not().assertEqual(null);
      expect(result).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_4700
     * @tc.name testTypedUArraysWith047
     * @tc.desc Verify with Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      let result = withUint16ArrayValue(arr, 1, 999);
      expect(result).not().assertEqual(null);
      expect(result).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_4800
     * @tc.name testTypedUArraysWith048
     * @tc.desc Verify with Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      let result = withUint32ArrayValue(arr, 1, 9999);
      expect(result).not().assertEqual(null);
      expect(result).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_4900
     * @tc.name testTypedUArraysWith049
     * @tc.desc Verify with Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      let result = withUint8ClampedArrayValue(arr, 1, 99);
      expect(result).not().assertEqual(null);
      expect(result).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_5000
     * @tc.name testTypedUArraysWith050
     * @tc.desc Verify with BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      let result = withBigUint64ArrayValue(arr, 1, 99n);
      expect(result).not().assertEqual(null);
      expect(result).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_5100
     * @tc.name testTypedUArraysWith051
     * @tc.desc Verify with Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40, 50]);
      let result = withUint8ArrayValue(arr, 2, 99);
      expect(result.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_5200
     * @tc.name testTypedUArraysWith052
     * @tc.desc Verify with BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let result = withBigUint64ArrayValue(arr, 2, 99n);
      expect(result.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_5300
     * @tc.name testTypedUArraysWith053
     * @tc.desc Verify with 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = withUint8ArrayValue(arr, 0, 99);
      const val36 = result[0];
      expect(val36).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_5400
     * @tc.name testTypedUArraysWith054
     * @tc.desc Verify with Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let result = withUint16ArrayValue(arr, 0, 99);
      expect(result[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_5500
     * @tc.name testTypedUArraysWith055
     * @tc.desc Verify with Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let result = withUint8ClampedArrayValue(arr, 0, 99);
      expect(result[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_5600
     * @tc.name testTypedUArraysWith056
     * @tc.desc Verify with BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = withBigUint64ArrayValue(arr, 0, 99n);
      expect(result[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_5700
     * @tc.name testTypedUArraysWith057
     * @tc.desc Verify with Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = withUint8ArrayValue(arr, 2, 99);
      const val37 = result[0];
      expect(val37).assertEqual(1);
      const val38 = result[1];
      expect(val38).assertEqual(2);
      const val39 = result[3];
      expect(val39).assertEqual(4);
      const val40 = result[4];
      expect(val40).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_5800
     * @tc.name testTypedUArraysWith058
     * @tc.desc Verify with BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = withBigUint64ArrayValue(arr, 2, 99n);
      const val41 = result[0];
      expect(val41).assertEqual(1n);
      const val42 = result[1];
      expect(val42).assertEqual(2n);
      const val43 = result[3];
      expect(val43).assertEqual(4n);
      const val44 = result[4];
      expect(val44).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_5900
     * @tc.name testTypedUArraysWith059
     * @tc.desc Verify with Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const r1 = withUint8ArrayValue(arr, 0, 99);
      const r2 = withUint8ArrayValue(arr, 0, 88);
      const val45 = r1[0];
      expect(val45).assertEqual(99);
      const val46 = r2[0];
      expect(val46).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_6000
     * @tc.name testTypedUArraysWith060
     * @tc.desc Verify with TypedArray Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      let result = withUint32ArrayValue(arr, 1, 99);
      expect(result[1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_6100
     * @tc.name testTypedUArraysWith061
     * @tc.desc Verify with index=3 Uint8Array 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint8Array([1, 2, 3]);
        withUint8ArrayValue(arr, 3, 99);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_6200
     * @tc.name testTypedUArraysWith062
     * @tc.desc Verify with index=3 Uint16Array 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint16Array([1, 2, 3]);
        withUint16ArrayValue(arr, 3, 99);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_6300
     * @tc.name testTypedUArraysWith063
     * @tc.desc Verify with index=3 Uint32Array 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint32Array([1, 2, 3]);
        withUint32ArrayValue(arr, 3, 99);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_6400
     * @tc.name testTypedUArraysWith064
     * @tc.desc Verify with index=3 Uint8ClampedArray 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint8ClampedArray([1, 2, 3]);
        withUint8ClampedArrayValue(arr, 3, 99);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_6500
     * @tc.name testTypedUArraysWith065
     * @tc.desc Verify with index=3 BigUint64Array 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new BigUint64Array([1n, 2n, 3n]);
        withBigUint64ArrayValue(arr, 3, 99n);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_6600
     * @tc.name testTypedUArraysWith066
     * @tc.desc Verify with index=NaN RangeError Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint8Array([1, 2, 3]);
        withUint8ArrayValue(arr, NaN, 99);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_6700
     * @tc.name testTypedUArraysWith067
     * @tc.desc Verify with index=NaN RangeError BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new BigUint64Array([1n, 2n, 3n]);
        withBigUint64ArrayValue(arr, NaN, 99n);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_6800
     * @tc.name testTypedUArraysWith068
     * @tc.desc Verify with index=Infinity RangeError Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint8Array([1, 2, 3]);
        withUint8ArrayValue(arr, Number.POSITIVE_INFINITY, 99);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_6900
     * @tc.name testTypedUArraysWith069
     * @tc.desc Verify with index=-Infinity RangeError Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint8Array([1, 2, 3]);
        withUint8ArrayValue(arr, Number.NEGATIVE_INFINITY, 99);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_7000
     * @tc.name testTypedUArraysWith070
     * @tc.desc Verify with index=-0 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = withUint8ArrayValue(arr, -0, 99);
      expect(result[0]).assertEqual(99);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_7100
     * @tc.name testTypedUArraysWith071
     * @tc.desc Verify with value=256 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      let result = withUint8ArrayValue(arr, 0, 256);
      const val47 = result[0];
      expect(val47).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_7200
     * @tc.name testTypedUArraysWith072
     * @tc.desc Verify with value=257 Uint8Array 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      let result = withUint8ArrayValue(arr, 0, 257);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_7300
     * @tc.name testTypedUArraysWith073
     * @tc.desc Verify with value=-1 Uint8Array 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      let result = withUint8ArrayValue(arr, 0, -1);
      expect(result[0]).assertEqual(255);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_7400
     * @tc.name testTypedUArraysWith074
     * @tc.desc Verify with value=65536 Uint16Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0]);
      let result = withUint16ArrayValue(arr, 0, 65536);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_7500
     * @tc.name testTypedUArraysWith075
     * @tc.desc Verify with value=-1 Uint16Array 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0]);
      let result = withUint16ArrayValue(arr, 0, -1);
      expect(result[0]).assertEqual(65535);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_7600
     * @tc.name testTypedUArraysWith076
     * @tc.desc Verify with value=4294967296 Uint32Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0]);
      let result = withUint32ArrayValue(arr, 0, 4294967296);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_7700
     * @tc.name testTypedUArraysWith077
     * @tc.desc Verify with value=-1 Uint32Array 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0]);
      let result = withUint32ArrayValue(arr, 0, -1);
      expect(result[0]).assertEqual(4294967295);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_7800
     * @tc.name testTypedUArraysWith078
     * @tc.desc Verify with value=300 Uint8ClampedArray 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      let result = withUint8ClampedArrayValue(arr, 0, 300);
      expect(result[0]).assertEqual(255);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_7900
     * @tc.name testTypedUArraysWith079
     * @tc.desc Verify with value=-10 Uint8ClampedArray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      let result = withUint8ClampedArrayValue(arr, 0, -10);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_8000
     * @tc.name testTypedUArraysWith080
     * @tc.desc Verify with value=255 Uint8ClampedArray 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      let result = withUint8ClampedArrayValue(arr, 0, 255);
      expect(result[0]).assertEqual(255);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_8100
     * @tc.name testTypedUArraysWith081
     * @tc.desc Verify with value=200 Uint8ClampedArray 200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      let result = withUint8ClampedArrayValue(arr, 0, 200);
      expect(result[0]).assertEqual(200);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_8200
     * @tc.name testTypedUArraysWith082
     * @tc.desc Verify with value=1000 Uint8ClampedArray 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      let result = withUint8ClampedArrayValue(arr, 0, 1000);
      expect(result[0]).assertEqual(255);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_8300
     * @tc.name testTypedUArraysWith083
     * @tc.desc Verify with value=-100 Uint8ClampedArray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      let result = withUint8ClampedArrayValue(arr, 0, -100);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_8400
     * @tc.name testTypedUArraysWith084
     * @tc.desc Verify with value=3.14 Uint8Array 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      let result = withUint8ArrayValue(arr, 0, 3);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_8500
     * @tc.name testTypedUArraysWith085
     * @tc.desc Verify with value=3.14 Uint8ClampedArray 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      let result = withUint8ClampedArrayValue(arr, 0, 3);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_8600
     * @tc.name testTypedUArraysWith086
     * @tc.desc Verify with value=1.9 Uint16Array 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0]);
      let result = withUint16ArrayValue(arr, 0, 1);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_8700
     * @tc.name testTypedUArraysWith087
     * @tc.desc Verify with index 1.5 Uint8Array 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = withUint8ArrayValue(arr, 1, 99);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(99);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_8800
     * @tc.name testTypedUArraysWith088
     * @tc.desc Verify with index 1.5 BigUint64Array 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      let result = withBigUint64ArrayValue(arr, 1, 99n);
      expect(result[0]).assertEqual(10n);
      expect(result[1]).assertEqual(99n);
      expect(result[2]).assertEqual(30n);
    });

  });
}
