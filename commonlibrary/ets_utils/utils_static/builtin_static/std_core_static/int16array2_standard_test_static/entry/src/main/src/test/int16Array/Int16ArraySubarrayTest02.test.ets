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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int16ArraySubarrayTestTwoTest(): void {
  describe('Int16ArraySubarrayTestTwoTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_0100
     * @tc.name testInt16ArraySubarrayTestTwo001
     * @tc.desc Verify subarray() typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let ret: Int16Array = arr.subarray();
      let actual1: int = ret.byteOffset;
      expect(actual1).assertEqual(arr.byteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_0200
     * @tc.name testInt16ArraySubarrayTestTwo002
     * @tc.desc Verify subarray() length and first element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let ret: Int16Array = arr.subarray();
      let actual1: int = ret.length;
      expect(actual1).assertEqual(4);
      let actual2: number = ret[0];
      expect(actual2).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_0300
     * @tc.name testInt16ArraySubarrayTestTwo003
     * @tc.desc Verify subarray(begin) length and first element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let ret: Int16Array = arr.subarray(1);
      let actual1: int = ret.length;
      expect(actual1).assertEqual(3);
      let actual2: number = ret[0];
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_0400
     * @tc.name testInt16ArraySubarrayTestTwo004
     * @tc.desc Verify subarray(begin, end) length and first element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let ret: Int16Array = arr.subarray(1, 3);
      let actual1: int = ret.length;
      expect(actual1).assertEqual(2);
      let actual2: number = ret[0];
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_0500
     * @tc.name testInt16ArraySubarrayTestTwo005
     * @tc.desc Verify subarray() length and last element match source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let ret: Int16Array = arr.subarray();
      let actual1: int = ret.length;
      let expected1: int = arr.length;
      expect(actual1).assertEqual(expected1);
      let actual2: number = ret[3];
      expect(actual2).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_0600
     * @tc.name testInt16ArraySubarrayTestTwo006
     * @tc.desc Verify subarray length and first element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      let ret: Int16Array = arr.subarray(0, 1);
      let actual1: int = ret.length;
      expect(actual1).assertEqual(1);
      let actual2: number = ret[0];
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_0700
     * @tc.name testInt16ArraySubarrayTestTwo007
     * @tc.desc Verify MAX subarray length and first element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 32767, 32767);
      let ret: Int16Array = arr.subarray(1, 2);
      let actual1: int = ret.length;
      expect(actual1).assertEqual(1);
      let actual2: number = ret[0];
      expect(actual2).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_0800
     * @tc.name testInt16ArraySubarrayTestTwo008
     * @tc.desc Verify subarray(begin=1) length length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let ret: Int16Array = arr.subarray(1);
      let actual1: int = ret.length;
      expect(actual1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_0900
     * @tc.name testInt16ArraySubarrayTestTwo009
     * @tc.desc Verify subarray(begin=1, end=3) length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let ret: Int16Array = arr.subarray(1, 3);
      let actual1: int = ret.length;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_1000
     * @tc.name testInt16ArraySubarrayTestTwo010
     * @tc.desc Verify original byteLength unchanged after subarray() byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let ret: Int16Array = arr.subarray();
      let actual1: int = ret.byteLength;
      let expected1: number = arr.byteLength;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_1100
     * @tc.name testInt16ArraySubarrayTestTwo011
     * @tc.desc Verify subarray(begin=1, end=3) byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let ret: Int16Array = arr.subarray(1, 3);
      let actual1: int = ret.byteLength;
      expect(actual1).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_1200
     * @tc.name testInt16ArraySubarrayTestTwo012
     * @tc.desc Verify subarray returns expected byteLength 2 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1);
      let ret: Int16Array = arr.subarray(1, 2);
      let actual1: int = ret.byteLength;
      let expected1: number = 2 * ret.length;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_1300
     * @tc.name testInt16ArraySubarrayTestTwo013
     * @tc.desc Verify subarray returns BYTES_PER_ELEMENT equals 2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let ret: Int16Array = arr.subarray(1, 3);
      let actual1: int = ret.BYTES_PER_ELEMENT;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_1400
     * @tc.name testInt16ArraySubarrayTestTwo014
     * @tc.desc Verify original BYTES_PER_ELEMENT unchanged after subarray() 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1);
      let ret: Int16Array = arr.subarray();
      let actual1: int = ret.BYTES_PER_ELEMENT;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_1500
     * @tc.name testInt16ArraySubarrayTestTwo015
     * @tc.desc Verify subarray length 0 byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1);
      let ret: Int16Array = arr.subarray(1, 1);
      let actual1: int = ret.length;
      expect(actual1).assertEqual(0);
      let actual2: int = ret.byteLength;
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_1600
     * @tc.name testInt16ArraySubarrayTestTwo016
     * @tc.desc Verify subarray(begin=2) length 2 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let ret: Int16Array = arr.subarray(2);
      let actual1: int = ret.length;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_1700
     * @tc.name testInt16ArraySubarrayTestTwo017
     * @tc.desc Verify subarray begin byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1);
      let ret: Int16Array = arr.subarray(3, 3);
      let actual1: int = ret.byteLength;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_1800
     * @tc.name testInt16ArraySubarrayTestTwo018
     * @tc.desc Verify subarray length number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1);
      let ret: Int16Array = arr.subarray(0, 1);
      let actual1: int = ret.length;
      let expected1: int = ret.byteLength / Int16Array.BYTES_PER_ELEMENT;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_1900
     * @tc.name testInt16ArraySubarrayTestTwo019
     * @tc.desc Verify subarray returns expected byteLength number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1);
      let ret: Int16Array = arr.subarray(0, 2);
      let actual1: int = ret.byteLength;
      let expected1: int = ret.length * Int16Array.BYTES_PER_ELEMENT;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_2000
     * @tc.name testInt16ArraySubarrayTestTwo020
     * @tc.desc Verify subarray returns BYTES_PER_ELEMENT equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let ret: Int16Array = arr.subarray(0, 2);
      let actual1: int = ret.BYTES_PER_ELEMENT;
      let expected1: int = arr.BYTES_PER_ELEMENT;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_2100
     * @tc.name testInt16ArraySubarrayTestTwo021
     * @tc.desc Verify 5 subarray(begin=2, end=4) length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768, 100);
      let ret: Int16Array = arr.subarray(2, 4);
      let actual1: int = ret.length;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_2200
     * @tc.name testInt16ArraySubarrayTestTwo022
     * @tc.desc Verify subarray returns expected byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1);
      let ret: Int16Array = arr.subarray(0, 1);
      let actual1: int = ret.byteLength;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_2300
     * @tc.name testInt16ArraySubarrayTestTwo023
     * @tc.desc Verify subarray() length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767);
      let ret: Int16Array = arr.subarray();
      let actual1: int = ret.length;
      expect(actual1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_2400
     * @tc.name testInt16ArraySubarrayTestTwo024
     * @tc.desc Verify subarray() length and last element match source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let lenBefore: int = arr.length;
      arr.subarray(1, 3);
      let actual1: int = arr.length;
      let expected1: int = lenBefore;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_2500
     * @tc.name testInt16ArraySubarrayTestTwo025
     * @tc.desc Verify original array elements unchanged after subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      arr.subarray(1, 3);
      let actual1: number = arr.$_get(0 as int);
      expect(actual1).assertEqual(32767);
      let actual2: number = arr.$_get(3 as int);
      expect(actual2).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_2600
     * @tc.name testInt16ArraySubarrayTestTwo026
     * @tc.desc Verify original byteLength unchanged after subarray()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1);
      let blBefore: int = arr.byteLength;
      arr.subarray(1, 2);
      let actual1: int = arr.byteLength;
      let expected1: int = blBefore;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_2700
     * @tc.name testInt16ArraySubarrayTestTwo027
     * @tc.desc Verify original byteOffset unchanged after subarray()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let offBefore: int = arr.byteOffset;
      arr.subarray(1, 3);
      let actual1: int = arr.byteOffset;
      let expected1: int = offBefore;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_2800
     * @tc.name testInt16ArraySubarrayTestTwo028
     * @tc.desc Verify subarray() length and first element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1);
      arr.subarray(0, 1);
      let actual1: int = arr.length;
      expect(actual1).assertEqual(3);
      let actual2: number = arr.$_get(0);
      expect(actual2).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_2900
     * @tc.name testInt16ArraySubarrayTestTwo029
     * @tc.desc Verify original array element unchanged after subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      arr.subarray(0, 2);
      let actual1: number = arr.$_get(0 as int);
      expect(actual1).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_3000
     * @tc.name testInt16ArraySubarrayTestTwo030
     * @tc.desc Verify original array element unchanged after subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      arr.subarray(1, 2);
      let actual1: number = arr.$_get(3 as int);
      expect(actual1).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_3100
     * @tc.name testInt16ArraySubarrayTestTwo031
     * @tc.desc Verify subarray() length and last element match source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      arr.subarray(1, 3);
      arr.subarray(0, 2);
      let actual1: int = arr.length;
      expect(actual1).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_3200
     * @tc.name testInt16ArraySubarrayTestTwo032
     * @tc.desc Verify original array element unchanged after subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768, 100);
      arr.subarray(1, 4);
      let actual1: number = arr.$_get(2 as int);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_3300
     * @tc.name testInt16ArraySubarrayTestTwo033
     * @tc.desc Verify original array elements unchanged after subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0, 0);
      arr.subarray(1, 3);
      let actual1: number = arr.$_get(0 as int);
      expect(actual1).assertEqual(0);
      let actual2: number = arr.$_get(3 as int);
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_3400
     * @tc.name testInt16ArraySubarrayTestTwo034
     * @tc.desc Verify subarray() subarray(begin=1) length and first element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768, 100);
      let ret: Int16Array = arr.subarray(1).subarray(1);
      let actual1: int = ret.length;
      expect(actual1).assertEqual(3);
      let actual2: number = ret.$_get(0);
      expect(actual2).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_3500
     * @tc.name testInt16ArraySubarrayTestTwo035
     * @tc.desc Verify subarray().fill(99) length and first element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let ret: Int16Array = arr.subarray(1, 3).fill(99);
      let actual1: int = ret.length;
      expect(actual1).assertEqual(2);
      let actual2: number = ret.$_get(0);
      expect(actual2).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_3600
     * @tc.name testInt16ArraySubarrayTestTwo036
     * @tc.desc Verify subarray().reverse() length and first element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let ret: Int16Array = arr.subarray(0, 3).reverse();
      let actual1: int = ret.length;
      expect(actual1).assertEqual(3);
      let actual2: number = ret.$_get(0);
      expect(actual2).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_3700
     * @tc.name testInt16ArraySubarrayTestTwo037
     * @tc.desc Verify subarray().sort() length and first element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(50, 32767, 0, -1);
      let ret: Int16Array = arr.subarray(0, 3).sort();
      let actual1: int = ret.length;
      expect(actual1).assertEqual(3);
      let actual2: number = ret.$_get(0);
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_3800
     * @tc.name testInt16ArraySubarrayTestTwo038
     * @tc.desc Verify subarray().copyWithin(0, 1) length and first element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let ret: Int16Array = arr.subarray(1, 4).copyWithin(0, 1);
      let actual1: int = ret.length;
      expect(actual1).assertEqual(3);
      let actual2: number = ret.$_get(0);
      expect(actual2).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_3900
     * @tc.name testInt16ArraySubarrayTestTwo039
     * @tc.desc Verify subarray().$_set(0 as int, 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      arr.subarray(1, 3).$_set(0 as int, 99);
      let actual1: number = arr.$_get(1 as int);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_4000
     * @tc.name testInt16ArraySubarrayTestTwo040
     * @tc.desc Verify fill().subarray() length and first element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let ret: Int16Array = arr.fill(99).subarray(1, 3);
      let actual1: int = ret.length;
      expect(actual1).assertEqual(2);
      let actual2: number = ret.$_get(0);
      expect(actual2).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_4100
     * @tc.name testInt16ArraySubarrayTestTwo041
     * @tc.desc Verify reverse().subarray() length and first element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let ret: Int16Array = arr.reverse().subarray(0, 2);
      let actual1: int = ret.length;
      expect(actual1).assertEqual(2);
      let actual2: number = ret.$_get(0);
      expect(actual2).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_4200
     * @tc.name testInt16ArraySubarrayTestTwo042
     * @tc.desc Verify subarray().subarray() length and first element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768, 100, 200);
      let ret: Int16Array = arr.subarray(0, 5).subarray(1, 4).subarray(0, 2);
      let actual1: int = ret.length;
      expect(actual1).assertEqual(2);
      let actual2: number = ret.$_get(0);
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_4300
     * @tc.name testInt16ArraySubarrayTestTwo043
     * @tc.desc Verify subarray().fill(99).$_get returns filled value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let val: number = arr
        .subarray(0, 2)
        .fill(99)
        .$_get(0 as int);
      expect(val).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_4400
     * @tc.name testInt16ArraySubarrayTestTwo044
     * @tc.desc Verify subarray().reverse().$_get returns reversed first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1);
      let val: number = arr
        .subarray(0, 3)
        .reverse()
        .$_get(0 as int);
      expect(val).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_4500
     * @tc.name testInt16ArraySubarrayTestTwo045
     * @tc.desc Verify subarray().sort() keeps expected length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(50, 32767, 0, -1, 10);
      let ret: Int16Array = arr.subarray(0, 4).sort();
      let actual1: int = ret.length;
      expect(actual1).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_4600
     * @tc.name testInt16ArraySubarrayTestTwo046
     * @tc.desc Verify nested subarray after fill returns Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768, 100);
      let ret: Int16Array = arr.subarray(0, 4).fill(99).subarray(1, 3);
      let actual1: int = ret.length;
      expect(actual1).assertEqual(2);
      let actual2: number = ret.$_get(0);
      expect(actual2).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_4700
     * @tc.name testInt16ArraySubarrayTestTwo047
     * @tc.desc Verify triple nested subarray length decreases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768, 100, 200);
      let ret: Int16Array = arr.subarray(0, 5).subarray(0, 3).subarray(0, 2);
      let actual1: int = ret.length;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_4800
     * @tc.name testInt16ArraySubarrayTestTwo048
     * @tc.desc Verify subarray fill byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let ret: Int16Array = arr.subarray(2, 4).fill(99);
      let actual1: int = ret.byteLength;
      expect(actual1).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_4900
     * @tc.name testInt16ArraySubarrayTestTwo049
     * @tc.desc Verify subarray keeps original buffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1);
      let ret: Int16Array = arr.subarray();
      let actual1: boolean = ret.buffer === arr.buffer;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_5000
     * @tc.name testInt16ArraySubarrayTestTwo050
     * @tc.desc Verify subarray(1, 3) length and first element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let ret: Int16Array = arr.subarray(1, 3);
      let actual1: int = ret.length;
      expect(actual1).assertEqual(2);
      let actual2: number = ret.$_get(0);
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_5100
     * @tc.name testInt16ArraySubarrayTestTwo051
     * @tc.desc Verify full subarray() length and first element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1);
      let ret: Int16Array = arr.subarray();
      let actual1: int = ret.length;
      expect(actual1).assertEqual(3);
      let actual2: number = ret.$_get(0);
      expect(actual2).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_5200
     * @tc.name testInt16ArraySubarrayTestTwo052
     * @tc.desc Verify subarray byteOffset reflects view start buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let ret: Int16Array = arr.subarray(1, 3);
      let actual1: int = ret.byteOffset;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_5300
     * @tc.name testInt16ArraySubarrayTestTwo053
     * @tc.desc Verify original byteOffset unchanged after subarray() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1);
      let ret: Int16Array = arr.subarray();
      let actual1: int = ret.byteOffset;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_5400
     * @tc.name testInt16ArraySubarrayTestTwo054
     * @tc.desc Verify subarray(begin=2) byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let ret: Int16Array = arr.subarray(2);
      let actual1: int = ret.byteOffset;
      expect(actual1).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_5500
     * @tc.name testInt16ArraySubarrayTestTwo055
     * @tc.desc Verify subarray(begin=-2) byteOffset 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let retNeg: Int16Array = arr.subarray(-2);
      let retPos: Int16Array = arr.subarray(2);
      let actual1: int = retNeg.byteOffset;
      let expected1: number = retPos.byteOffset;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_5600
     * @tc.name testInt16ArraySubarrayTestTwo056
     * @tc.desc Verify shared buffer mutation via subarray $_set/$_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let ret: Int16Array = arr.subarray(1, 3);
      arr.$_set(1 as int, 88);
      let actual1: number = ret.$_get(0 as int);
      expect(actual1).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_5700
     * @tc.name testInt16ArraySubarrayTestTwo057
     * @tc.desc Verify subarray keeps original buffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let sub1: Int16Array = arr.subarray(0, 2);
      let sub2: Int16Array = arr.subarray(2, 4);
      let actual1: boolean = sub1.buffer === sub2.buffer;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_5800
     * @tc.name testInt16ArraySubarrayTestTwo058
     * @tc.desc Verify shared buffer mutation via subarray $_set/$_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768, 100, 200);
      let sub1: Int16Array = arr.subarray(0, 3);
      let sub2: Int16Array = arr.subarray(2, 5);
      sub1.$_set(2 as int, 99);
      let actual1: number = sub2.$_get(0 as int);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_5900
     * @tc.name testInt16ArraySubarrayTestTwo059
     * @tc.desc Verify shared buffer mutation via subarray $_set/$_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let sub1: Int16Array = arr.subarray(0, 3);
      let sub2: Int16Array = arr.subarray(1, 4);
      sub1.$_set(1 as int, 77);
      let actual1: number = sub2.$_get(0 as int);
      expect(actual1).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_6000
     * @tc.name testInt16ArraySubarrayTestTwo060
     * @tc.desc Verify subarray buffer.byteLength matches original buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let ret: Int16Array = arr.subarray(1, 3);
      let actual1: int = ret.buffer.byteLength;
      let expected1: number = arr.buffer.byteLength;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_6100
     * @tc.name testInt16ArraySubarrayTestTwo061
     * @tc.desc Verify subarray length 0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1);
      let ret: Int16Array = arr.subarray(1, 1);
      let actual1: boolean = ret.buffer === arr.buffer;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_6200
     * @tc.name testInt16ArraySubarrayTestTwo062
     * @tc.desc Verify subarray byteOffset reflects view start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let ret: Int16Array = arr.subarray(2, 2);
      let actual1: int = ret.byteOffset;
      expect(actual1).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_6300
     * @tc.name testInt16ArraySubarrayTestTwo063
     * @tc.desc Verify ArrayBuffer subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int16Array = new Int16Array(buf);
      arr.$_set(0 as int, 32767);
      arr.$_set(1 as int, 0);
      arr.$_set(2 as int, -1);
      arr.$_set(3 as int, -32768);
      arr.$_set(4 as int, 100);
      arr.$_set(5 as int, 200);
      let ret: Int16Array = arr.subarray(1, 4);
      let actual1: boolean = ret.buffer === buf;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_6400
     * @tc.name testInt16ArraySubarrayTestTwo064
     * @tc.desc Verify subarray byteOffset reflects view start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int16Array = new Int16Array(buf, 4, 4);
      arr.$_set(0 as int, 32767);
      arr.$_set(1 as int, 0);
      arr.$_set(2 as int, -1);
      arr.$_set(3 as int, -32768);
      let ret: Int16Array = arr.subarray(1, 3);
      let actual1: int = ret.byteOffset;
      expect(actual1).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_6500
     * @tc.name testInt16ArraySubarrayTestTwo065
     * @tc.desc Verify multi $_set on subarray shares buffer correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int16Array = new Int16Array(buf, 4, 4);
      arr.$_set(0 as int, 32767);
      arr.$_set(1 as int, 0);
      arr.$_set(2 as int, -1);
      arr.$_set(3 as int, -32768);
      let ret: Int16Array = arr.subarray(0, 2);
      let actual1: boolean = ret.buffer === buf;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_6600
     * @tc.name testInt16ArraySubarrayTestTwo066
     * @tc.desc Verify subarray fill buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let ret: Int16Array = arr.subarray(1, 3);
      ret.fill(88);
      let actual1: number = arr.$_get(1 as int);
      expect(actual1).assertEqual(88);
      let actual2: number = arr.$_get(2 as int);
      expect(actual2).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_6700
     * @tc.name testInt16ArraySubarrayTestTwo067
     * @tc.desc Verify subarray reverse buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1);
      let ret: Int16Array = arr.subarray(0, 3);
      ret.reverse();
      let actual1: number = arr.$_get(0 as int);
      expect(actual1).assertEqual(-1);
      let actual2: number = arr.$_get(2 as int);
      expect(actual2).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_6800
     * @tc.name testInt16ArraySubarrayTestTwo068
     * @tc.desc Verify subarray keeps original buffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768, 100);
      let sub1: Int16Array = arr.subarray(0, 4);
      let sub2: Int16Array = sub1.subarray(1, 3);
      let actual1: boolean = sub2.buffer === arr.buffer;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_6900
     * @tc.name testInt16ArraySubarrayTestTwo069
     * @tc.desc Verify shared buffer mutation via subarray $_set/$_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768, 100, 200);
      let sub1: Int16Array = arr.subarray(0, 3);
      let sub2: Int16Array = arr.subarray(3, 6);
      arr.$_set(0 as int, 55);
      let actual1: number = sub1.$_get(0 as int);
      expect(actual1).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_7000
     * @tc.name testInt16ArraySubarrayTestTwo070
     * @tc.desc Verify original array elements unchanged after subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let sub1: Int16Array = arr.subarray(0, 2);
      let sub2: Int16Array = arr.subarray(2, 4);
      arr.fill(77);
      let actual1: number = sub1.$_get(0 as int);
      expect(actual1).assertEqual(77);
      let actual2: number = sub2.$_get(0 as int);
      expect(actual2).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_7100
     * @tc.name testInt16ArraySubarrayTestTwo071
     * @tc.desc Verify shared buffer mutation via subarray $_set/$_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let ret: Int16Array = arr.subarray(0, 2);
      ret.$_set(0 as int, 32768);
      let actual1: number = arr.$_get(0 as int);
      expect(actual1).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_7200
     * @tc.name testInt16ArraySubarrayTestTwo072
     * @tc.desc Verify shared buffer mutation via subarray $_set/$_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1);
      let ret: Int16Array = arr.subarray(1, 2);
      ret.$_set(0 as int, Double.NaN);
      let actual1: number = arr.$_get(1 as int);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_7300
     * @tc.name testInt16ArraySubarrayTestTwo073
     * @tc.desc Verify subarray Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1);
      let ret: Int16Array = arr.subarray(2, 3);
      ret.$_set(0 as int, Double.POSITIVE_INFINITY);
      let actual1: number = arr.$_get(2 as int);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_7400
     * @tc.name testInt16ArraySubarrayTestTwo074
     * @tc.desc Verify multi $_set then $_get on shared subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let ret: Int16Array = arr.subarray(2, 4);
      arr.$_set(0 as int, 99);
      ret.$_set(0 as int, 88);
      let actual1: number = arr.$_get(0 as int);
      expect(actual1).assertEqual(99);
      let actual2: number = ret.$_get(0 as int);
      expect(actual2).assertEqual(88);
      let actual3: number = arr.$_get(2 as int);
      expect(actual3).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_7500
     * @tc.name testInt16ArraySubarrayTestTwo075
     * @tc.desc Verify ArrayBuffer subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let arr: Int16Array = new Int16Array(buf);
      arr.$_set(0 as int, 32767);
      arr.$_set(1 as int, 0);
      arr.$_set(2 as int, -1);
      arr.$_set(3 as int, -32768);
      arr.$_set(4 as int, 100);
      let ret: Int16Array = arr.subarray(1, 3);
      ret.$_set(0 as int, 66);
      let actual1: number = arr.$_get(1 as int);
      expect(actual1).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_7600
     * @tc.name testInt16ArraySubarrayTestTwo076
     * @tc.desc Verify subarray byteOffset reflects view start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let origOff: int = arr.byteOffset;
      let ret: Int16Array = arr.subarray(1, 3);
      let actual1: int = arr.byteOffset;
      let expected1: number = origOff;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_TWO_7700
     * @tc.name testInt16ArraySubarrayTestTwo077
     * @tc.desc Verify subarray keeps original buffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1);
      arr.subarray(1, 2);
      let actual1: int = arr.length;
      expect(actual1).assertEqual(3);
      let actual2: number = arr.$_get(0);
      expect(actual2).assertEqual(32767);
    });
  });
}
