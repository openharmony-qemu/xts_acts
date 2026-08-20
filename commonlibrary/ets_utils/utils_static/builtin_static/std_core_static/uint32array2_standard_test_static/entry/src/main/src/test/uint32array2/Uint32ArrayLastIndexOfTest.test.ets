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

export default function uint32ArrayLastIndexOfTest(): void {
  describe('Uint32ArrayLastIndexOfTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_0100
     * @tc.name testUint32ArrayLastIndexOf001
     * @tc.desc Verify empty array lastIndexOf returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of();
      const r = values.lastIndexOf(5);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_0200
     * @tc.name testUint32ArrayLastIndexOf002
     * @tc.desc Verify [5,3,5] lastIndexOf(5,0) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(5, 3, 5);
      const r = values.lastIndexOf(5, 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_0300
     * @tc.name testUint32ArrayLastIndexOf003
     * @tc.desc Verify [1,2,3] lastIndexOf(NaN) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(1, 2, 3);
      const r = values.lastIndexOf(Number.NaN);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_0400
     * @tc.name testUint32ArrayLastIndexOf004
     * @tc.desc Verify [42,42] lastIndexOf(42) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(42, 42);
      const r = values.lastIndexOf(42);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_0500
     * @tc.name testUint32ArrayLastIndexOf005
     * @tc.desc Verify lastIndexOf(5) on [5,3,5,5] returns last matching index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(5, 3, 5, 5);
      expect(values.lastIndexOf(5)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_0600
     * @tc.name testUint32ArrayLastIndexOf006
     * @tc.desc Verify [10,20,30] 20 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      expect(values.lastIndexOf(20)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_0700
     * @tc.name testUint32ArrayLastIndexOf007
     * @tc.desc Verify lastIndexOf(7) on single-element [7] returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(7);
      expect(values.lastIndexOf(7)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_0800
     * @tc.name testUint32ArrayLastIndexOf008
     * @tc.desc Verify lastIndexOf(0) on [0,0,0] returns last occurrence index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(0, 0, 0);
      expect(values.lastIndexOf(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_0900
     * @tc.name testUint32ArrayLastIndexOf009
     * @tc.desc Verify [MAX,0,MAX] uint32 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4294967295, 0, 4294967295);
      expect(values.lastIndexOf(4294967295)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_1000
     * @tc.name testUint32ArrayLastIndexOf010
     * @tc.desc Verify [2147483648] int32 +1 uint32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(2147483648);
      expect(values.lastIndexOf(2147483648)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_1100
     * @tc.name testUint32ArrayLastIndexOf011
     * @tc.desc Verify [0,MAX] uint32 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(0, 4294967295);
      expect(values.lastIndexOf(4294967295)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_1200
     * @tc.name testUint32ArrayLastIndexOf012
     * @tc.desc Verify lastIndexOf(0) on [0, uint32 MAX] returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(0, 4294967295);
      expect(values.lastIndexOf(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_1300
     * @tc.name testUint32ArrayLastIndexOf013
     * @tc.desc Verify lastIndexOf(7) on [5,3,5] returns -1 when absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(5, 3, 5);
      expect(values.lastIndexOf(7)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_1400
     * @tc.name testUint32ArrayLastIndexOf014
     * @tc.desc Verify lastIndexOf(8) on [7] returns -1 when absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(7);
      expect(values.lastIndexOf(8)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_1500
     * @tc.name testUint32ArrayLastIndexOf015
     * @tc.desc Verify [1,2,3] -1 uint32 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(1, 2, 3);
      expect(values.lastIndexOf(-1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_1600
     * @tc.name testUint32ArrayLastIndexOf016
     * @tc.desc Verify [1,2,3] 3.5 SameValueZero 3 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(1, 2, 3);
      expect(values.lastIndexOf(3.5)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_1700
     * @tc.name testUint32ArrayLastIndexOf017
     * @tc.desc Verify [0,MAX] -1 SameValueZero -1 4294967295 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(0, 4294967295);
      expect(values.lastIndexOf(-1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_1800
     * @tc.name testUint32ArrayLastIndexOf018
     * @tc.desc Verify [5,3,5] fromIndex=2 5 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(5, 3, 5);
      expect(values.lastIndexOf(5, 2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_1900
     * @tc.name testUint32ArrayLastIndexOf019
     * @tc.desc Verify [5,3,5] fromIndex=-length-1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(5, 3, 5);
      expect(values.lastIndexOf(5, -4)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_2000
     * @tc.name testUint32ArrayLastIndexOf020
     * @tc.desc Verify [5,3,5,5] fromIndex=2 2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(5, 3, 5, 5);
      expect(values.lastIndexOf(5, 2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_2100
     * @tc.name testUint32ArrayLastIndexOf021
     * @tc.desc Verify [1,2,1,2,1] fromIndex=3 2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(1, 2, 1, 2, 1);
      expect(values.lastIndexOf(1, 3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_2200
     * @tc.name testUint32ArrayLastIndexOf022
     * @tc.desc Verify [10,20,30] fromIndex=0 30 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      expect(values.lastIndexOf(30, 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_2300
     * @tc.name testUint32ArrayLastIndexOf023
     * @tc.desc Verify [0,0,0] fromIndex=1 1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(0, 0, 0);
      expect(values.lastIndexOf(0, 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_2400
     * @tc.name testUint32ArrayLastIndexOf024
     * @tc.desc Verify [5,3,5] byteLength equals 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(5, 3, 5);
      expect(values.lastIndexOf(5)).assertEqual(2);
      expect(values.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_2500
     * @tc.name testUint32ArrayLastIndexOf025
     * @tc.desc Verify lastIndexOf on [5,3,5] returns last matching index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(5, 3, 5);
      expect(values.lastIndexOf(5)).assertEqual(2);
      expect(values.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_2600
     * @tc.name testUint32ArrayLastIndexOf026
     * @tc.desc Verify lastIndexOf(0) on [0,0,0] returns last matching index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(0, 0, 0);
      expect(values.lastIndexOf(0)).assertEqual(2);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_2700
     * @tc.name testUint32ArrayLastIndexOf027
     * @tc.desc Verify MAX 0 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4294967295, 0);
      expect(values.lastIndexOf(4294967295)).assertEqual(0);
      expect(values.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_2800
     * @tc.name testUint32ArrayLastIndexOf028
     * @tc.desc Verify lastIndexOf(MAX) on [MAX,0] returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4294967295, 0);
      expect(values.lastIndexOf(4294967295)).assertEqual(0);
      expect(values.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_2900
     * @tc.name testUint32ArrayLastIndexOf029
     * @tc.desc Verify lastIndexOf(1) on [1,2,1,2,1] returns last matching index 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(1, 2, 1, 2, 1);
      expect(values.lastIndexOf(1)).assertEqual(4);
      expect(values.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_3000
     * @tc.name testUint32ArrayLastIndexOf030
     * @tc.desc Verify [255,256,257] 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(255, 256, 257);
      expect(values.lastIndexOf(256)).assertEqual(1);
      expect(values.$_get(1)).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_3100
     * @tc.name testUint32ArrayLastIndexOf031
     * @tc.desc Verify lastIndexOf with fromIndex=-1 searches from length minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(5, 3, 5);
      expect(values.lastIndexOf(5, -1)).assertEqual(2);
      expect(values.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_3200
     * @tc.name testUint32ArrayLastIndexOf032
     * @tc.desc Verify lastIndexOf does not mutate array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = new Uint32Array(65535);
      values.$_set(65000, 123456);
      expect(values.lastIndexOf(123456)).assertEqual(65000);
      expect(values.$_get(65000)).assertEqual(123456);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_3300
     * @tc.name testUint32ArrayLastIndexOf033
     * @tc.desc Verify [10,20,30,20] lastIndexOf(20) returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 20);
      const r = values.lastIndexOf(20);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_3400
     * @tc.name testUint32ArrayLastIndexOf034
     * @tc.desc Verify subarray() view length is 2 while lastIndexOf() finds value on source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const view: Uint32Array = values.subarray(1, 3);
      expect(view.length).assertEqual(2);
      expect(values.lastIndexOf(40)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_3500
     * @tc.name testUint32ArrayLastIndexOf035
     * @tc.desc Verify subarray() view shares buffer with source used by lastIndexOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const view: Uint32Array = values.subarray(1, 3);
      expect(values.lastIndexOf(40)).assertEqual(3);
      expect(view.$_get(0)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_3600
     * @tc.name testUint32ArrayLastIndexOf036
     * @tc.desc Verify ArrayBuffer byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const values: Uint32Array = new Uint32Array(buf, 0, 2);
      expect(values.lastIndexOf(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_3700
     * @tc.name testUint32ArrayLastIndexOf037
     * @tc.desc Verify lastIndexOf() on sibling view sees writes through shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const a: Uint32Array = new Uint32Array(buf, 0, 2);
      const b: Uint32Array = new Uint32Array(buf, 0, 2);
      a.$_set(0, 50);
      expect(b.lastIndexOf(50)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_3800
     * @tc.name testUint32ArrayLastIndexOf038
     * @tc.desc Verify lastIndexOf() sibling built from same buffer sees identical data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOf038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(5, 3, 5);
      const buf: ArrayBuffer = values.buffer;
      expect(values.lastIndexOf(5)).assertEqual(2);
      const sibling: Uint32Array = new Uint32Array(buf);
      expect(sibling.$_get(0)).assertEqual(5);
    });

  });
}