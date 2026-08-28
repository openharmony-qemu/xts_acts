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

export default function Int16ArraySliceTest02(): void {
  describe('Int16ArraySliceTest02', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_0100
     * @tc.name testInt16ArraySliceTestTwo001
     * @tc.desc Verify slice(-2) copy contains last two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(11, 22, 33, 44, 55);
      let result: Int16Array = arr.slice(-2);
      let r1: number = result.$_get(0 as int);
      let e1: int = 44;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1 as int);
      let e2: int = 55;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_0200
     * @tc.name testInt16ArraySliceTestTwo002
     * @tc.desc Verify slice(-3, -1) copy contains third-last and second-last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(11, 22, 33, 44, 55);
      let result: Int16Array = arr.slice(-3, -1);
      let r1: number = result.$_get(0 as int);
      let e1: int = 33;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1 as int);
      let e2: int = 44;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_0300
     * @tc.name testInt16ArraySliceTestTwo003
     * @tc.desc Verify slice(1) copy contains elements from index 1 to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(11, 22, 33, 44, 55);
      let result: Int16Array = arr.slice(1);
      let r1: number = result.$_get(0 as int);
      let e1: int = 22;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1 as int);
      let e2: int = 33;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2 as int);
      let e3: int = 44;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(3 as int);
      let e4: int = 55;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_0400
     * @tc.name testInt16ArraySliceTestTwo004
     * @tc.desc Verify slice(0, length) join equals no-arg slice join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(11, 22, 33, 44, 55);
      let result: Int16Array = arr.slice(0, arr.length);
      let full: Int16Array = arr.slice();
      let r1: string = result.join();
      let e1: string = full.join();
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_0500
     * @tc.name testInt16ArraySliceTestTwo005
     * @tc.desc Verify slice(0, 1) copy contains only first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(100, 200, 300, 400, 500);
      let result: Int16Array = arr.slice(0, 1);
      let r1: number = result.$_get(0 as int);
      let e1: int = 100;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_0600
     * @tc.name testInt16ArraySliceTestTwo006
     * @tc.desc Verify slice(length-1, length) copy contains only last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(100, 200, 300, 400, 500);
      let result: Int16Array = arr.slice(arr.length - 1, arr.length);
      let r1: number = result.$_get(0 as int);
      let e1: int = 500;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_0700
     * @tc.name testInt16ArraySliceTestTwo007
     * @tc.desc Verify slice() preserves Int16 max min and nearby values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, -32768, 0, -1, 1);
      let result: Int16Array = arr.slice();
      let r1: number = result.$_get(0 as int);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1 as int);
      let e2: int = -32768;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2 as int);
      let e3: int = 0;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(3 as int);
      let e4: int = -1;
      expect(r4).assertEqual(e4);
      let r5: number = result.$_get(4 as int);
      let e5: int = 1;
      expect(r5).assertEqual(e5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_0800
     * @tc.name testInt16ArraySliceTestTwo008
     * @tc.desc Verify slice() on single-element array copies that value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(42);
      let result: Int16Array = arr.slice();
      let r1: number = result.$_get(0 as int);
      let e1: int = 42;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_0900
     * @tc.name testInt16ArraySliceTestTwo009
     * @tc.desc Verify slice() on empty array join equals empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      let result: Int16Array = arr.slice();
      let r1: string = result.join();
      let e1: string = '';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_1000
     * @tc.name testInt16ArraySliceTestTwo010
     * @tc.desc Verify no-arg slice() copy length equals original length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice();
      let r1: int = result.length;
      let e1: number = arr.length;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_1100
     * @tc.name testInt16ArraySliceTestTwo011
     * @tc.desc Verify slice() on empty array yields length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      let result: Int16Array = arr.slice();
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_1200
     * @tc.name testInt16ArraySliceTestTwo012
     * @tc.desc Verify slice() copy BYTES_PER_ELEMENT equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice();
      let r1: int = result.byteLength;
      let e1: number = result.length * result.BYTES_PER_ELEMENT;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_1300
     * @tc.name testInt16ArraySliceTestTwo013
     * @tc.desc Verify slice(0, 2) copy byteLength equals 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice(0, 2);
      let r1: int = result.byteLength;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_1400
     * @tc.name testInt16ArraySliceTestTwo014
     * @tc.desc Verify slice(0, 0) empty copy byteLength equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice(0, 0);
      let r1: int = result.byteLength;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_1500
     * @tc.name testInt16ArraySliceTestTwo015
     * @tc.desc Verify slice() on empty array copy byteLength equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      let result: Int16Array = arr.slice();
      let r1: int = result.byteLength;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_1600
     * @tc.name testInt16ArraySliceTestTwo016
     * @tc.desc Verify slice() copy BYTES_PER_ELEMENT equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice();
      let r1: int = result.BYTES_PER_ELEMENT;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_1700
     * @tc.name testInt16ArraySliceTestTwo017
     * @tc.desc Verify slice() copy byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice();
      let r1: int = result.byteOffset;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_1800
     * @tc.name testInt16ArraySliceTestTwo018
     * @tc.desc Verify slice(1, 3) copy byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice(1, 3);
      let r1: int = result.byteOffset;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_1900
     * @tc.name testInt16ArraySliceTestTwo019
     * @tc.desc Verify slice(-2) copy byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice(-2);
      let r1: int = result.byteOffset;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_2000
     * @tc.name testInt16ArraySliceTestTwo020
     * @tc.desc Verify slice() copy buffer is not same reference as original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice();
      let sameBuf: boolean = result.buffer === arr.buffer;
      expect(sameBuf).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_2100
     * @tc.name testInt16ArraySliceTestTwo021
     * @tc.desc Verify slice() copy buffer.byteLength equals result.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice();
      let r1: int = result.buffer.byteLength;
      let e1: number = result.byteLength;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_2200
     * @tc.name testInt16ArraySliceTestTwo022
     * @tc.desc Verify two slice() calls allocate independent buffers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let r1: Int16Array = arr.slice();
      let r2: Int16Array = arr.slice();
      let bufsSame: boolean = r1.buffer === r2.buffer;
      expect(bufsSame).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_2300
     * @tc.name testInt16ArraySliceTestTwo023
     * @tc.desc Verify three different slice() calls allocate independent buffers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let r1: Int16Array = arr.slice(0, 2);
      let r2: Int16Array = arr.slice(1, 4);
      let r3: Int16Array = arr.slice(2);
      let b12: boolean = r1.buffer === r2.buffer;
      let b13: boolean = r1.buffer === r3.buffer;
      let b23: boolean = r2.buffer === r3.buffer;
      expect(b12).assertFalse();
      expect(b13).assertFalse();
      expect(b23).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_2400
     * @tc.name testInt16ArraySliceTestTwo024
     * @tc.desc Verify original first element unchanged after slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice();
      let r1: number = arr.$_get(0 as int);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_2500
     * @tc.name testInt16ArraySliceTestTwo025
     * @tc.desc Verify original length unchanged after slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice();
      let r1: int = arr.length;
      let e1: int = 5;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_2600
     * @tc.name testInt16ArraySliceTestTwo026
     * @tc.desc Verify original byteLength unchanged after slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let origByteLen: int = arr.byteLength;
      let result: Int16Array = arr.slice();
      let r1: int = arr.byteLength;
      let e1: number = origByteLen;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_2700
     * @tc.name testInt16ArraySliceTestTwo027
     * @tc.desc Verify original BYTES_PER_ELEMENT unchanged after slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice();
      let r1: int = arr.BYTES_PER_ELEMENT;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_2800
     * @tc.name testInt16ArraySliceTestTwo028
     * @tc.desc Verify original byteOffset unchanged after slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let origOffset: int = arr.byteOffset;
      let result: Int16Array = arr.slice();
      let r1: int = arr.byteOffset;
      let e1: number = origOffset;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_2900
     * @tc.name testInt16ArraySliceTestTwo029
     * @tc.desc Verify original join result unchanged after slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let origJoin: string = arr.join(',');
      let result: Int16Array = arr.slice();
      let r1: string = arr.join(',');
      let e1: string = origJoin;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_3000
     * @tc.name testInt16ArraySliceTestTwo030
     * @tc.desc Verify modifying slice() copy with fill does not change original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice();
      result.fill(0);
      let r1: number = arr.$_get(0 as int);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(2 as int);
      let e2: int = 30;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(4 as int);
      let e3: int = 50;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_3100
     * @tc.name testInt16ArraySliceTestTwo031
     * @tc.desc Verify reverse on slice() copy does not change original order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice();
      result.reverse();
      let r1: number = arr.$_get(0 as int);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(4 as int);
      let e2: int = 50;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_3200
     * @tc.name testInt16ArraySliceTestTwo032
     * @tc.desc Verify sort on slice() copy does not change original order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(50, 10, 40, 20, 30);
      let result: Int16Array = arr.slice();
      result.sort();
      let r1: number = arr.$_get(0 as int);
      let e1: int = 50;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_3300
     * @tc.name testInt16ArraySliceTestTwo033
     * @tc.desc Verify copyWithin on slice() copy does not change original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice();
      result.copyWithin(0, 1);
      let r1: number = arr.$_get(0 as int);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1 as int);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_3400
     * @tc.name testInt16ArraySliceTestTwo034
     * @tc.desc Verify set on slice() copy does not change original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice();
      let src: Int16Array = Int16Array.of(99, 88);
      result.set(src, 0);
      let r1: number = arr.$_get(0 as int);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1 as int);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_3500
     * @tc.name testInt16ArraySliceTestTwo035
     * @tc.desc Verify $_set on original after slice() does not change returned copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice();
      arr.$_set(0 as int, 777);
      let r1: number = result.$_get(0 as int);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_3600
     * @tc.name testInt16ArraySliceTestTwo036
     * @tc.desc Verify original fill after slice() does not change returned copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice();
      arr.fill(0);
      let r1: number = result.$_get(0 as int);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(2 as int);
      let e2: int = 30;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_3700
     * @tc.name testInt16ArraySliceTestTwo037
     * @tc.desc Verify reverse on original after slice() does not change returned copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice();
      arr.reverse();
      let r1: number = result.$_get(0 as int);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(4 as int);
      let e2: int = 50;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_3800
     * @tc.name testInt16ArraySliceTestTwo038
     * @tc.desc Verify sort on original after slice() does not change returned copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(50, 10, 40, 20, 30);
      let result: Int16Array = arr.slice();
      arr.sort();
      let r1: number = result.$_get(0 as int);
      let e1: int = 50;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_3900
     * @tc.name testInt16ArraySliceTestTwo039
     * @tc.desc Verify slice().fill(0) chain sets first element to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice().fill(0);
      let r1: number = result.$_get(0 as int);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_4000
     * @tc.name testInt16ArraySliceTestTwo040
     * @tc.desc Verify slice().reverse() chain returns last original as first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice().reverse();
      let r1: number = result.$_get(0 as int);
      let e1: int = 50;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_4100
     * @tc.name testInt16ArraySliceTestTwo041
     * @tc.desc Verify slice().sort() chain sorts returned copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(50, 10, 40, 20, 30);
      let result: Int16Array = arr.slice().sort();
      let r1: number = result.$_get(0 as int);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(4 as int);
      let e2: int = 50;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_4200
     * @tc.name testInt16ArraySliceTestTwo042
     * @tc.desc Verify slice().map chain doubles each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice().map((v: number, _i: int, _a: Int16Array): number => {
        return v * 2;
      });
      let r1: number = result.$_get(0 as int);
      let e1: int = 20;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(2 as int);
      let e2: int = 60;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_4300
     * @tc.name testInt16ArraySliceTestTwo043
     * @tc.desc Verify two slice() calls return distinct object references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let r1: Int16Array = arr.slice();
      let r2: Int16Array = arr.slice();
      let sameRef: boolean = r1 === r2;
      expect(sameRef).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_4400
     * @tc.name testInt16ArraySliceTestTwo044
     * @tc.desc Verify independent slice copies are not shared after mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let r1: Int16Array = arr.slice(0, 3);
      let r2: Int16Array = arr.slice(1, 4);
      r1.$_set(0 as int, 999);
      let v1: number = r2.$_get(0 as int);
      let e1: int = 20;
      expect(v1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_4500
     * @tc.name testInt16ArraySliceTestTwo045
     * @tc.desc Verify three slice copies remain independent after mutations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let r1: Int16Array = arr.slice(0, 2);
      let r2: Int16Array = arr.slice(1, 3);
      let r3: Int16Array = arr.slice(2, 4);
      r1.$_set(0 as int, 999);
      r2.fill(0);
      let v1: number = r3.$_get(0 as int);
      let e1: int = 30;
      expect(v1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_4600
     * @tc.name testInt16ArraySliceTestTwo046
     * @tc.desc Verify forEach on slice() copy visits result.length elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice(1, 4);
      let count: int = 0;
      result.forEach((_v: number, _i: int, _a: Int16Array): void => {
        count = count + 1;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_4700
     * @tc.name testInt16ArraySliceTestTwo047
     * @tc.desc Verify entries on slice() copy yields first key value pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(11, 22, 33, 44, 55);
      let result: Int16Array = arr.slice(1, 3);
      let it: IterableIterator<[int, number]> = result.entries();
      let first = it.next().value!;
      let key: int = first[0] as int;
      let val: number = first[1] as number;
      expect(key).assertEqual(0);
      expect(val).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_4800
     * @tc.name testInt16ArraySliceTestTwo048
     * @tc.desc Verify values on slice() copy yields first value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(11, 22, 33, 44, 55);
      let result: Int16Array = arr.slice(2);
      let r1: number = result.values().next().value as number;
      let e1: int = 33;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_4900
     * @tc.name testInt16ArraySliceTestTwo049
     * @tc.desc Verify keys on slice() copy yields first key 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(11, 22, 33, 44, 55);
      let result: Int16Array = arr.slice(0, 3);
      let r1: number = result.keys().next().value as int;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_5000
     * @tc.name testInt16ArraySliceTestTwo050
     * @tc.desc Verify map on slice() copy transforms values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice(0, 3);
      let mapped: Int16Array = result.map((v: number, _i: int, _a: Int16Array): number => {
        return v + 1;
      });
      let r1: number = mapped.$_get(0 as int);
      let e1: int = 11;
      expect(r1).assertEqual(e1);
      let r2: number = mapped.$_get(2 as int);
      let e2: int = 31;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_5100
     * @tc.name testInt16ArraySliceTestTwo051
     * @tc.desc Verify filter on slice() copy keeps values greater than 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice();
      let filtered: Int16Array = result.filter((v: number, _i: int, _a: Int16Array): boolean => {
        return v > 30;
      });
      let r1: int = filtered.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = filtered.$_get(0 as int);
      let e2: int = 40;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_5200
     * @tc.name testInt16ArraySliceTestTwo052
     * @tc.desc Verify find on slice() copy locates matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice(1, 5);
      let found: number | undefined = result.find((v: number, _i: int, _a: Int16Array): boolean => {
        return v === 40;
      });
      expect(found).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_5300
     * @tc.name testInt16ArraySliceTestTwo053
     * @tc.desc Verify reduce on slice() copy accumulates sum correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice(1, 4);
      let sum: number = result.reduce((acc: number, v: number, _i: int, _a: Int16Array): number => {
        return acc + v;
      }, 0);
      expect(sum).assertEqual(90);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_5400
     * @tc.name testInt16ArraySliceTestTwo054
     * @tc.desc Verify every on slice() copy returns true for all positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice();
      let allPositive: boolean = result.every((v: number, _i: int, _a: Int16Array): boolean => {
        return v > 0;
      });
      expect(allPositive).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_5500
     * @tc.name testInt16ArraySliceTestTwo055
     * @tc.desc Verify some on slice() copy returns true when value exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice(2, 5);
      let hasValue: boolean = result.some((v: number, _i: int, _a: Int16Array): boolean => {
        return v === 40;
      });
      expect(hasValue).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_5600
     * @tc.name testInt16ArraySliceTestTwo056
     * @tc.desc Verify includes on slice() copy returns true for existing value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice();
      let r1: boolean = result.includes(30);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_5700
     * @tc.name testInt16ArraySliceTestTwo057
     * @tc.desc Verify indexOf on slice() copy returns correct index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice(1, 5);
      let r1: int = result.indexOf(40);
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_5800
     * @tc.name testInt16ArraySliceTestTwo058
     * @tc.desc Verify indexOf on slice() copy returns -1 for missing value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice(0, 3);
      let idx: int = result.indexOf(99);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_5900
     * @tc.name testInt16ArraySliceTestTwo059
     * @tc.desc Verify lastIndexOf on slice() copy returns last matching index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 10, 40, 50);
      let result: Int16Array = arr.slice();
      let r1: int = result.lastIndexOf(10);
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_6000
     * @tc.name testInt16ArraySliceTestTwo060
     * @tc.desc Verify at(0) on slice() copy returns first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(11, 22, 33, 44, 55);
      let result: Int16Array = arr.slice(1, 4);
      let r1 = result.at(0);
      let e1: int = 22;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_6100
     * @tc.name testInt16ArraySliceTestTwo061
     * @tc.desc Verify at(-1) on slice() copy returns last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(11, 22, 33, 44, 55);
      let result: Int16Array = arr.slice(0, 3);
      let r1 = result.at(-1);
      let e1: int = 33;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_6200
     * @tc.name testInt16ArraySliceTestTwo062
     * @tc.desc Verify Int16Array.from accepts slice() copy as source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice(1, 4);
      let copied: Int16Array = Int16Array.from(result);
      let r1: number = copied.$_get(0 as int);
      let e1: int = 20;
      expect(r1).assertEqual(e1);
      let r2: int = copied.length;
      let e2: int = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_6300
     * @tc.name testInt16ArraySliceTestTwo063
     * @tc.desc Verify new Int16Array accepts slice() copy as source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice(2, 5);
      let copied: Int16Array = new Int16Array(result);
      let r1: number = copied.$_get(0 as int);
      let e1: int = 30;
      expect(r1).assertEqual(e1);
      let r2: int = copied.length;
      let e2: int = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_6400
     * @tc.name testInt16ArraySliceTestTwo064
     * @tc.desc Verify slice() copy independence: mutate slice does not affect source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(100, 200, 300);
      let result: Int16Array = source.slice();
      result.$_set(0 as int, 999);
      let r1: number = source.$_get(0 as int);
      let e1: int = 100;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_6500
     * @tc.name testInt16ArraySliceTestTwo065
     * @tc.desc Verify slice(0, 3) copy independence: mutate source does not affect slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(100, 200, 300);
      let result: Int16Array = source.slice(0, 3);
      source.$_set(1 as int, 888);
      let r1: number = result.$_get(1 as int);
      let e1: int = 200;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_6600
     * @tc.name testInt16ArraySliceTestTwo066
     * @tc.desc Verify slice() returns independent buffer not shared with source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(100, 200, 300);
      let result: Int16Array = source.slice();
      let r1: boolean = result.buffer === source.buffer;
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_6700
     * @tc.name testInt16ArraySliceTestTwo067
     * @tc.desc Verify slice(3, 3) returns independent buffer not shared with source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(100, 200, 300);
      let result: Int16Array = source.slice(3, 3);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: boolean = result.buffer === source.buffer;
      expect(r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_6800
     * @tc.name testInt16ArraySliceTestTwo068
     * @tc.desc Verify slice() copy independence: mutate slice does not affect source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40);
      let result: Int16Array = source.slice();
      result.$_set(0 as int, 99);
      result.$_set(1 as int, 99);
      result.$_set(2 as int, 99);
      result.$_set(3 as int, 99);
      let r1: number = source.$_get(0 as int);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = source.$_get(3 as int);
      let e2: int = 40;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_6900
     * @tc.name testInt16ArraySliceTestTwo069
     * @tc.desc Verify slice(0, 4) copy independence: mutate source does not affect slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40);
      let result: Int16Array = source.slice(0, 4);
      source.$_set(0 as int, 77);
      source.$_set(1 as int, 77);
      source.$_set(2 as int, 77);
      source.$_set(3 as int, 77);
      let r1: number = result.$_get(0 as int);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(3 as int);
      let e2: int = 40;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_7000
     * @tc.name testInt16ArraySliceTestTwo070
     * @tc.desc Verify slice(1, 4) copy independence: mutate slice does not affect source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(1, 4);
      result.$_set(0 as int, 111);
      result.$_set(2 as int, 333);
      let r1: number = source.$_get(1 as int);
      let e1: int = 20;
      expect(r1).assertEqual(e1);
      let r2: number = source.$_get(3 as int);
      let e2: int = 40;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_7100
     * @tc.name testInt16ArraySliceTestTwo071
     * @tc.desc Verify slice(-3, -1) copy independence: mutate slice does not affect source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(-3, -1);
      result.$_set(0 as int, 999);
      let r1: number = source.$_get(2 as int);
      let e1: int = 30;
      expect(r1).assertEqual(e1);
      let r2: number = source.$_get(3 as int);
      let e2: int = 40;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_7200
     * @tc.name testInt16ArraySliceTestTwo072
     * @tc.desc Verify slice(0, 2) preserves identical element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(5, 5, 5, 5, 5);
      let result: Int16Array = source.slice(0, 2);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 5;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1 as int);
      let e3: int = 5;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_7300
     * @tc.name testInt16ArraySliceTestTwo073
     * @tc.desc Verify slice(2, 5) preserves identical element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(5, 5, 5, 5, 5);
      let result: Int16Array = source.slice(2, 5);
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 5;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2 as int);
      let e3: int = 5;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_7400
     * @tc.name testInt16ArraySliceTestTwo074
     * @tc.desc Verify slice(-2) preserves identical element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(7, 7, 7, 7, 7);
      let result: Int16Array = source.slice(-2);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 7;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1 as int);
      let e3: int = 7;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_7500
     * @tc.name testInt16ArraySliceTestTwo075
     * @tc.desc Verify slice(-3, -1) preserves identical element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(9, 9, 9, 9, 9);
      let result: Int16Array = source.slice(-3, -1);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 9;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1 as int);
      let e3: int = 9;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_7600
     * @tc.name testInt16ArraySliceTestTwo076
     * @tc.desc Verify slice(1, 3) preserves identical element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(8, 8, 8, 8, 8);
      let result: Int16Array = source.slice(1, 3);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 8;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1 as int);
      let e3: int = 8;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_7700
     * @tc.name testInt16ArraySliceTestTwo077
     * @tc.desc Verify slice(0, 3) preserves all-zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(0, 0, 0, 0, 0);
      let result: Int16Array = source.slice(0, 3);
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2 as int);
      let e3: int = 0;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_7800
     * @tc.name testInt16ArraySliceTestTwo078
     * @tc.desc Verify slice(-3, -1) preserves all-zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(0, 0, 0, 0, 0);
      let result: Int16Array = source.slice(-3, -1);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1 as int);
      let e3: int = 0;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_7900
     * @tc.name testInt16ArraySliceTestTwo079
     * @tc.desc Verify slice(-1) preserves all-zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(0, 0, 0, 0, 0);
      let result: Int16Array = source.slice(-1);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_8000
     * @tc.name testInt16ArraySliceTestTwo080
     * @tc.desc Verify slice(0, 3) preserves all -1 values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(-1, -1, -1, -1, -1);
      let result: Int16Array = source.slice(0, 3);
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = -1;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2 as int);
      let e3: int = -1;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_8100
     * @tc.name testInt16ArraySliceTestTwo081
     * @tc.desc Verify slice(2, 4) preserves all -1 values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(-1, -1, -1, -1, -1);
      let result: Int16Array = source.slice(2, 4);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = -1;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1 as int);
      let e3: int = -1;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_8200
     * @tc.name testInt16ArraySliceTestTwo082
     * @tc.desc Verify slice(-2, -1) preserves all -1 values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(-1, -1, -1, -1, -1);
      let result: Int16Array = source.slice(-2, -1);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = -1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_8300
     * @tc.name testInt16ArraySliceTestTwo083
     * @tc.desc Verify slice(0, 2) preserves int16 MAX values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(32767, 32767, 32767);
      let result: Int16Array = source.slice(0, 2);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 32767;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1 as int);
      let e3: int = 32767;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_8400
     * @tc.name testInt16ArraySliceTestTwo084
     * @tc.desc Verify slice(-2) preserves int16 MAX values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(32767, 32767, 32767, 32767);
      let result: Int16Array = source.slice(-2);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 32767;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1 as int);
      let e3: int = 32767;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_8500
     * @tc.name testInt16ArraySliceTestTwo085
     * @tc.desc Verify slice(0, 2) preserves int16 MIN values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(-32768, -32768, -32768);
      let result: Int16Array = source.slice(0, 2);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = -32768;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1 as int);
      let e3: int = -32768;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_TWO_8600
     * @tc.name testInt16ArraySliceTestTwo086
     * @tc.desc Verify slice(-2) preserves int16 MIN values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestTwo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(-32768, -32768, -32768, -32768);
      let result: Int16Array = source.slice(-2);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = -32768;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1 as int);
      let e3: int = -32768;
      expect(r3).assertEqual(e3);
    });
  });
}
