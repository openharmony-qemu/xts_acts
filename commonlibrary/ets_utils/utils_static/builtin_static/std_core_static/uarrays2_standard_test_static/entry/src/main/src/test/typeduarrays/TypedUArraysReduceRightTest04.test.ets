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

export default function typedUArraysReduceRightTest04(): void {
  describe('TypedUArraysReduceRightTest04', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => { await Utils.msSleep(30); });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_0100
     * @tc.name testTypedUArraysReduceRightTestFileD001
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let order: number[] = [];
      arr.reduceRight((sum, val) => { order.push(val); return sum + val; });
      expect(order[0]).assertEqual(20);
      expect(order[1]).assertEqual(10);
      expect(order.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_0200
     * @tc.name testTypedUArraysReduceRightTestFileD002
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let indices: number[] = [];
      arr.reduceRight((sum, val, idx, arr2) => { indices.push(idx); return sum + val; });
      expect(indices[0]).assertEqual(1);
      expect(indices[1]).assertEqual(0);
      expect(indices.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_0300
     * @tc.name testTypedUArraysReduceRightTestFileD003
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let arrayRef: Uint8Array | null = null;
      arr.reduceRight((sum, val, idx, array) => { arrayRef = arr; return sum + val; });
      expect(arrayRef).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_0400
     * @tc.name testTypedUArraysReduceRightTestFileD004
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([100, 200, 300]);
      let idxSum: number = 0;
      arr.reduceRight((sum, val, idx, arr2) => { idxSum = idxSum + idx; return sum + val; });
      expect(idxSum).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_0500
     * @tc.name testTypedUArraysReduceRightTestFileD005
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      let callCount: number = 0;
      arr.reduceRight((sum, val) => { callCount++; return sum + val; });
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_0600
     * @tc.name testTypedUArraysReduceRightTestFileD006
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20]);
      let callCount: number = 0;
      arr.reduceRight((sum, val) => { callCount++; return sum + val; });
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_0700
     * @tc.name testTypedUArraysReduceRightTestFileD007
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let callCount: number = 0;
      arr.reduceRight((sum, val) => { callCount++; return sum + val; });
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_0800
     * @tc.name testTypedUArraysReduceRightTestFileD008
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      try {
        arr.reduceRight((sum, val) => sum + val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_0900
     * @tc.name testTypedUArraysReduceRightTestFileD009
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_1000
     * @tc.name testTypedUArraysReduceRightTestFileD010
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 5, 5, 5, 5]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_1100
     * @tc.name testTypedUArraysReduceRightTestFileD011
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.reduceRight((sum, val) => sum + val);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_1200
     * @tc.name testTypedUArraysReduceRightTestFileD012
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      arr.reduceRight((sum, val) => sum * 2);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_1300
     * @tc.name testTypedUArraysReduceRightTestFileD013
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.reduceRight((sum, val) => sum + val);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_1400
     * @tc.name testTypedUArraysReduceRightTestFileD014
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const buf = arr.buffer;
      arr.reduceRight((sum, val) => sum + val);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_1500
     * @tc.name testTypedUArraysReduceRightTestFileD015
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 4, 8);
      arr.reduceRight((sum, val) => sum + val);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_1600
     * @tc.name testTypedUArraysReduceRightTestFileD016
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.reduceRight((sum, val) => sum + val);
      expect(arr.byteLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_1700
     * @tc.name testTypedUArraysReduceRightTestFileD017
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      arr.reduceRight((sum, val) => sum + val);
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_1800
     * @tc.name testTypedUArraysReduceRightTestFileD018
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val) * 2;
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_1900
     * @tc.name testTypedUArraysReduceRightTestFileD019
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Uint8Array([1, 2, 3]);
      const arr2 = new Uint8Array([4, 5, 6]);
      const intermediate = arr1.reduceRight((sum, val) => sum + val);
      let result = arr2.reduceRight((sum, val) => sum + val, intermediate);
      expect(result).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_2000
     * @tc.name testTypedUArraysReduceRightTestFileD020
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Uint8Array([1, 2, 3]);
      const arr2 = new Uint8Array([4, 5, 6]);
      const intermediate = arr1.reduceRight((sum, val) => sum + val);
      let result = arr2.reduce((sum, val) => sum + val, intermediate);
      expect(result).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_2100
     * @tc.name testTypedUArraysReduceRightTestFileD021
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const reduceResult = arr.reduce((sum, val) => sum + val);
      const reduceRightResult = arr.reduceRight((sum, val) => sum + val);
      expect(reduceResult).assertEqual(reduceRightResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_2200
     * @tc.name testTypedUArraysReduceRightTestFileD022
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result > 5).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_2300
     * @tc.name testTypedUArraysReduceRightTestFileD023
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(Math.sqrt(result)).assertEqual(Math.sqrt(6));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_2400
     * @tc.name testTypedUArraysReduceRightTestFileD024
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_2500
     * @tc.name testTypedUArraysReduceRightTestFileD025
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result.toString()).assertEqual("6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_2600
     * @tc.name testTypedUArraysReduceRightTestFileD026
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val);
      const arrResult = [result, result * 2];
      expect(arrResult[0]).assertEqual(6);
      expect(arrResult[1]).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_2700
     * @tc.name testTypedUArraysReduceRightTestFileD027
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_2800
     * @tc.name testTypedUArraysReduceRightTestFileD028
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const u8 = new Uint8Array(buf);
      u8[0] = 1; u8[1] = 2; u8[2] = 3; u8[3] = 4;
      const child = new Uint8Array(buf, 0, 4);
      let result = child.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_2900
     * @tc.name testTypedUArraysReduceRightTestFileD029
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const u8 = new Uint8Array(buf);
      u8[4] = 1; u8[5] = 2; u8[6] = 3; u8[7] = 4;
      const view = new Uint8Array(buf, 4, 4);
      let result = view.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_3000
     * @tc.name testTypedUArraysReduceRightTestFileD030
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const u8 = new Uint8Array(buf);
      for (let i = 0; i < 8; i++) { u8[i] = i + 1; }
      const view = new Uint8Array(buf, 0, 8);
      let result = view.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(36);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_3100
     * @tc.name testTypedUArraysReduceRightTestFileD031
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const u8 = new Uint8Array(buf);
      for (let i = 8; i < 16; i++) { u8[i] = 10 + (i - 8); }
      const view = new Uint8Array(buf, 8, 4);
      let result = view.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(46);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_3200
     * @tc.name testTypedUArraysReduceRightTestFileD032
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const u8View = new Uint8Array(buf);
      u8View[0] = 1; u8View[1] = 0; u8View[2] = 2; u8View[3] = 0; u8View[4] = 3; u8View[5] = 0;
      const u16View = new Uint16Array(buf);
      let result = u16View.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_3300
     * @tc.name testTypedUArraysReduceRightTestFileD033
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const u8 = new Uint8Array(buf);
      u8[0] = 1; u8[1] = 2; u8[2] = 3; u8[3] = 4;
      const child = new Uint8Array(buf, 0, 4);
      child.reduceRight((sum, val) => sum + val);
      expect(u8[0]).assertEqual(1);
      expect(u8[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_3400
     * @tc.name testTypedUArraysReduceRightTestFileD034
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const u8 = new Uint8Array(buf);
      u8[0] = 1; u8[1] = 2; u8[2] = 3; u8[3] = 4;
      const child = new Uint8Array(buf, 0, 4);
      let result = child.reduceRight((sum, val) => sum + val);
      expect(u8.reduceRight((s, v) => s + v)).assertEqual(result);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_3500
     * @tc.name testTypedUArraysReduceRightTestFileD035
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const u8 = new Uint8Array(buf);
      u8[0] = 1; u8[1] = 2; u8[2] = 3; u8[3] = 4;
      const v1 = new Uint8Array(buf, 0, 4);
      const v2 = new Uint8Array(buf, 4, 4);
      let result = v1.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(10);
      expect(v2[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_3600
     * @tc.name testTypedUArraysReduceRightTestFileD036
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Uint8Array(buf, 4, 4);
      view.reduceRight((sum, val) => sum + val);
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_3700
     * @tc.name testTypedUArraysReduceRightTestFileD037
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Uint8Array(buf, 4, 4);
      view.reduceRight((sum, val) => sum + val);
      expect(view.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_3800
     * @tc.name testTypedUArraysReduceRightTestFileD038
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(0);
      try {
        arr.reduceRight((sum, val) => sum + val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_3900
     * @tc.name testTypedUArraysReduceRightTestFileD039
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      try {
        arr.reduceRight((sum, val) => sum + val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_4000
     * @tc.name testTypedUArraysReduceRightTestFileD040
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      try {
        arr.reduceRight((sum, val) => sum + val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST04_4100
     * @tc.name testTypedUArraysReduceRightTestFileD041
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileD041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0);
      let result = arr.reduceRight((sum, val) => sum + val, 42n);
      expect(result).assertEqual(42n);
    });
  });
}
