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

export default function uint32ArrayAtTest2(): void {
  describe('Uint32ArrayAtTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_0100
     * @tc.name testUint32ArrayAtPartTwo001
     * @tc.desc Verify at(0) uint32 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4294967295);
      expect(values.at(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_0200
     * @tc.name testUint32ArrayAtPartTwo002
     * @tc.desc Verify at(-1) uint32 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4294967295);
      expect(values.at(-1)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_0300
     * @tc.name testUint32ArrayAtPartTwo003
     * @tc.desc Verify at(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(0);
      expect(values.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_0400
     * @tc.name testUint32ArrayAtPartTwo004
     * @tc.desc Verify at(0) $_set 777
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = new Uint32Array(1);
      values.$_set(0, 777);
      expect(values.at(0)).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_0500
     * @tc.name testUint32ArrayAtPartTwo005
     * @tc.desc Verify at(0) int32 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(2147483647);
      expect(values.at(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_0600
     * @tc.name testUint32ArrayAtPartTwo006
     * @tc.desc Verify at(0) -2147483648 uint32 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(-2147483648);
      expect(values.at(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_0700
     * @tc.name testUint32ArrayAtPartTwo007
     * @tc.desc Verify at(1) [5,20,15] returns 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(5, 20, 15);
      expect(values.at(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_0800
     * @tc.name testUint32ArrayAtPartTwo008
     * @tc.desc Verify at(2) [0,5,10] 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(0, 5, 10);
      expect(values.at(2)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_0900
     * @tc.name testUint32ArrayAtPartTwo009
     * @tc.desc Verify at(-1) [0,4294967295,2147483647] 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(0, 4294967295, 2147483647);
      expect(values.at(-1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_1000
     * @tc.name testUint32ArrayAtPartTwo010
     * @tc.desc Verify at(0) $_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      expect(values.at(0)).assertEqual(values.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_1100
     * @tc.name testUint32ArrayAtPartTwo011
     * @tc.desc Verify at(0) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      const before: int = values.length;
      values.at(0);
      expect(values.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_1200
     * @tc.name testUint32ArrayAtPartTwo012
     * @tc.desc Verify at(-1) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      const before: int = values.length;
      values.at(-1);
      expect(values.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_1300
     * @tc.name testUint32ArrayAtPartTwo013
     * @tc.desc Verify at( ) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      const before: int = values.length;
      values.at(99);
      expect(values.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_1400
     * @tc.name testUint32ArrayAtPartTwo014
     * @tc.desc Verify at(0) byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      const before: int = values.byteLength;
      values.at(0);
      expect(values.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_1500
     * @tc.name testUint32ArrayAtPartTwo015
     * @tc.desc Verify at(0) byteOffset 0 of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      values.at(0);
      expect(values.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_1600
     * @tc.name testUint32ArrayAtPartTwo016
     * @tc.desc Verify at() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      values.at(0);
      values.at(1);
      values.at(-1);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_1700
     * @tc.name testUint32ArrayAtPartTwo017
     * @tc.desc Verify at() byteLength * 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      values.at(2);
      expect(values.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_1800
     * @tc.name testUint32ArrayAtPartTwo018
     * @tc.desc Verify at() 100 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      for (let i = 0; i < 100; i++) {
        values.at(i % 3);
      }
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_1900
     * @tc.name testUint32ArrayAtPartTwo019
     * @tc.desc Verify at() on subarray length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const view: Uint32Array = values.subarray(1, 3);
      const before: int = view.length;
      view.at(0);
      expect(view.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_2000
     * @tc.name testUint32ArrayAtPartTwo020
     * @tc.desc Verify at() on byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const view: Uint32Array = values.subarray(1, 3);
      const before: int = view.byteOffset;
      view.at(0);
      expect(view.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_2100
     * @tc.name testUint32ArrayAtPartTwo021
     * @tc.desc Verify at(0) 0 $_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      values.at(0);
      expect(values.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_2200
     * @tc.name testUint32ArrayAtPartTwo022
     * @tc.desc Verify at(1) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      values.at(1);
      expect(values.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_2300
     * @tc.name testUint32ArrayAtPartTwo023
     * @tc.desc Verify at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      values.at(-1);
      expect(values.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_2400
     * @tc.name testUint32ArrayAtPartTwo024
     * @tc.desc Verify at( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      values.at(99);
      expect(values.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_2500
     * @tc.name testUint32ArrayAtPartTwo025
     * @tc.desc Verify at() 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      values.at(0);
      values.at(-1);
      expect(values.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_2600
     * @tc.name testUint32ArrayAtPartTwo026
     * @tc.desc Verify at() on buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const view: Uint32Array = values.subarray(1, 3);
      view.at(0);
      expect(values.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_2700
     * @tc.name testUint32ArrayAtPartTwo027
     * @tc.desc Verify at() ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      const result = values.at(0);
      expect(result).assertEqual(10);
      expect(values[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_2800
     * @tc.name testUint32ArrayAtPartTwo028
     * @tc.desc Verify at() buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      const buf: ArrayBuffer = values.buffer;
      const before: int = buf.byteLength;
      values.at(0);
      expect(buf.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_2900
     * @tc.name testUint32ArrayAtPartTwo029
     * @tc.desc Verify at() on [10,20,30] $_get(0) 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      const r = values.at(0);
      expect(r).assertEqual(10);
      expect(values.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_3000
     * @tc.name testUint32ArrayAtPartTwo030
     * @tc.desc Verify at() on [10,20,30] $_get(2) 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      const r = values.at(2);
      expect(r).assertEqual(30);
      expect(values.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_3100
     * @tc.name testUint32ArrayAtPartTwo031
     * @tc.desc Verify at() subarray()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      values.at(0);
      const view: Uint32Array = values.subarray(1, 3);
      expect(view.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_3200
     * @tc.name testUint32ArrayAtPartTwo032
     * @tc.desc Verify at() toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      values.at(0);
      expect(values.toString()).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_3300
     * @tc.name testUint32ArrayAtPartTwo033
     * @tc.desc Verify at() buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const a: Uint32Array = new Uint32Array(buf, 0, 2);
      const b: Uint32Array = new Uint32Array(buf, 0, 2);
      a.$_set(0, 50);
      b.at(0);
      expect(a.$_get(0)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_3400
     * @tc.name testUint32ArrayAtPartTwo034
     * @tc.desc Verify at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      let r = values.at(0);
      expect(r).assertEqual(10);
      r = 999;
      expect(values.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_3500
     * @tc.name testUint32ArrayAtPartTwo035
     * @tc.desc Verify at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      values.at(0);
      values.$_set(0, 777);
      expect(values.at(0)).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_3600
     * @tc.name testUint32ArrayAtPartTwo036
     * @tc.desc Verify at() on subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const view: Uint32Array = values.subarray(1, 3);
      expect(view.at(0)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_3700
     * @tc.name testUint32ArrayAtPartTwo037
     * @tc.desc Verify at(-1) on subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const view: Uint32Array = values.subarray(1, 3);
      expect(view.at(-1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_3800
     * @tc.name testUint32ArrayAtPartTwo038
     * @tc.desc Verify $_set at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const view: Uint32Array = values.subarray(1, 3);
      values.$_set(1, 200);
      expect(view.at(0)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_3900
     * @tc.name testUint32ArrayAtPartTwo039
     * @tc.desc Verify $_set at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const view: Uint32Array = values.subarray(1, 3);
      view.$_set(0, 200);
      expect(values.at(1)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_4000
     * @tc.name testUint32ArrayAtPartTwo040
     * @tc.desc Verify at() on byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const view: Uint32Array = values.subarray(1, 3);
      view.at(0);
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_4100
     * @tc.name testUint32ArrayAtPartTwo041
     * @tc.desc Verify at(0) on byteOffset=4 uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const view: Uint32Array = new Uint32Array(buf, 4, 3);
      view.$_set(0, 111);
      expect(view.at(0)).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_4200
     * @tc.name testUint32ArrayAtPartTwo042
     * @tc.desc Verify at(0) on byteOffset=8 length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const view: Uint32Array = new Uint32Array(buf, 8, 2);
      view.$_set(0, 222);
      expect(view.at(0)).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_4300
     * @tc.name testUint32ArrayAtPartTwo043
     * @tc.desc Verify at(0) on subarray at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const view: Uint32Array = values.subarray(1, 3);
      view.at(0);
      values.$_set(1, 999);
      expect(view.at(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_4400
     * @tc.name testUint32ArrayAtPartTwo044
     * @tc.desc Verify at(-1) on subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const view: Uint32Array = values.subarray(1, 3);
      values.$_set(2, 888);
      expect(view.at(-1)).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_4500
     * @tc.name testUint32ArrayAtPartTwo045
     * @tc.desc Verify at() on slice buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      const copy: Uint32Array = values.slice(0, 3);
      values.$_set(0, 999);
      expect(copy.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_4600
     * @tc.name testUint32ArrayAtPartTwo046
     * @tc.desc Verify at() on buffer $_set at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const view: Uint32Array = values.subarray(0, 4);
      values.$_set(0, 555);
      expect(view.at(0)).assertEqual(555);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_4700
     * @tc.name testUint32ArrayAtPartTwo047
     * @tc.desc Verify buffer at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const a: Uint32Array = values.subarray(0, 2);
      values.$_set(0, 333);
      expect(a.at(0)).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_4800
     * @tc.name testUint32ArrayAtPartTwo048
     * @tc.desc Verify buffer at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const a: Uint32Array = values.subarray(0, 2);
      const b: Uint32Array = values.subarray(0, 2);
      values.$_set(0, 333);
      expect(b.at(0)).assertEqual(a.at(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_4900
     * @tc.name testUint32ArrayAtPartTwo049
     * @tc.desc Verify at() on subarray(0) at() on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      const view: Uint32Array = values.subarray(0);
      expect(view.at(1)).assertEqual(values.at(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_5000
     * @tc.name testUint32ArrayAtPartTwo050
     * @tc.desc Verify at(0) on ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const view: Uint32Array = new Uint32Array(buf, 0, 2);
      view.$_set(0, 444);
      expect(view.at(0)).assertEqual(444);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_5100
     * @tc.name testUint32ArrayAtPartTwo051
     * @tc.desc Verify at() on subarray length=0 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      const view: Uint32Array = values.subarray(5, 2);
      expect(view.at(0)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_AT_PARTTWO_5200
     * @tc.name testUint32ArrayAtPartTwo052
     * @tc.desc Verify at() on buffer $_set at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayAtPartTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const view: Uint32Array = values.subarray(0, 4);
      values.$_set(3, 666);
      expect(view.at(-1)).assertEqual(666);
    });

  });
}
