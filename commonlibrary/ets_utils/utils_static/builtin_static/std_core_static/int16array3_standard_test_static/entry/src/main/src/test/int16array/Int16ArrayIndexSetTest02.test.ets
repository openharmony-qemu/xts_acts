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

export default function Int16ArrayIndexSetTest02(): void {
  describe('Int16ArrayIndexSetTest02', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_0100
     * @tc.name testInt16ArrayIndexSetTestTwo001
     * @tc.desc Verify $_set(int ) byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3, 4]);
      let blBefore = arr.byteLength;
      let val: short = 99;
      arr.$_set(0, val);
      let r1: int = arr.byteLength;
      let e1: number = blBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_0200
     * @tc.name testInt16ArrayIndexSetTestTwo002
     * @tc.desc Verify $_set(number ) byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3, 4]);
      let blBefore = arr.byteLength;
      arr.$_set(0, 99);
      let r1: int = arr.byteLength;
      let e1: number = blBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_0300
     * @tc.name testInt16ArrayIndexSetTestTwo003
     * @tc.desc Verify $_set(number ) byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      let blBefore = arr.byteLength;
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      arr.$_set(2, 30);
      let r1: int = arr.byteLength;
      let e1: number = blBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_0400
     * @tc.name testInt16ArrayIndexSetTestTwo004
     * @tc.desc Verify $_set(number )byteLength length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      arr.$_set(0, 99);
      let r1: int = arr.byteLength;
      let e1: number = arr.length * 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_0500
     * @tc.name testInt16ArrayIndexSetTestTwo005
     * @tc.desc Verify $_set(int )byteLength length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      let val: short = 99;
      arr.$_set(0, val);
      let r1: int = arr.byteLength;
      let e1: number = arr.length * 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_0600
     * @tc.name testInt16ArrayIndexSetTestTwo006
     * @tc.desc Verify $_set(number ) byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([42]);
      let blBefore = arr.byteLength;
      arr.$_set(0, 7);
      let r1: int = arr.byteLength;
      let e1: number = blBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_0700
     * @tc.name testInt16ArrayIndexSetTestTwo007
     * @tc.desc Verify $_set(number ) ArrayBuffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(10);
      let arr = new Int16Array(buf, 2, 3);
      let blBefore = arr.byteLength;
      arr.$_set(0, 50);
      let r1: int = arr.byteLength;
      let e1: number = blBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_0800
     * @tc.name testInt16ArrayIndexSetTestTwo008
     * @tc.desc Verify $_set(number ) int16 byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      let blBefore = arr.byteLength;
      arr.$_set(0, 32767);
      arr.$_set(1, -32768);
      let r1: int = arr.byteLength;
      let e1: number = blBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_0900
     * @tc.name testInt16ArrayIndexSetTestTwo009
     * @tc.desc Verify $_set(int ) BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      let val: short = 10;
      arr.$_set(0, val);
      let r1: int = arr.BYTES_PER_ELEMENT;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_1000
     * @tc.name testInt16ArrayIndexSetTestTwo010
     * @tc.desc Verify $_set(number ) BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      arr.$_set(0, 10);
      let r1: int = arr.BYTES_PER_ELEMENT;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_1100
     * @tc.name testInt16ArrayIndexSetTestTwo011
     * @tc.desc Verify $_set(number ) BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      let bpeBefore = arr.BYTES_PER_ELEMENT;
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      let r1: int = arr.BYTES_PER_ELEMENT;
      let e1: number = bpeBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_1200
     * @tc.name testInt16ArrayIndexSetTestTwo012
     * @tc.desc Verify $_set(number ) ArrayBuffer BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let arr = new Int16Array(buf, 0, 3);
      arr.$_set(0, 50);
      let r1: int = arr.BYTES_PER_ELEMENT;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_1300
     * @tc.name testInt16ArrayIndexSetTestTwo013
     * @tc.desc Verify $_set(number ) name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      arr.$_set(0, 99);
      let r1: string = arr.name;
      let e1: string = 'Int16Array';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_1400
     * @tc.name testInt16ArrayIndexSetTestTwo014
     * @tc.desc Verify $_set (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      let val: short = 5;
      arr.$_set(0, val);
      let r1: string = arr.name;
      let e1: string = 'Int16Array';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_1500
     * @tc.name testInt16ArrayIndexSetTestTwo015
     * @tc.desc Verify $_set writes value and $_get reads expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      let ref = arr;
      let val: short = 99;
      arr.$_set(0, val);
      let r1: number = ref.$_get(0);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_1600
     * @tc.name testInt16ArrayIndexSetTestTwo016
     * @tc.desc Verify $_set/$_set/$_set (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      let ref = arr;
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      arr.$_set(2, 30);
      let r1: number = ref.$_get(0);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = ref.$_get(1);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
      let r3: number = ref.$_get(2);
      let e3: int = 30;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_1700
     * @tc.name testInt16ArrayIndexSetTestTwo017
     * @tc.desc Verify $_set(number ) buffer ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let arr1 = new Int16Array(buf, 0, 3);
      let arr2 = new Int16Array(buf, 0, 3);
      arr1.$_set(0, 123);
      let r1: number = arr2.$_get(0);
      let e1: int = 123;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_1800
     * @tc.name testInt16ArrayIndexSetTestTwo018
     * @tc.desc Verify $_set writes value and $_get reads expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(5, 10, 15);
      let ref = arr;
      arr.$_set(1, 99);
      let r1: number = ref.$_get(1);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_1900
     * @tc.name testInt16ArrayIndexSetTestTwo019
     * @tc.desc Verify $_set(number ) from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3];
      let arr = Int16Array.from(src);
      let ref = arr;
      arr.$_set(2, 99);
      let r1: number = ref.$_get(2);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_2000
     * @tc.name testInt16ArrayIndexSetTestTwo020
     * @tc.desc Verify $_set writes value and $_get reads expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([42]);
      let ref = arr;
      let val: short = 7;
      arr.$_set(0, val);
      let r1: number = ref.$_get(0);
      let e1: int = 7;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_2100
     * @tc.name testInt16ArrayIndexSetTestTwo021
     * @tc.desc Verify $_set(number ) ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new Int16Array(buf, 0, 4);
      let ref = arr;
      arr.$_set(3, 99);
      let r1: number = ref.$_get(3);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_2200
     * @tc.name testInt16ArrayIndexSetTestTwo022
     * @tc.desc Verify $_set(number ) byteOffset ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let arr = new Int16Array(buf, 0, 3);
      let offsetBefore = arr.byteOffset;
      arr.$_set(0, 10);
      let r1: int = arr.byteOffset;
      let e1: number = offsetBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_2300
     * @tc.name testInt16ArrayIndexSetTestTwo023
     * @tc.desc Verify $_set(int ) byteOffset ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let arr = new Int16Array(buf, 0, 3);
      let offsetBefore = arr.byteOffset;
      let val: short = 10;
      arr.$_set(0, val);
      let r1: int = arr.byteOffset;
      let e1: number = offsetBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_2400
     * @tc.name testInt16ArrayIndexSetTestTwo024
     * @tc.desc Verify $_set(number ) byteOffset ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(10);
      let arr = new Int16Array(buf, 2, 3);
      let offsetBefore = arr.byteOffset;
      arr.$_set(0, 99);
      let r1: int = arr.byteOffset;
      let e1: number = offsetBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_2500
     * @tc.name testInt16ArrayIndexSetTestTwo025
     * @tc.desc Verify $_set(number ) byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new Int16Array(buf, 2, 2);
      let offsetBefore = arr.byteOffset;
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      let r1: int = arr.byteOffset;
      let e1: number = offsetBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_2600
     * @tc.name testInt16ArrayIndexSetTestTwo026
     * @tc.desc Verify $_set(int ) byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(10);
      let arr = new Int16Array(buf, 4, 2);
      let offsetBefore = arr.byteOffset;
      let val: short = 50;
      arr.$_set(0, val);
      let r1: int = arr.byteOffset;
      let e1: number = offsetBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_2700
     * @tc.name testInt16ArrayIndexSetTestTwo027
     * @tc.desc Verify $_set writes value and $_get reads expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      arr.$_set(0, 99);
      let r1: number = arr.$_get(0);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_2800
     * @tc.name testInt16ArrayIndexSetTestTwo028
     * @tc.desc Verify $_set writes value and $_get reads expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      let val: short = 99;
      arr.$_set(0, val);
      let r1: number = arr.$_get(0);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_2900
     * @tc.name testInt16ArrayIndexSetTestTwo029
     * @tc.desc Verify $_set/$_set/$_set (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3, 4]);
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      arr.$_set(2, 30);
      arr.$_set(3, 40);
      let r1: number = arr.$_get(0);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(2);
      let e3: int = 30;
      expect(r3).assertEqual(e3);
      let r4: number = arr.$_get(3);
      let e4: int = 40;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_3000
     * @tc.name testInt16ArrayIndexSetTestTwo030
     * @tc.desc Verify $_set(number ) (void )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1]);
      arr.$_set(0, 50);
      arr.$_set(0, 100);
      let r1: number = arr.$_get(0);
      let e1: int = 100;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_3100
     * @tc.name testInt16ArrayIndexSetTestTwo031
     * @tc.desc Verify $_set(number ) $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0, 0]);
      arr.$_set(1, 32767);
      let r1: number = arr.$_get(1);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(0);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(2);
      let e3: int = 0;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_3200
     * @tc.name testInt16ArrayIndexSetTestTwo032
     * @tc.desc Verify $_set at index 1 leaves neighbors unchanged via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let val: short = 99;
      arr.$_set(1, val);
      let r1: number = arr.$_get(0);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(2);
      let e2: int = 30;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_3300
     * @tc.name testInt16ArrayIndexSetTestTwo033
     * @tc.desc Verify $_set(number ) buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      let bufLenBefore = arr.buffer.byteLength;
      arr.$_set(0, 99);
      let r1: int = arr.buffer.byteLength;
      let e1: number = bufLenBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_3400
     * @tc.name testInt16ArrayIndexSetTestTwo034
     * @tc.desc Verify $_set(int ) buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      let bufLenBefore = arr.buffer.byteLength;
      let val: short = 99;
      arr.$_set(0, val);
      let r1: int = arr.buffer.byteLength;
      let e1: number = bufLenBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_3500
     * @tc.name testInt16ArrayIndexSetTestTwo035
     * @tc.desc Verify $_set(number ) buffer( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let arr1 = new Int16Array(buf, 0, 2);
      let arr2 = new Int16Array(buf, 2, 1);
      arr1.$_set(1, 77);
      let r1: number = arr2.$_get(0);
      let e1: int = 77;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_3600
     * @tc.name testInt16ArrayIndexSetTestTwo036
     * @tc.desc Verify $_set(number ) buffer ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let arr1 = new Int16Array(buf, 0, 2);
      let arr2 = new Int16Array(buf, 0, 2);
      arr1.$_set(0, 999);
      arr1.$_set(1, -999);
      let r1: number = arr2.$_get(0);
      let e1: int = 999;
      expect(r1).assertEqual(e1);
      let r2: number = arr2.$_get(1);
      let e2: int = -999;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_3700
     * @tc.name testInt16ArrayIndexSetTestTwo037
     * @tc.desc Verify $_set(number ) 0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let arr1 = new Int16Array(buf, 0, 2);
      let arr2 = new Int16Array(buf, 0, 2);
      arr1.$_set(0, 0);
      let r1: number = arr2.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_3800
     * @tc.name testInt16ArrayIndexSetTestTwo038
     * @tc.desc Verify $_set(number ) 32767 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let arr1 = new Int16Array(buf, 0, 2);
      let arr2 = new Int16Array(buf, 0, 2);
      arr1.$_set(0, 32767);
      let r1: number = arr2.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_3900
     * @tc.name testInt16ArrayIndexSetTestTwo039
     * @tc.desc Verify $_set(number ) -32768 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let arr1 = new Int16Array(buf, 0, 2);
      let arr2 = new Int16Array(buf, 0, 2);
      arr1.$_set(0, -32768);
      let r1: number = arr2.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_4000
     * @tc.name testInt16ArrayIndexSetTestTwo040
     * @tc.desc Verify $_set writes value and $_get reads expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0]);
      arr.$_set(0, 32768);
      let r1: number = arr.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_4100
     * @tc.name testInt16ArrayIndexSetTestTwo041
     * @tc.desc Verify $_set writes value and $_get reads expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0]);
      arr.$_set(0, -32769);
      let r1: number = arr.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_4200
     * @tc.name testInt16ArrayIndexSetTestTwo042
     * @tc.desc Verify $_set(0, Number.NaN) then $_get returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1]);
      arr.$_set(0, Number.NaN);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_4300
     * @tc.name testInt16ArrayIndexSetTestTwo043
     * @tc.desc Verify $_set(0, Number.POSITIVE_INFINITY) then $_get returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1]);
      arr.$_set(0, Number.POSITIVE_INFINITY);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_4400
     * @tc.name testInt16ArrayIndexSetTestTwo044
     * @tc.desc Verify $_set(0, -Number.POSITIVE_INFINITY) then $_get returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1]);
      arr.$_set(0, -Number.POSITIVE_INFINITY);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_4500
     * @tc.name testInt16ArrayIndexSetTestTwo045
     * @tc.desc Verify $_set writes value and $_get reads expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0]);
      arr.$_set(0, 3.7);
      let r1: number = arr.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_4600
     * @tc.name testInt16ArrayIndexSetTestTwo046
     * @tc.desc Verify $_set writes value and $_get reads expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0]);
      arr.$_set(0, -3.7);
      let r1: number = arr.$_get(0);
      let e1: int = -3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_4700
     * @tc.name testInt16ArrayIndexSetTestTwo047
     * @tc.desc Verify $_set writes value and $_get reads expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0]);
      arr.$_set(0, 65535);
      let r1: number = arr.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_4800
     * @tc.name testInt16ArrayIndexSetTestTwo048
     * @tc.desc Verify $_set writes value and $_get reads expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0]);
      arr.$_set(0, 65536);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_4900
     * @tc.name testInt16ArrayIndexSetTestTwo049
     * @tc.desc Verify $_set writes value and $_get reads expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0]);
      arr.$_set(0, 32767.9);
      let r1: number = arr.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_5000
     * @tc.name testInt16ArrayIndexSetTestTwo050
     * @tc.desc Verify $_set writes value and $_get reads expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0]);
      arr.$_set(0, -32768.5);
      let r1: number = arr.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_5100
     * @tc.name testInt16ArrayIndexSetTestTwo051
     * @tc.desc Verify $_set(0, large number) $_get stays in int16 range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0]);
      arr.$_set(0, 1.7976931348623157e308);
      let val = arr.$_get(0);
      let r1: boolean = val >= -32768 && val <= 32767;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_5200
     * @tc.name testInt16ArrayIndexSetTestTwo052
     * @tc.desc Verify $_set writes value and $_get reads expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0]);
      arr.$_set(0, 0);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_5300
     * @tc.name testInt16ArrayIndexSetTestTwo053
     * @tc.desc Verify $_set writes value and $_get reads expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1]);
      arr.$_set(0, -0);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_5400
     * @tc.name testInt16ArrayIndexSetTestTwo054
     * @tc.desc Verify $_set(0, 0x7FFF) then $_get returns 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0]);
      arr.$_set(0, 0x7fff);
      let r1: number = arr.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_5500
     * @tc.name testInt16ArrayIndexSetTestTwo055
     * @tc.desc Verify $_set(0, 98303) then $_get returns 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0]);
      arr.$_set(0, 98303);
      let r1: number = arr.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_5600
     * @tc.name testInt16ArrayIndexSetTestTwo056
     * @tc.desc Verify $_set(0, -98304) then $_get returns -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0]);
      arr.$_set(0, -98304);
      let r1: number = arr.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_5700
     * @tc.name testInt16ArrayIndexSetTestTwo057
     * @tc.desc Verify $_set wraparound and other elements unchanged via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      arr.$_set(0, 32768);
      let r1: number = arr.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(2);
      let e3: int = 3;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_5800
     * @tc.name testInt16ArrayIndexSetTestTwo058
     * @tc.desc Verify $_set(-3, v) length=3 throws RangeError and $_get(0)=111
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(111, 222, 333);
      const v: short = 77;
      try {
        arr.$_set(-3, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(0);
      let e1: int = 111;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_5900
     * @tc.name testInt16ArrayIndexSetTestTwo059
     * @tc.desc Verify $_set(-3, v) length=3 throws RangeError and $_get(2)=333
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(111, 222, 333);
      const v: short = 77;
      try {
        arr.$_set(-3, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(2);
      let e1: int = 333;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_6000
     * @tc.name testInt16ArrayIndexSetTestTwo060
     * @tc.desc Verify $_set(-3, v) length=3 throws RangeError and length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(111, 222, 333);
      const v: short = 77;
      try {
        arr.$_set(-3, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: int = arr.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_6100
     * @tc.name testInt16ArrayIndexSetTestTwo061
     * @tc.desc Verify $_set(-4, v) length=3 throws RangeError and $_get(0)=111
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(111, 222, 333);
      const v: short = 88;
      try {
        arr.$_set(-4, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(0);
      let e1: int = 111;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_6200
     * @tc.name testInt16ArrayIndexSetTestTwo062
     * @tc.desc Verify $_set(-5, v) length=5 throws RangeError and $_get(0)=100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(100, 200, 300, 400, 500);
      const v: short = 55;
      try {
        arr.$_set(-5, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(0);
      let e1: int = 100;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_6300
     * @tc.name testInt16ArrayIndexSetTestTwo063
     * @tc.desc Verify $_set(-5, v) length=5 throws RangeError and $_get(4)=500
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(100, 200, 300, 400, 500);
      const v: short = 55;
      try {
        arr.$_set(-5, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(4);
      let e1: int = 500;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_6400
     * @tc.name testInt16ArrayIndexSetTestTwo064
     * @tc.desc Verify $_set(-5, v) length=5 throws RangeError and length=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(100, 200, 300, 400, 500);
      const v: short = 55;
      try {
        arr.$_set(-5, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: int = arr.length;
      let e1: int = 5;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_6500
     * @tc.name testInt16ArrayIndexSetTestTwo065
     * @tc.desc Verify $_set(-6, v) length=5 throws RangeError and $_get(0)=100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(100, 200, 300, 400, 500);
      const v: short = 99;
      try {
        arr.$_set(-6, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(0);
      let e1: int = 100;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_6600
     * @tc.name testInt16ArrayIndexSetTestTwo066
     * @tc.desc Verify $_set(5, v) length=5 throws RangeError and $_get(0)=444
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(444, 555, 666, 777, 888);
      const v: short = 11;
      try {
        arr.$_set(5, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(0);
      let e1: int = 444;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_6700
     * @tc.name testInt16ArrayIndexSetTestTwo067
     * @tc.desc Verify $_set(5, v) length=5 throws RangeError and length=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(444, 555, 666, 777, 888);
      const v: short = 11;
      try {
        arr.$_set(5, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: int = arr.length;
      let e1: int = 5;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_6800
     * @tc.name testInt16ArrayIndexSetTestTwo068
     * @tc.desc Verify $_set(-2, 123) length=2 throws RangeError and $_get(0)=77
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(77, 88);
      try {
        arr.$_set(-2, 123);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(0);
      let e1: int = 77;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_6900
     * @tc.name testInt16ArrayIndexSetTestTwo069
     * @tc.desc Verify $_set(2, 999) length=2 throws RangeError and $_get(0)=77
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(77, 88);
      try {
        arr.$_set(2, 999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(0);
      let e1: int = 77;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_7000
     * @tc.name testInt16ArrayIndexSetTestTwo070
     * @tc.desc Verify $_set(2, 999) length=2 throws RangeError and length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(77, 88);
      try {
        arr.$_set(2, 999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: int = arr.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_7100
     * @tc.name testInt16ArrayIndexSetTestTwo071
     * @tc.desc Verify $_set(-7, 333) length=7 throws RangeError and $_get(0)=55
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(55, 66, 77, 88, 99, 111, 222);
      try {
        arr.$_set(-7, 333);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(0);
      let e1: int = 55;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_7200
     * @tc.name testInt16ArrayIndexSetTestTwo072
     * @tc.desc Verify $_set(-8, 444) length=7 throws RangeError and $_get(6)=222
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(55, 66, 77, 88, 99, 111, 222);
      try {
        arr.$_set(-8, 444);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(6);
      let e1: int = 222;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_7300
     * @tc.name testInt16ArrayIndexSetTestTwo073
     * @tc.desc Verify $_set(7, 555) length=7 throws RangeError and $_get(0)=55
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(55, 66, 77, 88, 99, 111, 222);
      try {
        arr.$_set(7, 555);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(0);
      let e1: int = 55;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_7400
     * @tc.name testInt16ArrayIndexSetTestTwo074
     * @tc.desc Verify $_set(8, 666) length=7 throws RangeError and $_get(6)=222
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(55, 66, 77, 88, 99, 111, 222);
      try {
        arr.$_set(8, 666);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(6);
      let e1: int = 222;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_7500
     * @tc.name testInt16ArrayIndexSetTestTwo075
     * @tc.desc Verify $_set(50000, v) index=50000 throws RangeError and $_get(0)=91
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(91, 92, 93, 94, 95);
      const v: short = 50;
      try {
        arr.$_set(50000, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(0);
      let e1: int = 91;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_7600
     * @tc.name testInt16ArrayIndexSetTestTwo076
     * @tc.desc Verify $_set(1000000, v) index=1000000 throws RangeError and $_get(0)=61
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(61, 62, 63);
      const v: short = 30;
      try {
        arr.$_set(1000000, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(0);
      let e1: int = 61;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_7700
     * @tc.name testInt16ArrayIndexSetTestTwo077
     * @tc.desc Verify $_set(1000000, v) index=1000000 throws RangeError and length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(61, 62, 63);
      const v: short = 30;
      try {
        arr.$_set(1000000, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: int = arr.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_7800
     * @tc.name testInt16ArrayIndexSetTestTwo078
     * @tc.desc Verify $_set(-50000, v) index=-50000 throws RangeError and $_get(0)=81
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(81, 82, 83, 84);
      const v: short = 25;
      try {
        arr.$_set(-50000, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(0);
      let e1: int = 81;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_7900
     * @tc.name testInt16ArrayIndexSetTestTwo079
     * @tc.desc Verify $_set(-1000000, v) index=-1000000 throws RangeError and $_get(1)=72
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(71, 72, 73);
      const v: short = 15;
      try {
        arr.$_set(-1000000, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(1);
      let e1: int = 72;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_8000
     * @tc.name testInt16ArrayIndexSetTestTwo080
     * @tc.desc Verify $_set(-1000000, v) index=-1000000 throws RangeError and length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(71, 72, 73);
      const v: short = 15;
      try {
        arr.$_set(-1000000, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: int = arr.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_8100
     * @tc.name testInt16ArrayIndexSetTestTwo081
     * @tc.desc Verify $_set(50000, 99) number index=50000 throws RangeError and $_get(0)=31
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(31, 32, 33, 34);
      try {
        arr.$_set(50000, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(0);
      let e1: int = 31;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_8200
     * @tc.name testInt16ArrayIndexSetTestTwo082
     * @tc.desc Verify $_set(50000, 99) number index=50000 throws RangeError and $_get(3)=34
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(31, 32, 33, 34);
      try {
        arr.$_set(50000, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(3);
      let e1: int = 34;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_8300
     * @tc.name testInt16ArrayIndexSetTestTwo083
     * @tc.desc Verify $_set(50000, 99) number index=50000 throws RangeError and length=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(31, 32, 33, 34);
      try {
        arr.$_set(50000, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: int = arr.length;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_8400
     * @tc.name testInt16ArrayIndexSetTestTwo084
     * @tc.desc Verify $_set(-50000, 88) number index=-50000 throws RangeError and $_get(0)=51
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(51, 52, 53, 54);
      try {
        arr.$_set(-50000, 88);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(0);
      let e1: int = 51;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_8500
     * @tc.name testInt16ArrayIndexSetTestTwo085
     * @tc.desc Verify $_set(-50000, 88) number index=-50000 throws RangeError and $_get(3)=54
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(51, 52, 53, 54);
      try {
        arr.$_set(-50000, 88);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(3);
      let e1: int = 54;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_TWO_8600
     * @tc.name testInt16ArrayIndexSetTestTwo086
     * @tc.desc Verify $_set(-50000, 88) number index=-50000 throws RangeError and length=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestTwo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(51, 52, 53, 54);
      try {
        arr.$_set(-50000, 88);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: int = arr.length;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
    });
  });
}
