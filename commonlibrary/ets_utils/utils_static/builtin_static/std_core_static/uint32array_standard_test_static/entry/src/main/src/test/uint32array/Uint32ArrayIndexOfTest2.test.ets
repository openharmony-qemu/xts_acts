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

export default function uint32ArrayIndexOfTest2(): void {
  describe('Uint32ArrayIndexOfTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTTWO_0100
     * @tc.name testUint32ArrayIndexOfPartTwo001
     * @tc.desc Verify indexOf byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(new ArrayBuffer(16), 4, 3);
      const before = values.byteOffset;
      values.indexOf(20);
      expect(values.byteOffset).assertEqual(before);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTTWO_0200
     * @tc.name testUint32ArrayIndexOfPartTwo002
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(0);
      values.indexOf(10);
      expect(values.length).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTTWO_0300
     * @tc.name testUint32ArrayIndexOfPartTwo003
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4, 5);
      values.indexOf(3);
      expect(values[0]).assertEqual(1);
      expect(values[4]).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTTWO_0400
     * @tc.name testUint32ArrayIndexOfPartTwo004
     * @tc.desc Verify subarray indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40);
      const view = values.subarray(1, 3);
      expect(view.indexOf(30)).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTTWO_0500
     * @tc.name testUint32ArrayIndexOfPartTwo005
     * @tc.desc Verify subarray indexOf -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40);
      const view = values.subarray(1, 3);
      expect(view.indexOf(10)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTTWO_0600
     * @tc.name testUint32ArrayIndexOfPartTwo006
     * @tc.desc Verify subarray byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40);
      const view = values.subarray(2, 4);
      expect(view.byteOffset).assertEqual(values.byteOffset + 8);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTTWO_0700
     * @tc.name testUint32ArrayIndexOfPartTwo007
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40);
      const view = values.subarray(1, 3);
      expect(view.buffer).assertEqual(values.buffer);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTTWO_0800
     * @tc.name testUint32ArrayIndexOfPartTwo008
     * @tc.desc Verify ArrayBuffer indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const values = new Uint32Array(buf, 0, 4);
      values[0] = 10;
      values[1] = 20;
      expect(values.indexOf(20)).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTTWO_0900
     * @tc.name testUint32ArrayIndexOfPartTwo009
     * @tc.desc Verify ArrayBuffer indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const values = new Uint32Array(buf, 8, 4);
      values[0] = 10;
      values[1] = 20;
      expect(values.indexOf(20)).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTTWO_1000
     * @tc.name testUint32ArrayIndexOfPartTwo010
     * @tc.desc Verify byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const values = new Uint32Array(buf, 8, 4);
      expect(values.byteOffset).assertEqual(8);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTTWO_1100
     * @tc.name testUint32ArrayIndexOfPartTwo011
     * @tc.desc Verify byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const values = new Uint32Array(buf, 8, 4);
      expect(values.byteLength).assertEqual(16);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTTWO_1200
     * @tc.name testUint32ArrayIndexOfPartTwo012
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const values = new Uint32Array(buf, 8, 4);
      expect(values.length).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTTWO_1300
     * @tc.name testUint32ArrayIndexOfPartTwo013
     * @tc.desc Verify indexOf byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const values = new Uint32Array(buf, 8, 4);
      values[0] = 10;
      const before = values.byteOffset;
      values.indexOf(10);
      expect(values.byteOffset).assertEqual(before);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTTWO_1400
     * @tc.name testUint32ArrayIndexOfPartTwo014
     * @tc.desc Verify indexOf byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const values = new Uint32Array(buf, 8, 4);
      values[0] = 10;
      const before = values.byteLength;
      values.indexOf(10);
      expect(values.byteLength).assertEqual(before);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTTWO_1500
     * @tc.name testUint32ArrayIndexOfPartTwo015
     * @tc.desc Verify indexOf lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(5, 6, 5, 6);
      expect(values.indexOf(5)).assertEqual(0);
      expect(values.lastIndexOf(5)).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTTWO_1600
     * @tc.name testUint32ArrayIndexOfPartTwo016
     * @tc.desc Verify indexOf 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0, 1, 2);
      const idx = values.indexOf(0);
      expect(idx + 1).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTTWO_1700
     * @tc.name testUint32ArrayIndexOfPartTwo017
     * @tc.desc Verify 0o17 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0o17, 0o20, 0o21);
      expect(values.indexOf(0o17)).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTTWO_1800
     * @tc.name testUint32ArrayIndexOfPartTwo018
     * @tc.desc Verify 0b1010 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0b1010, 0b0011, 0b0100);
      expect(values.indexOf(0b1010)).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTTWO_1900
     * @tc.name testUint32ArrayIndexOfPartTwo019
     * @tc.desc Verify 1e3 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1e3, 2e3, 3e3);
      expect(values.indexOf(1e3)).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTTWO_2000
     * @tc.name testUint32ArrayIndexOfPartTwo020
     * @tc.desc Verify -1 uint32 -1 -1 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      expect(values.indexOf(-1)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTTWO_2100
     * @tc.name testUint32ArrayIndexOfPartTwo021
     * @tc.desc Verify searchElement=-1 not found with strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 4294967295, 3);
      expect(values.indexOf(-1)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTTWO_2200
     * @tc.name testUint32ArrayIndexOfPartTwo022
     * @tc.desc Verify 4294967295 matches stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 4294967295, 3);
      expect(values.indexOf(4294967295)).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTTWO_2300
     * @tc.name testUint32ArrayIndexOfPartTwo023
     * @tc.desc Verify 4294967296 not found -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 0, 3);
      expect(values.indexOf(4294967296)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTTWO_2400
     * @tc.name testUint32ArrayIndexOfPartTwo024
     * @tc.desc Verify Number.NaN uint32 -1 Number.NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      expect(values.indexOf(Number.NaN)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTTWO_2500
     * @tc.name testUint32ArrayIndexOfPartTwo025
     * @tc.desc Verify Number.POSITIVE_INFINITY uint32 -1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      expect(values.indexOf(Number.POSITIVE_INFINITY)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTTWO_2600
     * @tc.name testUint32ArrayIndexOfPartTwo026
     * @tc.desc Verify Number.NEGATIVE_INFINITY not found -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0, 1, 2);
      expect(values.indexOf(Number.NEGATIVE_INFINITY)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTTWO_2700
     * @tc.name testUint32ArrayIndexOfPartTwo027
     * @tc.desc Verify 3.14 not found -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 3, 5);
      expect(values.indexOf(3.14)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTTWO_2800
     * @tc.name testUint32ArrayIndexOfPartTwo028
     * @tc.desc Verify 2.99 not found -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(2, 4, 6);
      expect(values.indexOf(2.99)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTTWO_2900
     * @tc.name testUint32ArrayIndexOfPartTwo029
     * @tc.desc Verify 9007199254740991 not found -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 4294967295, 3);
      expect(values.indexOf(9007199254740991)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTTWO_3000
     * @tc.name testUint32ArrayIndexOfPartTwo030
     * @tc.desc Verify 4294967294 uint32 MAX-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 4294967294, 3);
      expect(values.indexOf(4294967294)).assertEqual(1);
    });



  });
}
