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

export default function uint8ClampedArrayWithTwoTest(): void {
  describe('Uint8ClampedArrayWithTwoTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_0100
     * @tc.name testUint8ClampedArrayWithTwo001
     * @tc.desc Verify value=255.9 clamps to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(0, 255.9);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(255);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_0200
     * @tc.name testUint8ClampedArrayWithTwo002
     * @tc.desc Verify value=-0.5 clamps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(0, -0.5);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_0300
     * @tc.name testUint8ClampedArrayWithTwo003
     * @tc.desc Verify value=99.49 rounds to 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(0, 99.49);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(99);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_0400
     * @tc.name testUint8ClampedArrayWithTwo004
     * @tc.desc Verify value=4.5 half-even rounds to 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(0, 4.5);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(4);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_0500
     * @tc.name testUint8ClampedArrayWithTwo005
     * @tc.desc Verify value=-0.4 clamps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(0, -0.4);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_0600
     * @tc.name testUint8ClampedArrayWithTwo006
     * @tc.desc Verify value=256.4 clamps to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(0, 256.4);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(255);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_0700
     * @tc.name testUint8ClampedArrayWithTwo007
     * @tc.desc Verify value=-0.0 clamps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(0, -0.0);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_0800
     * @tc.name testUint8ClampedArrayWithTwo008
     * @tc.desc Verify value=Number.MAX_VALUE clamps to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(0, Number.MAX_VALUE);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(255);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_0900
     * @tc.name testUint8ClampedArrayWithTwo009
     * @tc.desc Verify value=Number.MIN_VALUE clamps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(0, Number.MIN_VALUE);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_1000
     * @tc.name testUint8ClampedArrayWithTwo010
     * @tc.desc Verify value=Number.MAX_SAFE_INTEGER clamps to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(0, Number.MAX_SAFE_INTEGER);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(255);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_1100
     * @tc.name testUint8ClampedArrayWithTwo011
     * @tc.desc Verify value=Number.EPSILON clamps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(0, Number.EPSILON);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_1200
     * @tc.name testUint8ClampedArrayWithTwo012
     * @tc.desc Verify value=2147483648 clamps to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(0, 2147483648.0);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(255);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_1300
     * @tc.name testUint8ClampedArrayWithTwo013
     * @tc.desc Verify value=65535 clamps to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(0, 65535.0);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(255);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_1400
     * @tc.name testUint8ClampedArrayWithTwo014
     * @tc.desc Verify value=-65535 clamps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(0, -65535.0);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_1500
     * @tc.name testUint8ClampedArrayWithTwo015
     * @tc.desc Verify value=0x80 hex literal equals 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(0, 0x80);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(128);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_1600
     * @tc.name testUint8ClampedArrayWithTwo016
     * @tc.desc Verify value=0xFF hex literal equals 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(0, 0xFF);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(255);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_1700
     * @tc.name testUint8ClampedArrayWithTwo017
     * @tc.desc Verify value=1e2 scientific notation equals 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(0, 1e2);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(100);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_1800
     * @tc.name testUint8ClampedArrayWithTwo018
     * @tc.desc Verify with(0,99) on [10,20,30] original arr[0] unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr.with(0, 99.0);
      expect(arr[0]).assertEqual(10);
    });

    it('testUint8ClampedArrayWithTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(0, 99.0).with(1, 88.0);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(99);
      expect(r[1]).assertEqual(88);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_1900
     * @tc.name testUint8ClampedArrayWithTwo019
     * @tc.desc Verify empty array with(-1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      try {
        arr.with(-1, 99.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_2000
     * @tc.name testUint8ClampedArrayWithTwo020
     * @tc.desc Verify large array with(512, 999) clamps to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1024);
      const r = arr.with(512, 999.0);
      expect(r.length).assertEqual(1024);
      expect(r[512]).assertEqual(255);
      expect(r[0]).assertEqual(0);
      expect(r[1023]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_2100
     * @tc.name testUint8ClampedArrayWithTwo021
     * @tc.desc Verify large array with(1023, -999) clamps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1024);
      const r = arr.with(1023, -999.0);
      expect(r.length).assertEqual(1024);
      expect(r[1023]).assertEqual(0);
      expect(r[0]).assertEqual(0);
      expect(r[512]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_2200
     * @tc.name testUint8ClampedArrayWithTwo022
     * @tc.desc Verify with(0,999) on [100] original arr[0] unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100]);
      arr.with(0, 999.0);
      expect(arr[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_2300
     * @tc.name testUint8ClampedArrayWithTwo023
     * @tc.desc Verify typeof with(0,99) on [1,2,3] result is "object"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const w = arr.with(0, 99);
      const t: string = typeof w;
      expect(t).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_2400
     * @tc.name testUint8ClampedArrayWithTwo024
     * @tc.desc Verify with(0,99) on [1,2,3] returns [99,2,3] length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const w = arr.with(0, 99);
      expect(w.length).assertEqual(3);
      expect(w[0]).assertEqual(99);
      expect(w[1]).assertEqual(2);
      expect(w[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_2500
     * @tc.name testUint8ClampedArrayWithTwo025
     * @tc.desc Verify with(0,99) on [1,2,3] result.name equals arr.name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const w = arr.with(0, 99);
      expect(w.name).assertEqual(arr.name);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_2600
     * @tc.name testUint8ClampedArrayWithTwo026
     * @tc.desc Verify with(0,99) on [1,2,3] result.buffer.byteLength equals 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const w = arr.with(0, 99);
      expect(w.buffer.byteLength).assertEqual(3);
      expect(w[0]).assertEqual(99);
      expect(w[1]).assertEqual(2);
      expect(w[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_2700
     * @tc.name testUint8ClampedArrayWithTwo027
     * @tc.desc Verify with(0,Infinity) on [10,20,30] clamps value to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const w = arr.with(0, Number.POSITIVE_INFINITY);
      expect(w.length).assertEqual(3);
      expect(w[0]).assertEqual(255);
      expect(w[1]).assertEqual(20);
      expect(w[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_2800
     * @tc.name testUint8ClampedArrayWithTwo028
     * @tc.desc Verify with(0,-Infinity) on [10,20,30] clamps value to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const w = arr.with(0, -Number.POSITIVE_INFINITY);
      expect(w.length).assertEqual(3);
      expect(w[0]).assertEqual(0);
      expect(w[1]).assertEqual(20);
      expect(w[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_2900
     * @tc.name testUint8ClampedArrayWithTwo029
     * @tc.desc Verify with(0,NaN) on [10,20,30] clamps value to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const w = arr.with(0, Number.NaN);
      expect(w.length).assertEqual(3);
      expect(w[0]).assertEqual(0);
      expect(w[1]).assertEqual(20);
      expect(w[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_3000
     * @tc.name testUint8ClampedArrayWithTwo030
     * @tc.desc Verify with(0,1e9) on [10,20,30] clamps value to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const w = arr.with(0, 1e9);
      expect(w.length).assertEqual(3);
      expect(w[0]).assertEqual(255);
      expect(w[1]).assertEqual(20);
      expect(w[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_3100
     * @tc.name testUint8ClampedArrayWithTwo031
     * @tc.desc Verify with(0,-1e9) on [10,20,30] clamps value to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const w = arr.with(0, -1e9);
      expect(w.length).assertEqual(3);
      expect(w[0]).assertEqual(0);
      expect(w[1]).assertEqual(20);
      expect(w[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_3200
     * @tc.name testUint8ClampedArrayWithTwo032
     * @tc.desc Verify with(0,0o377) on [10,20,30] value 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const w = arr.with(0, 0o377);
      expect(w.length).assertEqual(3);
      expect(w[0]).assertEqual(255);
      expect(w[1]).assertEqual(20);
      expect(w[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_3300
     * @tc.name testUint8ClampedArrayWithTwo033
     * @tc.desc Verify with(0,0b11111111) on [10,20,30] value 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const w = arr.with(0, 0b11111111);
      expect(w.length).assertEqual(3);
      expect(w[0]).assertEqual(255);
      expect(w[1]).assertEqual(20);
      expect(w[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_3400
     * @tc.name testUint8ClampedArrayWithTwo034
     * @tc.desc Verify with(0,-1) on [10,20,30] clamps value to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const w = arr.with(0, -1);
      expect(w.length).assertEqual(3);
      expect(w[0]).assertEqual(0);
      expect(w[1]).assertEqual(20);
      expect(w[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_3500
     * @tc.name testUint8ClampedArrayWithTwo035
     * @tc.desc Verify with(0,256) on [10,20,30] clamps value to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const w = arr.with(0, 256);
      expect(w.length).assertEqual(3);
      expect(w[0]).assertEqual(255);
      expect(w[1]).assertEqual(20);
      expect(w[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_3600
     * @tc.name testUint8ClampedArrayWithTwo036
     * @tc.desc Verify with(1,88) on [99,2,3] after arr.set(0,99) returns [99,88,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.set(0, 99);
      const w = arr.with(1, 88);
      expect(w.length).assertEqual(3);
      expect(w[0]).assertEqual(99);
      expect(w[1]).assertEqual(88);
      expect(w[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_3700
     * @tc.name testUint8ClampedArrayWithTwo037
     * @tc.desc Verify with(0,99) on [7,7,7,7] after fill(7) returns [99,7,7,7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.fill(7);
      const w = arr.with(0, 99);
      expect(w.length).assertEqual(4);
      expect(w[0]).assertEqual(99);
      expect(w[1]).assertEqual(7);
      expect(w[2]).assertEqual(7);
      expect(w[3]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_3800
     * @tc.name testUint8ClampedArrayWithTwo038
     * @tc.desc Verify with(0,99) on reversed [10,20,30] returns [99,20,10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr.reverse();
      const w = arr.with(0, 99);
      expect(w.length).assertEqual(3);
      expect(w[0]).assertEqual(99);
      expect(w[1]).assertEqual(20);
      expect(w[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_3900
     * @tc.name testUint8ClampedArrayWithTwo039
     * @tc.desc Verify with(0,99) on sorted [3,1,2] returns [99,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      arr.sort();
      const w = arr.with(0, 99);
      expect(w.length).assertEqual(3);
      expect(w[0]).assertEqual(99);
      expect(w[1]).assertEqual(2);
      expect(w[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_4000
     * @tc.name testUint8ClampedArrayWithTwo040
     * @tc.desc Verify with(0,99) on Uint8ClampedArray.of(1,2,3) returns [99,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(1, 2, 3);
      const w = arr.with(0, 99);
      expect(w.length).assertEqual(3);
      expect(w[0]).assertEqual(99);
      expect(w[1]).assertEqual(2);
      expect(w[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_4100
     * @tc.name testUint8ClampedArrayWithTwo041
     * @tc.desc Verify with(1,88) on Uint8ClampedArray.from([1,2,3]) returns [1,88,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const arr = Uint8ClampedArray.from(src);
      const w = arr.with(1, 88);
      expect(w.length).assertEqual(3);
      expect(w[0]).assertEqual(1);
      expect(w[1]).assertEqual(88);
      expect(w[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_4200
     * @tc.name testUint8ClampedArrayWithTwo042
     * @tc.desc Verify with(0,99) on byteOffset=2 view result.byteOffset equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const parent = new Uint8ClampedArray(buf, 2, 4);
      parent[0] = 10;
      parent[1] = 20;
      const w = parent.with(0, 99);
      expect(w.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_4300
     * @tc.name testUint8ClampedArrayWithTwo043
     * @tc.desc Verify with(0,99) and with(2,88) on [1,2,3,4] produce independent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const w1 = arr.with(0, 99);
      const w2 = arr.with(2, 88);
      expect(w1.length).assertEqual(4);
      expect(w2.length).assertEqual(4);
      expect(w1[0]).assertEqual(99);
      expect(w1[1]).assertEqual(2);
      expect(w1[2]).assertEqual(3);
      expect(w1[3]).assertEqual(4);
      expect(w2[0]).assertEqual(1);
      expect(w2[1]).assertEqual(2);
      expect(w2[2]).assertEqual(88);
      expect(w2[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_4400
     * @tc.name testUint8ClampedArrayWithTwo044
     * @tc.desc Verify with(4,99) on [1,2,3,4,5] returns [1,2,3,4,99]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const w = arr.with(4, 99);
      expect(w.length).assertEqual(5);
      expect(w[0]).assertEqual(1);
      expect(w[1]).assertEqual(2);
      expect(w[2]).assertEqual(3);
      expect(w[3]).assertEqual(4);
      expect(w[4]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_4500
     * @tc.name testUint8ClampedArrayWithTwo045
     * @tc.desc Verify with(0,99) on [1] returns [99] length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const w = arr.with(0, 99);
      expect(w.length).assertEqual(1);
      expect(w[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_4600
     * @tc.name testUint8ClampedArrayWithTwo046
     * @tc.desc Verify with(0,50).map(x*2) on [100,20,30] returns [100,40,60]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 20, 30]);
      const w = arr.with(0, 50);
      const m = w.map((x: number): number => { return x * 2; });
      expect(m.length).assertEqual(3);
      expect(m[0]).assertEqual(100);
      expect(m[1]).assertEqual(40);
      expect(m[2]).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_4700
     * @tc.name testUint8ClampedArrayWithTwo047
     * @tc.desc Verify with(1,50).filter(x>40) on [10,200,30] returns [50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 200, 30]);
      const w = arr.with(1, 50);
      const f = w.filter((x: number): boolean => { return x > 40; });
      expect(f.length).assertEqual(1);
      expect(f[0]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_4800
     * @tc.name testUint8ClampedArrayWithTwo048
     * @tc.desc Verify with(0,99).subarray(0,2) on [10,20,30,40] returns [99,20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const w = arr.with(0, 99);
      const sub = w.subarray(0, 2);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(99);
      expect(sub[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_4900
     * @tc.name testUint8ClampedArrayWithTwo049
     * @tc.desc Verify with(0,99).toReversed() on [1,2,3] returns [3,2,99]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const w = arr.with(0, 99);
      const r = w.toReversed();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(3);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_5000
     * @tc.name testUint8ClampedArrayWithTwo050
     * @tc.desc Verify with(0,99).toSorted() on [3,1,2] returns [1,2,99]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const w = arr.with(0, 99);
      const s = w.toSorted();
      expect(s.length).assertEqual(3);
      expect(s[0]).assertEqual(1);
      expect(s[1]).assertEqual(2);
      expect(s[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_5100
     * @tc.name testUint8ClampedArrayWithTwo051
     * @tc.desc Verify with(0,99).slice(0,2) on [1,2,3,4] returns [99,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const w = arr.with(0, 99);
      const s = w.slice(0, 2);
      expect(s.length).assertEqual(2);
      expect(s[0]).assertEqual(99);
      expect(s[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_5200
     * @tc.name testUint8ClampedArrayWithTwo052
     * @tc.desc Verify with(0,99) on [1,2,3] toString result length 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const w = arr.with(0, 99);
      const r: string = w.toString();
      expect(r.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_5300
     * @tc.name testUint8ClampedArrayWithTwo053
     * @tc.desc Verify with(0,99) on [1,2,3] result.BYTES_PER_ELEMENT equals source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const w = arr.with(0, 99);
      expect(w.BYTES_PER_ELEMENT).assertEqual(arr.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_5400
     * @tc.name testUint8ClampedArrayWithTwo054
     * @tc.desc Verify with(2,99) on [1,2,3,4,5] result.length equals source.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const w = arr.with(2, 99);
      expect(w.length).assertEqual(arr.length);
      expect(w[0]).assertEqual(1);
      expect(w[1]).assertEqual(2);
      expect(w[2]).assertEqual(99);
      expect(w[3]).assertEqual(4);
      expect(w[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_5500
     * @tc.name testUint8ClampedArrayWithTwo055
     * @tc.desc Verify with(2,99) on [1,2,3,4,5] result.byteLength equals source.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const w = arr.with(2, 99);
      expect(w.byteLength).assertEqual(arr.byteLength);
      expect(w[0]).assertEqual(1);
      expect(w[1]).assertEqual(2);
      expect(w[2]).assertEqual(99);
      expect(w[3]).assertEqual(4);
      expect(w[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_5600
     * @tc.name testUint8ClampedArrayWithTwo056
     * @tc.desc Verify with(0,99) on [10,20,30] original elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr.with(0, 99);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_5700
     * @tc.name testUint8ClampedArrayWithTwo057
     * @tc.desc Verify with(0,99) on [10,20,30] original byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const before: int = arr.byteOffset;
      arr.with(0, 99);
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_5800
     * @tc.name testUint8ClampedArrayWithTwo058
     * @tc.desc Verify with(0,99) on [10,20,30] result.buffer differs from arr.buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const w = arr.with(0, 99);
      expect(w.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_5900
     * @tc.name testUint8ClampedArrayWithTwo059
     * @tc.desc Verify with index INT_MAX throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.with(2147483647, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_6000
     * @tc.name testUint8ClampedArrayWithTwo060
     * @tc.desc Verify with index length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.with(3, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_6100
     * @tc.name testUint8ClampedArrayWithTwo061
     * @tc.desc Verify with index -2 replaces second-to-last element [1,2,3]->[1,99,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.with(-2, 99);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(99);
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_6200
     * @tc.name testUint8ClampedArrayWithTwo062
     * @tc.desc Verify with index length+1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.with(4, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_TWO_6300
     * @tc.name testUint8ClampedArrayWithTwo063
     * @tc.desc Verify subarray(1,5).subarray(1,3).with(0,99) result independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50, 60]);
      const sub1 = arr.subarray(1, 5);
      const sub2 = sub1.subarray(1, 3);
      const w = sub2.with(0, 99);
      expect(w.length).assertEqual(2);
      expect(w[0]).assertEqual(99);
      expect(w[1]).assertEqual(40);
      expect(sub2[0]).assertEqual(30);
    });
  });
}
