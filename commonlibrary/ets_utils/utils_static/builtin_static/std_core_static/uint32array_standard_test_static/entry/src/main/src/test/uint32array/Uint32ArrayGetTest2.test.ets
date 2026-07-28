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

export default function uint32ArrayGetTest2(): void {
  describe('Uint32ArrayGetTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_0100
     * @tc.name testUint32ArrayGetPartTwo001
     * @tc.desc Verify $_get $_set -1 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values.$_set(0, -1);
      expect(values.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_0200
     * @tc.name testUint32ArrayGetPartTwo002
     * @tc.desc Verify $_get $_set 4294967296 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values.$_set(0, 4294967296);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_0300
     * @tc.name testUint32ArrayGetPartTwo003
     * @tc.desc Verify $_get $_set 3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values.$_set(0, 3.14);
      expect(values.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_0400
     * @tc.name testUint32ArrayGetPartTwo004
     * @tc.desc Verify $_get $_set NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values.$_set(0, Number.NaN);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_0500
     * @tc.name testUint32ArrayGetPartTwo005
     * @tc.desc Verify $_get $_set Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values.$_set(0, Number.POSITIVE_INFINITY);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_0600
     * @tc.name testUint32ArrayGetPartTwo006
     * @tc.desc Verify $_get $_set -Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values.$_set(0, -Number.POSITIVE_INFINITY);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_0700
     * @tc.name testUint32ArrayGetPartTwo007
     * @tc.desc Verify $_get byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      const v: byte = 10;
      values.$_set(0, v);
      expect(values.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_0800
     * @tc.name testUint32ArrayGetPartTwo008
     * @tc.desc Verify $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(65535);
      values.$_set(65534, 4294967295);
      expect(values.$_get(65534)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_0900
     * @tc.name testUint32ArrayGetPartTwo009
     * @tc.desc Verify $_get sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(30, 10, 20);
      values.sort();
      expect(values.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_1000
     * @tc.name testUint32ArrayGetPartTwo010
     * @tc.desc Verify $_get reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      values.reverse();
      expect(values.$_get(0)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_1100
     * @tc.name testUint32ArrayGetPartTwo011
     * @tc.desc Verify $_get fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      values.fill(4294967295);
      expect(values.$_get(1)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_1200
     * @tc.name testUint32ArrayGetPartTwo012
     * @tc.desc Verify $_get copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40);
      values.copyWithin(0, 2, 4);
      expect(values.$_get(0)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_1300
     * @tc.name testUint32ArrayGetPartTwo013
     * @tc.desc Verify $_get with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20, 30);
      const replaced = src.with(1, 99);
      expect(replaced.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_1400
     * @tc.name testUint32ArrayGetPartTwo014
     * @tc.desc Verify $_get toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20, 30);
      const rev = src.toReversed();
      expect(rev.$_get(0)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_1500
     * @tc.name testUint32ArrayGetPartTwo015
     * @tc.desc Verify $_get toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(30, 10, 20);
      const sorted = src.toSorted();
      expect(sorted.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_1600
     * @tc.name testUint32ArrayGetPartTwo016
     * @tc.desc Verify $_get map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const mapped = src.map((x: number): number => { return x + 1; });
      expect(mapped.$_get(2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_1700
     * @tc.name testUint32ArrayGetPartTwo017
     * @tc.desc Verify $_get filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2);
      const filtered = src.filter((v: number): boolean => { return v > 1; });
      expect(filtered.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_1800
     * @tc.name testUint32ArrayGetPartTwo018
     * @tc.desc Verify $_get length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const before = values.length;
      values.$_get(0);
      expect(values.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_1900
     * @tc.name testUint32ArrayGetPartTwo019
     * @tc.desc Verify $_get byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const before = values.byteLength;
      values.$_get(1);
      expect(values.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_2000
     * @tc.name testUint32ArrayGetPartTwo020
     * @tc.desc Verify $_get byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const values = new Uint32Array(buf, 4, 2);
      const before = values.byteOffset;
      values.$_get(0);
      expect(values.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_2100
     * @tc.name testUint32ArrayGetPartTwo021
     * @tc.desc Verify $_get BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      values.$_get(0);
      expect(values.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_2200
     * @tc.name testUint32ArrayGetPartTwo022
     * @tc.desc Verify $_get length 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(65535);
      values.$_get(0);
      expect(values.length).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_2300
     * @tc.name testUint32ArrayGetPartTwo023
     * @tc.desc Verify $_get byteLength length BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      values.$_get(0);
      expect(values.byteLength).assertEqual(values.length * values.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_2400
     * @tc.name testUint32ArrayGetPartTwo024
     * @tc.desc Verify $_get byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const before = values.byteLength;
      values.$_get(0);
      values.$_get(1);
      values.$_get(2);
      expect(values.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_2500
     * @tc.name testUint32ArrayGetPartTwo025
     * @tc.desc Verify $_get byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const values = new Uint32Array(buf, 4, 3);
      const before = values.byteOffset;
      values.$_get(0);
      values.$_get(2);
      expect(values.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_2600
     * @tc.name testUint32ArrayGetPartTwo026
     * @tc.desc Verify $_get join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const before: string = values.join(',');
      values.$_get(1);
      expect(values.join(',')).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_2700
     * @tc.name testUint32ArrayGetPartTwo027
     * @tc.desc Verify $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const first = values.$_get(2);
      values.$_get(0);
      expect(values.$_get(2)).assertEqual(first);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_2800
     * @tc.name testUint32ArrayGetPartTwo028
     * @tc.desc Verify $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40);
      const before: string = values.join(',');
      for (let i = 0; i < values.length; i++) {
        values.$_get(i);
      }
      expect(values.join(',')).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_2900
     * @tc.name testUint32ArrayGetPartTwo029
     * @tc.desc Verify $_get buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const before = values.buffer.byteLength;
      values.$_get(0);
      expect(values.buffer.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_3000
     * @tc.name testUint32ArrayGetPartTwo030
     * @tc.desc Verify $_get buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const view = new Uint32Array(values.buffer, 0, 2);
      const before = view.$_get(0);
      values.$_get(0);
      expect(view.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_3100
     * @tc.name testUint32ArrayGetPartTwo031
     * @tc.desc Verify $_get $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      values.$_get(0);
      values.$_set(1, 4294967295);
      expect(values.$_get(1)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_3200
     * @tc.name testUint32ArrayGetPartTwo032
     * @tc.desc Verify $_get toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(30, 10, 20);
      const before: string = values.join(',');
      values.toSorted().$_get(0);
      expect(values.join(',')).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_3300
     * @tc.name testUint32ArrayGetPartTwo033
     * @tc.desc Verify $_get(0) subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Uint32Array.of(10, 20, 30);
      const view = parent.subarray(1);
      expect(view.$_get(0)).assertEqual(parent.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_3400
     * @tc.name testUint32ArrayGetPartTwo034
     * @tc.desc Verify $_get(0) subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Uint32Array.of(10, 20, 30);
      const view = parent.subarray(1);
      parent.$_set(1, 99);
      expect(view.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_3500
     * @tc.name testUint32ArrayGetPartTwo035
     * @tc.desc Verify $_get subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Uint32Array.of(10, 20, 30);
      const view = parent.subarray(1);
      view.$_set(0, 88);
      expect(parent.$_get(1)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_3600
     * @tc.name testUint32ArrayGetPartTwo036
     * @tc.desc Verify $_get(0) slice buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Uint32Array.of(10, 20, 30);
      const copy = parent.slice(0, 2);
      parent.$_set(0, 99);
      expect(copy.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_3700
     * @tc.name testUint32ArrayGetPartTwo037
     * @tc.desc Verify $_get(0) byteOffset 4 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const full = new Uint32Array(buf, 0, 4);
      full.$_set(1, 77);
      const view = new Uint32Array(buf, 4, 1);
      expect(view.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_3800
     * @tc.name testUint32ArrayGetPartTwo038
     * @tc.desc Verify $_get(0) byteOffset 8 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const full = new Uint32Array(buf, 0, 4);
      full.$_set(2, 33);
      const view = new Uint32Array(buf, 8, 1);
      expect(view.$_get(0)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_3900
     * @tc.name testUint32ArrayGetPartTwo039
     * @tc.desc Verify $_get subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Uint32Array.of(10, 20, 30, 40);
      const mid = parent.subarray(1, 4);
      const inner = mid.subarray(1, 3);
      parent.$_set(2, 55);
      expect(inner.$_get(0)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_4000
     * @tc.name testUint32ArrayGetPartTwo040
     * @tc.desc Verify $_get(0) byteOffset full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const full = new Uint32Array(buf, 0, 4);
      full.$_set(2, 66);
      const view = new Uint32Array(buf, 8, 1);
      expect(view.$_get(0)).assertEqual(full.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_4100
     * @tc.name testUint32ArrayGetPartTwo041
     * @tc.desc Verify $_get slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Uint32Array.of(10, 20, 30);
      const copy = parent.slice(1, 3);
      parent.$_set(1, 99);
      expect(copy.$_get(0)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_4200
     * @tc.name testUint32ArrayGetPartTwo042
     * @tc.desc Verify $_get buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const a = new Uint32Array(buf, 0, 2);
      const b = new Uint32Array(buf, 0, 2);
      b.$_set(0, 50);
      expect(a.$_get(0)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_4300
     * @tc.name testUint32ArrayGetPartTwo043
     * @tc.desc Verify $_get end subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Uint32Array.of(10, 20, 30, 40, 50);
      const view = parent.subarray(1, 4);
      expect(view.$_get(2)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_4400
     * @tc.name testUint32ArrayGetPartTwo044
     * @tc.desc Verify $_get(0) subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Uint32Array.of(10, 20, 30);
      const view = parent.subarray(0);
      expect(view.$_get(0)).assertEqual(parent.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_4500
     * @tc.name testUint32ArrayGetPartTwo045
     * @tc.desc Verify $_get subarray undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Uint32Array.of(10, 20, 30);
      const view = parent.subarray(5, 7);
      try {
        view.$_get(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_4600
     * @tc.name testUint32ArrayGetPartTwo046
     * @tc.desc Verify with returns new array original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20, 30);
      const replaced = src.with(1, 99);
      expect(replaced.$_get(1)).assertEqual(99);
      expect(src.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_4700
     * @tc.name testUint32ArrayGetPartTwo047
     * @tc.desc Verify with normal index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20, 30);
      const replaced = src.with(2, 99);
      expect(replaced.$_get(2)).assertEqual(99);
      expect(src.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_4800
     * @tc.name testUint32ArrayGetPartTwo048
     * @tc.desc Verify with out-of-bounds index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20, 30);
      try {
        src.with(5, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_4900
     * @tc.name testUint32ArrayGetPartTwo049
     * @tc.desc Verify with MAX value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const replaced = src.with(0, 4294967295);
      expect(replaced.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_5000
     * @tc.name testUint32ArrayGetPartTwo050
     * @tc.desc Verify map basic transformation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const mapped = src.map((v: number): number => v * 10);
      expect(mapped.$_get(0)).assertEqual(10);
      expect(mapped.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_5100
     * @tc.name testUint32ArrayGetPartTwo051
     * @tc.desc Verify map on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(0);
      const mapped = src.map((v: number): number => v * 2);
      expect(mapped.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_5200
     * @tc.name testUint32ArrayGetPartTwo052
     * @tc.desc Verify map callback receives value and index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20, 30);
      const mapped = src.map((v: number, i: int, a: Uint32Array): number => v + i);
      expect(mapped.$_get(0)).assertEqual(10);
      expect(mapped.$_get(1)).assertEqual(21);
      expect(mapped.$_get(2)).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_5300
     * @tc.name testUint32ArrayGetPartTwo053
     * @tc.desc Verify map with MAX value overflow wrap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1);
      const mapped = src.map((v: number): number => 4294967296);
      expect(mapped.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_5400
     * @tc.name testUint32ArrayGetPartTwo054
     * @tc.desc Verify map original array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const before = src.$_get(1);
      src.map((v: number): number => v * 100);
      expect(src.$_get(1)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_5500
     * @tc.name testUint32ArrayGetPartTwo055
     * @tc.desc Verify $_get with large positive index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      try {
        values.$_get(2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_5600
     * @tc.name testUint32ArrayGetPartTwo056
     * @tc.desc Verify $_get with large negative index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      try {
        values.$_get(-2147483648);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTTWO_5700
     * @tc.name testUint32ArrayGetPartTwo057
     * @tc.desc Verify $_get with index equal to length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      try {
        values.$_get(3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

  });
}
