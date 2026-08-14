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

export default function int16ArraySubarrayTestFiveTest(): void {
  describe('Int16ArraySubarrayTestFiveTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_0100
     * @tc.name testInt16ArraySubarrayTestFive001
     * @tc.desc Verify empty Int16Array subarray() returns Int16Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int16Array();
      let sub = src.subarray();
      let actual1: int = sub.length;
      let expectedR1: int = sub.length;
      expect(actual1).assertEqual(expectedR1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_0200
     * @tc.name testInt16ArraySubarrayTestFive002
     * @tc.desc Verify ArrayBuffer(2) source subarray(0) returns first element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2);
      let src = new Int16Array(buf);
      src.$_set(0, 77 as short);
      let sub = src.subarray(0);
      let actual1: number = sub.$_get(0);
      expect(actual1).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_0300
     * @tc.name testInt16ArraySubarrayTestFive003
     * @tc.desc Verify ArrayBuffer(4) source subarray(1) returns length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let src = new Int16Array(buf);
      src.$_set(0, 33 as short);
      src.$_set(1, 44 as short);
      let sub = src.subarray(1);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_0400
     * @tc.name testInt16ArraySubarrayTestFive004
     * @tc.desc Verify ArrayBuffer(4) source subarray(0, 2) returns full two-element view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let src = new Int16Array(buf);
      src.$_set(0, 111 as short);
      src.$_set(1, 222 as short);
      let sub = src.subarray(0, 2);
      let actual1: number = sub.$_get(0);
      expect(actual1).assertEqual(111);
      let actual2: number = sub.$_get(1);
      expect(actual2).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_0500
     * @tc.name testInt16ArraySubarrayTestFive005
     * @tc.desc Verify 0x7FFF element source subarray() returns first element 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int16Array.of(0x7fff as short, 0 as short, -1 as short);
      let sub = src.subarray();
      let actual1: number = sub.$_get(0);
      expect(actual1).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_0600
     * @tc.name testInt16ArraySubarrayTestFive006
     * @tc.desc Verify 0x7FFF element source subarray(1, 3) skips first element correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int16Array.of(0x7fff as short, 100 as short, 200 as short, 300 as short);
      let sub = src.subarray(1, 3);
      let actual1: number = sub.$_get(0);
      expect(actual1).assertEqual(100);
      let actual2: int = sub.length;
      expect(actual2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_0700
     * @tc.name testInt16ArraySubarrayTestFive007
     * @tc.desc Verify begin=arr.length-1 expression subarray contains last element only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let begin: int = arr.length - 1;
      let sub = arr.subarray(begin);
      let actual1: number = sub.$_get(0);
      let expected1: number = arr.$_get(4);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_0800
     * @tc.name testInt16ArraySubarrayTestFive008
     * @tc.desc Verify begin=arr.length-1 expression subarray length is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let begin: int = arr.length - 1;
      let sub = arr.subarray(begin);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_0900
     * @tc.name testInt16ArraySubarrayTestFive009
     * @tc.desc Verify begin=arr.length-2 expression subarray contains last two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let begin: int = arr.length - 2;
      let sub = arr.subarray(begin);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_1000
     * @tc.name testInt16ArraySubarrayTestFive010
     * @tc.desc Verify begin=arr.length expression clamps to empty subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let begin: int = arr.length;
      let sub = arr.subarray(begin);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_1100
     * @tc.name testInt16ArraySubarrayTestFive011
     * @tc.desc Verify begin=arr.length+1 expression clamps to empty subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let begin: int = arr.length + 1;
      let sub = arr.subarray(begin);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_1200
     * @tc.name testInt16ArraySubarrayTestFive012
     * @tc.desc Verify begin=arr.length*2 expression clamps to empty subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let begin: int = arr.length * 2;
      let sub = arr.subarray(begin);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_1300
     * @tc.name testInt16ArraySubarrayTestFive013
     * @tc.desc Verify begin=arr.byteLength/2 expression clamps to empty subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let begin: int = arr.byteLength / 2;
      let sub = arr.subarray(begin);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_1400
     * @tc.name testInt16ArraySubarrayTestFive014
     * @tc.desc Verify begin=byteLength/BYTES_PER_ELEMENT clamps to empty subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let begin: int = arr.byteLength / arr.BYTES_PER_ELEMENT;
      let sub = arr.subarray(begin);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_1500
     * @tc.name testInt16ArraySubarrayTestFive015
     * @tc.desc Verify begin=0-1 expression subarray starts at last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let begin: int = 0 - 1;
      let sub = arr.subarray(begin);
      let actual1: number = sub.$_get(0);
      let expected1: number = arr.$_get(4);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_1600
     * @tc.name testInt16ArraySubarrayTestFive016
     * @tc.desc Verify begin=0-2 expression subarray contains last two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let begin: int = 0 - 2;
      let sub = arr.subarray(begin);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_1700
     * @tc.name testInt16ArraySubarrayTestFive017
     * @tc.desc Verify begin=-(arr.length-1) expression subarray length is length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let begin: int = -(arr.length - 1);
      let sub = arr.subarray(begin);
      let actual1: int = sub.length;
      let expected1: number = arr.length - 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_1800
     * @tc.name testInt16ArraySubarrayTestFive018
     * @tc.desc Verify begin=-arr.length expression clamps to full subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let begin: int = -arr.length;
      let sub = arr.subarray(begin);
      let actual1: int = sub.length;
      let expected1: number = arr.length;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_1900
     * @tc.name testInt16ArraySubarrayTestFive019
     * @tc.desc Verify begin=1+1 expression subarray starts at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let begin: int = 1 + 1;
      let sub = arr.subarray(begin);
      let actual1: number = sub.$_get(0);
      let expected1: number = arr.$_get(2);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_2000
     * @tc.name testInt16ArraySubarrayTestFive020
     * @tc.desc Verify begin=5-2 expression subarray starts at index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let begin: int = 5 - 2;
      let sub = arr.subarray(begin);
      let actual1: number = sub.$_get(0);
      let expected1: number = arr.$_get(3);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_2100
     * @tc.name testInt16ArraySubarrayTestFive021
     * @tc.desc Verify begin=BYTES_PER_ELEMENT expression subarray starts at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(11 as short, 22 as short, 33 as short, 44 as short, 55 as short);
      let begin: int = arr.BYTES_PER_ELEMENT;
      let sub = arr.subarray(begin);
      let actual1: number = sub.$_get(0);
      let expected1: number = arr.$_get(2);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_2200
     * @tc.name testInt16ArraySubarrayTestFive022
     * @tc.desc Verify begin=(byteLength/2)-1 expression subarray length is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let begin: int = arr.byteLength / 2 - 1;
      let sub = arr.subarray(begin);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_2300
     * @tc.name testInt16ArraySubarrayTestFive023
     * @tc.desc Verify begin=0*length expression subarray starts at first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let begin: int = 0 * arr.length;
      let sub = arr.subarray(begin);
      let actual1: number = sub.$_get(0);
      let expected1: number = arr.$_get(0);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_2400
     * @tc.name testInt16ArraySubarrayTestFive024
     * @tc.desc Verify begin=(2+3)*2-9 expression subarray starts at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let begin: int = (2 + 3) * 2 - 9;
      let sub = arr.subarray(begin);
      let actual1: number = sub.$_get(0);
      let expected1: number = arr.$_get(1);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_2500
     * @tc.name testInt16ArraySubarrayTestFive025
     * @tc.desc Verify end=arr.length-1 expression subarray excludes last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let end: int = arr.length - 1;
      let sub = arr.subarray(0, end);
      let actual1: int = sub.length;
      let expected1: number = arr.length - 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_2600
     * @tc.name testInt16ArraySubarrayTestFive026
     * @tc.desc Verify end=arr.length-2 expression subarray excludes last two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let end: int = arr.length - 2;
      let sub = arr.subarray(0, end);
      let actual1: int = sub.length;
      let expected1: number = arr.length - 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_2700
     * @tc.name testInt16ArraySubarrayTestFive027
     * @tc.desc Verify end=arr.length expression subarray includes all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let end: int = arr.length;
      let sub = arr.subarray(0, end);
      let actual1: int = sub.length;
      let expected1: number = arr.length;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_2800
     * @tc.name testInt16ArraySubarrayTestFive028
     * @tc.desc Verify end=0-1 expression subarray excludes last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let end: int = 0 - 1;
      let sub = arr.subarray(0, end);
      let actual1: int = sub.length;
      let expected1: number = arr.length - 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_2900
     * @tc.name testInt16ArraySubarrayTestFive029
     * @tc.desc Verify end=0-2 expression subarray excludes last two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let end: int = 0 - 2;
      let sub = arr.subarray(0, end);
      let actual1: int = sub.length;
      let expected1: number = arr.length - 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_3000
     * @tc.name testInt16ArraySubarrayTestFive030
     * @tc.desc Verify end=-arr.length expression clamps to empty subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let end: int = -arr.length;
      let sub = arr.subarray(0, end);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_3100
     * @tc.name testInt16ArraySubarrayTestFive031
     * @tc.desc Verify end=-(arr.length+1) expression clamps to empty subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let end: int = -(arr.length + 1);
      let sub = arr.subarray(0, end);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_3200
     * @tc.name testInt16ArraySubarrayTestFive032
     * @tc.desc Verify end=-(arr.length*2) expression clamps to empty subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let end: int = -(arr.length * 2);
      let sub = arr.subarray(0, end);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_3300
     * @tc.name testInt16ArraySubarrayTestFive033
     * @tc.desc Verify end=BYTES_PER_ELEMENT expression subarray length is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(11 as short, 22 as short, 33 as short, 44 as short, 55 as short);
      let end: int = arr.BYTES_PER_ELEMENT;
      let sub = arr.subarray(0, end);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_3400
     * @tc.name testInt16ArraySubarrayTestFive034
     * @tc.desc Verify end=(byteLength/2)-1 expression subarray excludes last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let end: int = arr.byteLength / 2 - 1;
      let sub = arr.subarray(0, end);
      let actual1: int = sub.length;
      let expected1: number = arr.length - 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_3500
     * @tc.name testInt16ArraySubarrayTestFive035
     * @tc.desc Verify end=1+2 expression subarray length is 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let end: int = 1 + 2;
      let sub = arr.subarray(0, end);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_3600
     * @tc.name testInt16ArraySubarrayTestFive036
     * @tc.desc Verify end=6-2 expression subarray length is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let end: int = 6 - 2;
      let sub = arr.subarray(0, end);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_3700
     * @tc.name testInt16ArraySubarrayTestFive037
     * @tc.desc Verify end=length-(length-3) expression subarray length is 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let end: int = arr.length - (arr.length - 3);
      let sub = arr.subarray(0, end);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_3800
     * @tc.name testInt16ArraySubarrayTestFive038
     * @tc.desc Verify begin/end expression pair subarray middle segment length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let begin: int = arr.length - 3;
      let end: int = arr.length - 1;
      let sub = arr.subarray(begin, end);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_3900
     * @tc.name testInt16ArraySubarrayTestFive039
     * @tc.desc Verify begin/end expression pair subarray first value at source index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let begin: int = arr.length - 3;
      let end: int = arr.length - 1;
      let sub = arr.subarray(begin, end);
      let actual1: number = sub.$_get(0);
      let expected1: number = arr.$_get(2);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_4000
     * @tc.name testInt16ArraySubarrayTestFive040
     * @tc.desc Verify begin=-length end=length expression pair full subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let begin: int = -arr.length;
      let end: int = arr.length;
      let sub = arr.subarray(begin, end);
      let actual1: int = sub.length;
      let expected1: number = arr.length;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_4100
     * @tc.name testInt16ArraySubarrayTestFive041
     * @tc.desc Verify begin=length end=length+10 both out of range empty subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let begin: int = arr.length;
      let end: int = arr.length + 10;
      let sub = arr.subarray(begin, end);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_4200
     * @tc.name testInt16ArraySubarrayTestFive042
     * @tc.desc Verify begin/end both largely negative empty subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let begin: int = -(arr.length + 5);
      let end: int = -(arr.length + 1);
      let sub = arr.subarray(begin, end);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_4300
     * @tc.name testInt16ArraySubarrayTestFive043
     * @tc.desc Verify begin beyond end after clamp yields empty subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let begin: int = arr.length + 5;
      let end: int = -(arr.length + 5);
      let sub = arr.subarray(begin, end);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_4400
     * @tc.name testInt16ArraySubarrayTestFive044
     * @tc.desc Verify begin largely negative end largely positive full subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let begin: int = -(arr.length + 5);
      let end: int = arr.length + 5;
      let sub = arr.subarray(begin, end);
      let actual1: int = sub.length;
      let expected1: number = arr.length;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_4500
     * @tc.name testInt16ArraySubarrayTestFive045
     * @tc.desc Verify begin=1+1 end=5-1 arithmetic pair subarray length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let begin: int = 1 + 1;
      let end: int = 5 - 1;
      let sub = arr.subarray(begin, end);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_4600
     * @tc.name testInt16ArraySubarrayTestFive046
     * @tc.desc Verify begin=BYTES_PER_ELEMENT end=byteLength/BYTES_PER_ELEMENT subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(11 as short, 22 as short, 33 as short, 44 as short, 55 as short);
      let begin: int = arr.BYTES_PER_ELEMENT;
      let end: int = arr.byteLength / arr.BYTES_PER_ELEMENT;
      let sub = arr.subarray(begin, end);
      let actual1: int = sub.length;
      let expected1: number = arr.length - 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_4700
     * @tc.name testInt16ArraySubarrayTestFive047
     * @tc.desc Verify begin=0-1 end=length-1 expression pair subarray length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let begin: int = 0 - 1;
      let end: int = 0 + arr.length - 1;
      let sub = arr.subarray(begin, end);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_4800
     * @tc.name testInt16ArraySubarrayTestFive048
     * @tc.desc Verify begin=length/2 end=length half-range subarray first value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let begin: int = arr.length / 2;
      let end: int = arr.length;
      let sub = arr.subarray(begin, end);
      let actual1: number = sub.$_get(0);
      let expected1: number = arr.$_get(2);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_4900
     * @tc.name testInt16ArraySubarrayTestFive049
     * @tc.desc Verify begin=3*1 end=3*2 arithmetic pair subarray length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(5 as short, 10 as short, 15 as short, 20 as short, 25 as short, 30 as short, 35 as short);
      let begin: int = 3 * 1;
      let end: int = 3 * 2;
      let sub = arr.subarray(begin, end);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_5000
     * @tc.name testInt16ArraySubarrayTestFive050
     * @tc.desc Verify empty source subarray() does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int16Array();
      let sub: Int16Array = src.subarray();
      let actual1: int = sub.length;
      let expectedR1: int = 0;
      expect(actual1).assertEqual(expectedR1);
      let actual2: int = sub.length;
      let expectedR2: int = sub.length;
      expect(actual2).assertEqual(expectedR2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_5100
     * @tc.name testInt16ArraySubarrayTestFive051
     * @tc.desc Verify subarray(begin far beyond length) does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short);
      let sub: Int16Array = arr.subarray(999);
      let actual1: int = sub.length;
      let expectedR1: int = 0;
      expect(actual1).assertEqual(expectedR1);
      let actual2: int = sub.length;
      let expectedR2: int = sub.length;
      expect(actual2).assertEqual(expectedR2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_5200
     * @tc.name testInt16ArraySubarrayTestFive052
     * @tc.desc Verify subarray(-999) clamps begin to 0 and returns full-length subarray of 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short);
      let sub: Int16Array = arr.subarray(-999);
      let actual1: int = sub.length;
      let expectedR1: int = 3;
      expect(actual1).assertEqual(expectedR1);
      let actual2: int = sub.length;
      let expectedR2: int = sub.length;
      expect(actual2).assertEqual(expectedR2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_5300
     * @tc.name testInt16ArraySubarrayTestFive053
     * @tc.desc Verify subarray(end far less than begin) does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short);
      let sub: Int16Array = arr.subarray(2, -10);
      let actual1: int = sub.length;
      let expectedR1: int = 0;
      expect(actual1).assertEqual(expectedR1);
      let actual2: int = sub.length;
      let expectedR2: int = sub.length;
      expect(actual2).assertEqual(expectedR2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_5400
     * @tc.name testInt16ArraySubarrayTestFive054
     * @tc.desc Verify subarray(int max, int min) does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short);
      let sub: Int16Array = arr.subarray(2147483647, -2147483648);
      let actual1: int = sub.length;
      let expectedR1: int = 0;
      expect(actual1).assertEqual(expectedR1);
      let actual2: int = sub.length;
      let expectedR2: int = sub.length;
      expect(actual2).assertEqual(expectedR2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_5500
     * @tc.name testInt16ArraySubarrayTestFive055
     * @tc.desc Verify ArrayBuffer(0) source subarray() does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(0);
      let src = new Int16Array(buf);
      let sub: Int16Array = src.subarray();
      let actual1: int = sub.length;
      let expectedR1: int = 0;
      expect(actual1).assertEqual(expectedR1);
      let actual2: int = sub.length;
      let expectedR2: int = sub.length;
      expect(actual2).assertEqual(expectedR2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_5600
     * @tc.name testInt16ArraySubarrayTestFive056
     * @tc.desc Verify ArrayBuffer(2) subarray shares buffer with source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2);
      let src = new Int16Array(buf);
      src.$_set(0, 99 as short);
      let sub = src.subarray(0, 1);
      let actual1: boolean = sub.buffer === src.buffer;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_5700
     * @tc.name testInt16ArraySubarrayTestFive057
     * @tc.desc Verify ArrayBuffer(2) subarray write is visible on source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2);
      let src = new Int16Array(buf);
      src.$_set(0, 10 as short);
      let sub = src.subarray(0, 1);
      sub.$_set(0, 88 as short);
      let actual1: number = src.$_get(0);
      expect(actual1).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_5800
     * @tc.name testInt16ArraySubarrayTestFive058
     * @tc.desc Verify ArrayBuffer(4) subarray(1, 2) byteOffset is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let src = new Int16Array(buf);
      src.$_set(0, 11 as short);
      src.$_set(1, 22 as short);
      let sub = src.subarray(1, 2);
      let actual1: int = sub.byteOffset;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_5900
     * @tc.name testInt16ArraySubarrayTestFive059
     * @tc.desc Verify 0x7FFF source subarray write syncs to source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int16Array.of(0x7fff as short, 100 as short, 200 as short, 300 as short);
      let sub = src.subarray(1, 3);
      sub.$_set(0, 555 as short);
      let actual1: number = src.$_get(1);
      expect(actual1).assertEqual(555);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_6000
     * @tc.name testInt16ArraySubarrayTestFive060
     * @tc.desc Verify 0x7FFF source write syncs to subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int16Array.of(0x7fff as short, 100 as short, 200 as short, 300 as short);
      let sub = src.subarray(1, 3);
      src.$_set(2, 777 as short);
      let actual1: number = sub.$_get(1);
      expect(actual1).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_6100
     * @tc.name testInt16ArraySubarrayTestFive061
     * @tc.desc Verify overlapping subarrays share buffer mutations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int16Array.of(0x7fff as short, 10 as short, 20 as short, 30 as short, 40 as short);
      let subA = src.subarray(0, 3);
      let subB = src.subarray(1, 4);
      subA.$_set(1, 999 as short);
      let actual1: number = subB.$_get(0);
      expect(actual1).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_6200
     * @tc.name testInt16ArraySubarrayTestFive062
     * @tc.desc Verify nested subarray layers share same ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let src = new Int16Array(buf);
      src.$_set(0, 1 as short);
      src.$_set(1, 2 as short);
      src.$_set(2, 3 as short);
      let sub1 = src.subarray(0, 3);
      let sub2 = sub1.subarray(1, 3);
      let sub3 = sub2.subarray(0, 1);
      let actual1: boolean = sub3.buffer === buf;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_6300
     * @tc.name testInt16ArraySubarrayTestFive063
     * @tc.desc Verify nested subarray innermost write visible on source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let src = new Int16Array(buf);
      src.$_set(0, 1 as short);
      src.$_set(1, 2 as short);
      src.$_set(2, 3 as short);
      let sub1 = src.subarray(0, 3);
      let sub2 = sub1.subarray(1, 2);
      sub2.$_set(0, 99 as short);
      let actual1: number = src.$_get(1);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_6400
     * @tc.name testInt16ArraySubarrayTestFive064
     * @tc.desc Verify subarray(0, 2) length and first element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int16Array.of(0x7fff as short, 0 as short, -1 as short, -32768 as short);
      let sub = src.subarray(0, 2);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(2);
      let actual2: number = sub.$_get(0);
      expect(actual2).assertEqual(0x7fff);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_6500
     * @tc.name testInt16ArraySubarrayTestFive065
     * @tc.desc Verify ArrayBuffer(8) subarray(-1) byteOffset is 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let src = new Int16Array(buf);
      src.$_set(0, 11 as short);
      src.$_set(1, 22 as short);
      src.$_set(2, 33 as short);
      src.$_set(3, 44 as short);
      let sub = src.subarray(-1);
      let actual1: int = sub.byteOffset;
      expect(actual1).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_6600
     * @tc.name testInt16ArraySubarrayTestFive066
     * @tc.desc Verify subarray reverse() reverses corresponding source elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int16Array.of(0x7fff as short, 10 as short, 20 as short, 30 as short);
      let sub = src.subarray(0, 4);
      sub.reverse();
      let actual1: number = src.$_get(0);
      expect(actual1).assertEqual(30);
      let actual2: number = src.$_get(3);
      expect(actual2).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_6700
     * @tc.name testInt16ArraySubarrayTestFive067
     * @tc.desc Verify non-overlapping subarrays do not affect each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int16Array.of(0x7fff as short, 10 as short, 20 as short, 30 as short);
      let subA = src.subarray(0, 2);
      let subB = src.subarray(2, 4);
      subA.$_set(0, 99 as short);
      let actual1: number = subB.$_get(0);
      expect(actual1).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_6800
     * @tc.name testInt16ArraySubarrayTestFive068
     * @tc.desc Verify expression begin subarray BYTES_PER_ELEMENT is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short);
      let begin: int = arr.length - 2;
      let sub = arr.subarray(begin);
      let actual1: int = sub.BYTES_PER_ELEMENT;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_6900
     * @tc.name testInt16ArraySubarrayTestFive069
     * @tc.desc Verify expression begin/end subarray length and first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let begin: int = arr.length - 4;
      let end: int = arr.length - 1;
      let sub = arr.subarray(begin, end);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(3);
      let actual2: number = sub.$_get(0);
      expect(actual2).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_7000
     * @tc.name testInt16ArraySubarrayTestFive070
     * @tc.desc Verify expression begin=0 subarray byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(11 as short, 22 as short, 33 as short, 44 as short);
      let begin: int = arr.length - arr.length;
      let sub = arr.subarray(begin);
      let actual1: int = sub.byteOffset;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FIVE_7100
     * @tc.name testInt16ArraySubarrayTestFive071
     * @tc.desc Verify expression begin/end subarray length matches calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFive071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short);
      let begin: int = 1;
      let end: int = arr.length - 1;
      let sub = arr.subarray(begin, end);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(3);
    });
  });
}
