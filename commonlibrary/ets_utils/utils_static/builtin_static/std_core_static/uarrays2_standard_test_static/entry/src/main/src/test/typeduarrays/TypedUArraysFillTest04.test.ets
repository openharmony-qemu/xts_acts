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

export default function typedUArraysFillTest04(): void {
  describe('TypedUArraysFillTest04', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_0100
     * @tc.name testTypedUArraysFillPart202_001
     * @tc.desc Verify fill(value, start=length+1) instanceof Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.fill(0, 6);
      expect(typeof ret).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_0200
     * @tc.name testTypedUArraysFillPart202_002
     * @tc.desc Verify fill(value, start=length, end=length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.fill(0, 5, 5);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_0300
     * @tc.name testTypedUArraysFillPart202_003
     * @tc.desc Verify fill(value, start=0, end=length+2) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.fill(0, 0, 7);
      expect(ret.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_0400
     * @tc.name testTypedUArraysFillPart202_004
     * @tc.desc Verify fill(value, start=length) byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.fill(0, 5);
      expect(ret.byteLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_0500
     * @tc.name testTypedUArraysFillPart202_005
     * @tc.desc Verify fill(value, start=length, end=length+1) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.fill(0, 5, 6);
      expect(ret.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_0600
     * @tc.name testTypedUArraysFillPart202_006
     * @tc.desc Verify fill(value, start=length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.fill(0, 5).fill(1, 0, 2);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_0700
     * @tc.name testTypedUArraysFillPart202_007
     * @tc.desc Verify fill(value, start= ) typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.fill(0, 1000000);
      expect(typeof ret).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_0800

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_0800
     * @tc.name testTypedUArraysFillPart202_008
     * @tc.desc Verify fill(value, start= )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.fill(0, 1000000);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_0900
     * @tc.name testTypedUArraysFillPart202_009
     * @tc.desc Verify fill(value, start= ) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.fill(0, 1000000);
      expect(ret.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_1000
     * @tc.name testTypedUArraysFillPart202_010
     * @tc.desc Verify fill(value, start= ) byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.fill(0, 1000000);
      expect(ret.byteLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_1100
     * @tc.name testTypedUArraysFillPart202_011
     * @tc.desc Verify fill(value, start= ) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.fill(0, 1000000);
      expect(ret.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_1200
     * @tc.name testTypedUArraysFillPart202_012
     * @tc.desc Verify fill(value, start= )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.fill(0, 1000000).fill(1, 0, 2);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_1300
     * @tc.name testTypedUArraysFillPart202_013
     * @tc.desc Verify fill Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.fill(0);
      const val0 = ret[0];
      expect(val0).assertEqual(arr[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_1400
     * @tc.name testTypedUArraysFillPart202_014
     * @tc.desc Verify fill Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const ret = arr.fill(0);
      const val1 = ret[0];
      expect(val1).assertEqual(arr[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_1500
     * @tc.name testTypedUArraysFillPart202_015
     * @tc.desc Verify fill Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const ret = arr.fill(0);
      const val2 = ret[0];
      expect(val2).assertEqual(arr[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_1600
     * @tc.name testTypedUArraysFillPart202_016
     * @tc.desc Verify fill Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const ret = arr.fill(0);
      const val3 = ret[0];
      expect(val3).assertEqual(arr[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_1700
     * @tc.name testTypedUArraysFillPart202_017
     * @tc.desc Verify fill BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const ret = arr.fill(0n);
      const val4 = ret[0];
      expect(val4).assertEqual(arr[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_1800
     * @tc.name testTypedUArraysFillPart202_018
     * @tc.desc Verify fill Array.isArray Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.fill(0);
      expect(Array.isArray(ret)).assertEqual(false);
      expect(ret[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_1900
     * @tc.name testTypedUArraysFillPart202_019
     * @tc.desc Verify fill Array.isArray Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const ret = arr.fill(0);
      expect(Array.isArray(ret)).assertEqual(false);
      expect(ret[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_2000
     * @tc.name testTypedUArraysFillPart202_020
     * @tc.desc Verify fill Array.isArray Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const ret = arr.fill(0);
      expect(Array.isArray(ret)).assertEqual(false);
      expect(ret[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_2100
     * @tc.name testTypedUArraysFillPart202_021
     * @tc.desc Verify fill Array.isArray Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const ret = arr.fill(0);
      expect(Array.isArray(ret)).assertEqual(false);
      expect(ret[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_2200
     * @tc.name testTypedUArraysFillPart202_022
     * @tc.desc Verify fill Array.isArray BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const ret = arr.fill(0n);
      expect(Array.isArray(ret)).assertEqual(false);
      expect(ret[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_2300
     * @tc.name testTypedUArraysFillPart202_023
     * @tc.desc Verify fill ArrayBuffer.isView Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.fill(0);
      expect(ArrayBuffer.isView(ret)).assertEqual(true);
      expect(ret[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_2400
     * @tc.name testTypedUArraysFillPart202_024
     * @tc.desc Verify fill ArrayBuffer.isView Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const ret = arr.fill(0);
      expect(ArrayBuffer.isView(ret)).assertEqual(true);
      expect(ret[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_2500
     * @tc.name testTypedUArraysFillPart202_025
     * @tc.desc Verify fill ArrayBuffer.isView Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const ret = arr.fill(0);
      expect(ArrayBuffer.isView(ret)).assertEqual(true);
      expect(ret[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_2600
     * @tc.name testTypedUArraysFillPart202_026
     * @tc.desc Verify fill ArrayBuffer.isView Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const ret = arr.fill(0);
      expect(ArrayBuffer.isView(ret)).assertEqual(true);
      expect(ret[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_2700
     * @tc.name testTypedUArraysFillPart202_027
     * @tc.desc Verify fill ArrayBuffer.isView BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const ret = arr.fill(0n);
      expect(ArrayBuffer.isView(ret)).assertEqual(true);
      expect(ret[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_2800
     * @tc.name testTypedUArraysFillPart202_028
     * @tc.desc Verify fill Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.fill(0).fill(1, 2);
      const val5 = arr[0] ;
      expect(val5).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_2900
     * @tc.name testTypedUArraysFillPart202_029
     * @tc.desc Verify fill Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      arr.fill(0).fill(1, 2);
      const val6 = arr[0] ;
      expect(val6).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_3000
     * @tc.name testTypedUArraysFillPart202_030
     * @tc.desc Verify fill Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      arr.fill(0).fill(1, 2);
      const val7 = arr[0] ;
      expect(val7).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_3100
     * @tc.name testTypedUArraysFillPart202_031
     * @tc.desc Verify fill Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.fill(0).fill(1, 2);
      const val8 = arr[0] ;
      expect(val8).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_3200
     * @tc.name testTypedUArraysFillPart202_032
     * @tc.desc Verify fill BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      arr.fill(0n).fill(1n, 2);
      const val9 = arr[0] ;
      expect(val9).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_3300
     * @tc.name testTypedUArraysFillPart202_033
     * @tc.desc Verify fill byteOffset byteOffset Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 4, 4);
      const ret = arr.fill(0);
      expect(ret.byteOffset).assertEqual(arr.byteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_3400
     * @tc.name testTypedUArraysFillPart202_034
     * @tc.desc Verify fill byteOffset byteOffset Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint16Array(buf, 4, 4);
      const ret = arr.fill(0);
      expect(ret.byteOffset).assertEqual(arr.byteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_3500
     * @tc.name testTypedUArraysFillPart202_035
     * @tc.desc Verify fill byteOffset byteOffset Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const arr = new Uint32Array(buf, 8, 4);
      const ret = arr.fill(0);
      expect(ret.byteOffset).assertEqual(arr.byteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_3600
     * @tc.name testTypedUArraysFillPart202_036
     * @tc.desc Verify fill byteOffset byteOffset Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8ClampedArray(buf, 4, 4);
      const ret = arr.fill(0);
      expect(ret.byteOffset).assertEqual(arr.byteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_3700
     * @tc.name testTypedUArraysFillPart202_037
     * @tc.desc Verify fill byteOffset byteOffset BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(64);
      const arr = new BigUint64Array(buf, 16, 4);
      const ret = arr.fill(0n);
      expect(ret.byteOffset).assertEqual(arr.byteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART202_3800
     * @tc.name testTypedUArraysFillPart202_038
     * @tc.desc Verify fill byteLength byteLength Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart202_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 4, 4);
      const ret = arr.fill(0);
      expect(ret.byteLength).assertEqual(arr.byteLength);
    });

  });
}
