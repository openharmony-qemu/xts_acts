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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint32ArrayFillTest2(): void {
  describe('Uint32ArrayFillTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_0100
     * @tc.name testUint32ArrayFillPartTwo001
     * @tc.desc Verify fill(value) start=0, end=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(4);
      const result = src.fill(7);
      expect(result[0]).assertEqual(7);
      expect(result[3]).assertEqual(7);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_0200
     * @tc.name testUint32ArrayFillPartTwo002
     * @tc.desc Verify fill(value, start) start end length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 0, 0, 0);
      const result = src.fill(9, 1);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(9);
      expect(result[3]).assertEqual(9);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_0300
     * @tc.name testUint32ArrayFillPartTwo003
     * @tc.desc Verify fill(value, start, end)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 0, 0, 0, 0);
      const result = src.fill(5, 1, 3);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(5);
      expect(result[2]).assertEqual(5);
      expect(result[3]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_0400
     * @tc.name testUint32ArrayFillPartTwo004
     * @tc.desc Verify fill(value, 0, 0) no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const result = src.fill(9, 0, 0);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_0500
     * @tc.name testUint32ArrayFillPartTwo005
     * @tc.desc Verify fill(value, 0, length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(3);
      const result = src.fill(4, 0, 3);
      expect(result[0]).assertEqual(4);
      expect(result[2]).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_0600
     * @tc.name testUint32ArrayFillPartTwo006
     * @tc.desc Verify fill length=0 no-op this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(0);
      const result = src.fill(7);
      expect(result.length).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_0700
     * @tc.name testUint32ArrayFillPartTwo007
     * @tc.desc Verify fill(42) on single-element array sets value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(1);
      const result = src.fill(42);
      expect(result[0]).assertEqual(42);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_0800
     * @tc.name testUint32ArrayFillPartTwo008
     * @tc.desc Verify fill(value, start) end length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 0, 0, 0, 0);
      const result = src.fill(3, 2);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(3);
      expect(result[4]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_0900
     * @tc.name testUint32ArrayFillPartTwo009
     * @tc.desc Verify value=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.fill(0);
      expect(result[0]).assertEqual(0);
      expect(result[3]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_1000
     * @tc.name testUint32ArrayFillPartTwo010
     * @tc.desc Verify value=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(3);
      const result = src.fill(1, 0, 2);
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_1100
     * @tc.name testUint32ArrayFillPartTwo011
     * @tc.desc Verify value=4294967295 uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(4);
      const result = src.fill(4294967295, 1, 3);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(4294967295);
      expect(result[3]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_1200
     * @tc.name testUint32ArrayFillPartTwo012
     * @tc.desc Verify value=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(4);
      const result = src.fill(-1, 0, 2);
      expect(result[0]).assertEqual(4294967295);
      expect(result[2]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_1300
     * @tc.name testUint32ArrayFillPartTwo013
     * @tc.desc Verify value=3.14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(4);
      const result = src.fill(3.14, 2, 4);
      expect(result[0]).assertEqual(0);
      expect(result[2]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_1400
     * @tc.name testUint32ArrayFillPartTwo014
     * @tc.desc Verify value=Number.NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(5);
      const result = src.fill(Number.NaN, 1, 4);
      expect(result[1]).assertEqual(0);
      expect(result[3]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_1500
     * @tc.name testUint32ArrayFillPartTwo015
     * @tc.desc Verify value=Number.POSITIVE_INFINITY 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(1);
      const result = src.fill(Number.POSITIVE_INFINITY);
      expect(result[0]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_1600
     * @tc.name testUint32ArrayFillPartTwo016
     * @tc.desc Verify value=Number.NEGATIVE_INFINITY 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(2);
      const result = src.fill(Number.NEGATIVE_INFINITY);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_1700
     * @tc.name testUint32ArrayFillPartTwo017
     * @tc.desc Verify value=0b101 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(2);
      const result = src.fill(0b101);
      expect(result[0]).assertEqual(5);
      expect(result[1]).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_1800
     * @tc.name testUint32ArrayFillPartTwo018
     * @tc.desc Verify value=0o17 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(2);
      const result = src.fill(0o17);
      expect(result[0]).assertEqual(15);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_1900
     * @tc.name testUint32ArrayFillPartTwo019
     * @tc.desc Verify value=1e3 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(2);
      const result = src.fill(1e3);
      expect(result[0]).assertEqual(1000);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_2000
     * @tc.name testUint32ArrayFillPartTwo020
     * @tc.desc Verify value=-100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(2);
      const result = src.fill(-100);
      expect(result[0]).assertEqual(4294967196);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_2100
     * @tc.name testUint32ArrayFillPartTwo021
     * @tc.desc Verify value=9007199254740991
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 0, 0, 0);
      const result = src.fill(9007199254740991, 1, 3);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_2200
     * @tc.name testUint32ArrayFillPartTwo022
     * @tc.desc Verify fill this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(3);
      const result = src.fill(5);
      expect(result).assertEqual(src);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_2300
     * @tc.name testUint32ArrayFillPartTwo023
     * @tc.desc Verify fill(5) result length and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(3);
      const result = src.fill(5);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(5);
      expect(result[2]).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_2400
     * @tc.name testUint32ArrayFillPartTwo024
     * @tc.desc Verify fill(9) preserves length=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4, 5);
      const result = src.fill(9);
      expect(result.length).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_2500
     * @tc.name testUint32ArrayFillPartTwo025
     * @tc.desc Verify fill byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.fill(9);
      expect(result.byteLength).assertEqual(16);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_2600
     * @tc.name testUint32ArrayFillPartTwo026
     * @tc.desc Verify fill byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const src = new Uint32Array(buf, 4, 3);
      const result = src.fill(9);
      expect(result.byteOffset).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_2700
     * @tc.name testUint32ArrayFillPartTwo027
     * @tc.desc Verify fill(9, 2, 4) leaves indices 0-1 unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4, 5);
      const result = src.fill(9, 2, 4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_2800
     * @tc.name testUint32ArrayFillPartTwo028
     * @tc.desc Verify fill(9, 1, 3) leaves indices 3-4 unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20, 30, 40, 50);
      const result = src.fill(9, 1, 3);
      expect(result[3]).assertEqual(40);
      expect(result[4]).assertEqual(50);
    });


    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_2900
     * @tc.name testUint32ArrayFillPartTwo029
     * @tc.desc Verify fill no-op this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.fill(9, 5, 1);
      expect(result).assertEqual(src);
      expect(result[0]).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_3000
     * @tc.name testUint32ArrayFillPartTwo030
     * @tc.desc Verify fill fill().fill()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(4);
      const result = src.fill(3).fill(7, 1, 3);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(7);
      expect(result[3]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_3100
     * @tc.name testUint32ArrayFillPartTwo031
     * @tc.desc Verify fill fill().reverse() reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.fill(9, 0, 2).reverse();
      expect(result[0]).assertEqual(4);
      expect(result[2]).assertEqual(9);
      expect(result).assertEqual(src);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_3200
     * @tc.name testUint32ArrayFillPartTwo032
     * @tc.desc Verify fill subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const view = src.subarray(1, 3);
      src.fill(9, 1, 3);
      expect(view[0]).assertEqual(9);
      expect(view[1]).assertEqual(9);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_3300
     * @tc.name testUint32ArrayFillPartTwo033
     * @tc.desc Verify fill buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(3);
      const result = src.fill(5);
      expect(result.buffer).assertEqual(src.buffer);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_3400
     * @tc.name testUint32ArrayFillPartTwo034
     * @tc.desc Verify fill slice fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const copy = src.slice(0, 4);
      src.fill(9);
      expect(copy[0]).assertEqual(1);
      expect(copy[3]).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_3500
     * @tc.name testUint32ArrayFillPartTwo035
     * @tc.desc Verify fill(42) sets all elements to same value via cross-index comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(5);
      const result = src.fill(42);
      expect(result[0]).assertEqual(result[4]);
      expect(result[2]).assertEqual(42);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_3600
     * @tc.name testUint32ArrayFillPartTwo036
     * @tc.desc Verify + start>end no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4, 5);
      const result = src.fill(4294967296, 3, 0);
      expect(result[0]).assertEqual(1);
      expect(result[4]).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_3700
     * @tc.name testUint32ArrayFillPartTwo037
     * @tc.desc Verify + start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 0, 0, 0);
      const result = src.fill(-1, -2);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(4294967295);
      expect(result[3]).assertEqual(4294967295);
    });


    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_3800
     * @tc.name testUint32ArrayFillPartTwo038
     * @tc.desc Verify Number.POSITIVE_INFINITY + start==end no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.fill(Number.POSITIVE_INFINITY, 2, 2);
      expect(result[2]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_3900
     * @tc.name testUint32ArrayFillPartTwo039
     * @tc.desc Verify fill(3.14, -4, -1) truncates to 3, leaves index 3 unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 0, 0, 0);
      const result = src.fill(3.14, -4, -1);
      expect(result[0]).assertEqual(3);
      expect(result[3]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_4000
     * @tc.name testUint32ArrayFillPartTwo040
     * @tc.desc Verify + start length no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const result = src.fill(4294967296, 1000);
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_4100
     * @tc.name testUint32ArrayFillPartTwo041
     * @tc.desc Verify uint32 +
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 0, 0, 0, 0);
      const result = src.fill(4294967295, 2, 4);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(4294967295);
      expect(result[4]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_4200
     * @tc.name testUint32ArrayFillPartTwo042
     * @tc.desc Verify + start 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 0, 0);
      const result = src.fill(-1, -1000);
      expect(result[0]).assertEqual(4294967295);
      expect(result[2]).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_4300
     * @tc.name testUint32ArrayFillPartTwo043
     * @tc.desc Verify + 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4, 5);
      const result = src.fill(4294967296, 1, 4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(0);
      expect(result[4]).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_4400
     * @tc.name testUint32ArrayFillPartTwo044
     * @tc.desc Verify fill(-1, 1, 3) wraps to 4294967295, leaves index 0 and 3 unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 0, 0, 0, 0);
      const result = src.fill(-1, 1, 3);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(4294967295);
      expect(result[3]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_4500
     * @tc.name testUint32ArrayFillPartTwo045
     * @tc.desc Verify fill(2.99, 0, 3) truncates to 2, leaves index 3 unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 0, 0, 0, 0);
      const result = src.fill(2.99, 0, 3);
      expect(result[0]).assertEqual(2);
      expect(result[2]).assertEqual(2);
      expect(result[3]).assertEqual(0);
    });


    
    
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_4600
     * @tc.name testUint32ArrayFillPartTwo046
     * @tc.desc Verify fill(-2) 4294967294
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(3);
      const result = src.fill(-2);
      expect(result[0]).assertEqual(4294967294);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_4700
     * @tc.name testUint32ArrayFillPartTwo047
     * @tc.desc Verify fill(2147483648) int32 +1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(3);
      const result = src.fill(2147483648);
      expect(result[0]).assertEqual(2147483648);
      expect(result[2]).assertEqual(2147483648);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_4800
     * @tc.name testUint32ArrayFillPartTwo048
     * @tc.desc Verify fill(2147483647) int32 uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(3);
      const result = src.fill(2147483647);
      expect(result[0]).assertEqual(2147483647);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_4900
     * @tc.name testUint32ArrayFillPartTwo049
     * @tc.desc Verify fill(-2147483648) int32 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(3);
      const result = src.fill(-2147483648);
      expect(result[0]).assertEqual(2147483648);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_5000
     * @tc.name testUint32ArrayFillPartTwo050
     * @tc.desc Verify fill(3.14) 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(3);
      const result = src.fill(3.14);
      expect(result[0]).assertEqual(3);
      expect(result[2]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_5100
     * @tc.name testUint32ArrayFillPartTwo051
     * @tc.desc Verify fill(-3.14) 4294967293
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(3);
      const result = src.fill(-3.14);
      expect(result[0]).assertEqual(4294967293);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_5200
     * @tc.name testUint32ArrayFillPartTwo052
     * @tc.desc Verify fill(0.5) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(3);
      const result = src.fill(0.5);
      expect(result[0]).assertEqual(0);
    });


    
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_5300
     * @tc.name testUint32ArrayFillPartTwo053
     * @tc.desc Verify fill(Number.NaN) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(3);
      const result = src.fill(Number.NaN);
      expect(result[0]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });


    
    
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_5400
     * @tc.name testUint32ArrayFillPartTwo054
     * @tc.desc Verify fill(-9007199254740991) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(3);
      const result = src.fill(-9007199254740991);
      expect(result[0]).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_5500
     * @tc.name testUint32ArrayFillPartTwo055
     * @tc.desc Verify fill(1e10) 1410065408
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(3);
      const result = src.fill(1e10);
      expect(result[0]).assertEqual(1410065408);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_5600
     * @tc.name testUint32ArrayFillPartTwo056
     * @tc.desc Verify fill(-1e10) 2884901888
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(3);
      const result = src.fill(-1e10);
      expect(result[0]).assertEqual(2884901888);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTWO_5700
     * @tc.name testUint32ArrayFillPartTwo057
     * @tc.desc Verify fill(0b11111111111111111111111111111111) uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(3);
      const result = src.fill(0b11111111111111111111111111111111);
      expect(result[0]).assertEqual(4294967295);
    });


    
    
    
      });
}
