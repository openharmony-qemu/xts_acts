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

export default function int16ArrayFillTestOneTest(): void {
  describe('Int16ArrayFillTestOneTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_0100
     * @tc.name testInt16ArrayFillTestOne001
     * @tc.desc Verify fill(value) fills entire Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(1);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(1);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_0200
     * @tc.name testInt16ArrayFillTestOne002
     * @tc.desc Verify fill(value, start) fills from start to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(7, 2);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(7);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_0300
     * @tc.name testInt16ArrayFillTestOne003
     * @tc.desc Verify fill(value, start, end) fills half-open range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(9, 1, 4);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(9);
      let actual3: number = arr.$_get(3);
      expect(actual3).assertEqual(9);
      let actual4: number = arr.$_get(4);
      expect(actual4).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_0400
     * @tc.name testInt16ArrayFillTestOne004
     * @tc.desc Verify fill(-32768) stores Int16 min
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      arr.fill(-32768);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-32768);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(-32768);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_0500
     * @tc.name testInt16ArrayFillTestOne005
     * @tc.desc Verify fill(32767) stores Int16 max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-1, -2, -3, -4, -5]);
      arr.fill(32767);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(32767);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(32767);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_0600
     * @tc.name testInt16ArrayFillTestOne006
     * @tc.desc Verify fill(0) zeros entire Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300, 400, 500]);
      arr.fill(0);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(0);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_0700
     * @tc.name testInt16ArrayFillTestOne007
     * @tc.desc Verify fill(-0) stores +0 in Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([50, 60, 70, 80, 90]);
      let negZero: number = -0;
      arr.fill(negZero);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = arr.$_get(3);
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_0800
     * @tc.name testInt16ArrayFillTestOne008
     * @tc.desc Verify fill(-1) fills entire Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 1, 2, 3, 4]);
      arr.fill(-1);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-1);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(-1);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_0900
     * @tc.name testInt16ArrayFillTestOne009
     * @tc.desc Verify fill(32768) wraps to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0, 0, 0]);
      let overflowValue: number = 32768;
      arr.fill(overflowValue);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-32768);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(-32768);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_1000
     * @tc.name testInt16ArrayFillTestOne010
     * @tc.desc Verify fill(-32769) wraps to 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0, 0, 0]);
      let underflowValue: number = -32769;
      arr.fill(underflowValue);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(32767);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(32767);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_1100
     * @tc.name testInt16ArrayFillTestOne011
     * @tc.desc Verify fill(0x7FFF) stores 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      arr.fill(0x7fff);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(32767);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(32767);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_1200
     * @tc.name testInt16ArrayFillTestOne012
     * @tc.desc Verify fill(0x8000) wraps to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0, 0, 0]);
      arr.fill(0x8000);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-32768);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(-32768);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_1300
     * @tc.name testInt16ArrayFillTestOne013
     * @tc.desc Verify fill(NaN conversion) stores 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300, 400, 500]);
      let nanAsShort: number = Number.NaN;
      arr.fill(nanAsShort);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(0);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_1400
     * @tc.name testInt16ArrayFillTestOne014
     * @tc.desc Verify fill(+Infinity conversion) stores 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-100, -200, -300, -400, -500]);
      let infAsShort: number = Number.POSITIVE_INFINITY;
      arr.fill(infAsShort);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(0);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_1500
     * @tc.name testInt16ArrayFillTestOne015
     * @tc.desc Verify fill(-Infinity conversion) stores 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([50, 60, 70, 80, 90]);
      let negInfAsShort: number = Number.NEGATIVE_INFINITY;
      arr.fill(negInfAsShort);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(0);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_1600
     * @tc.name testInt16ArrayFillTestOne016
     * @tc.desc Verify fill(3.7 conversion) truncates to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0, 0, 0]);
      let floatAsShort: number = 3.7;
      arr.fill(floatAsShort);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(3);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(3);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_1700
     * @tc.name testInt16ArrayFillTestOne017
     * @tc.desc Verify fill(-3.7 conversion) truncates to -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0, 0, 0]);
      let negFloatAsShort: number = -3.7;
      arr.fill(negFloatAsShort);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-3);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(-3);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_1800
     * @tc.name testInt16ArrayFillTestOne018
     * @tc.desc Verify fill(value, 0) fills from index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([11, 22, 33, 44, 55]);
      arr.fill(99, 0);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(99);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(99);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_1900
     * @tc.name testInt16ArrayFillTestOne019
     * @tc.desc Verify fill(value, 3) fills from index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([11, 22, 33, 44, 55]);
      arr.fill(77, 3);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(11);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(33);
      let actual3: number = arr.$_get(3);
      expect(actual3).assertEqual(77);
      let actual4: number = arr.$_get(4);
      expect(actual4).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_2000
     * @tc.name testInt16ArrayFillTestOne020
     * @tc.desc Verify fill(value, length-1) fills last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([11, 22, 33, 44, 55]);
      arr.fill(66, 4);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(11);
      let actual2: number = arr.$_get(3);
      expect(actual2).assertEqual(44);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_2100
     * @tc.name testInt16ArrayFillTestOne021
     * @tc.desc Verify fill(value, start) with start==length changes no elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([11, 22, 33, 44, 55]);
      arr.fill(99, 5);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(11);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(33);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_2200
     * @tc.name testInt16ArrayFillTestOne022
     * @tc.desc Verify fill(value, -1) fills last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([11, 22, 33, 44, 55]);
      arr.fill(33, -1);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(11);
      let actual2: number = arr.$_get(3);
      expect(actual2).assertEqual(44);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_2300
     * @tc.name testInt16ArrayFillTestOne023
     * @tc.desc Verify fill(value, -2) fills from length-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([11, 22, 33, 44, 55]);
      arr.fill(22, -2);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(11);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(33);
      let actual3: number = arr.$_get(3);
      expect(actual3).assertEqual(22);
      let actual4: number = arr.$_get(4);
      expect(actual4).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_2400
     * @tc.name testInt16ArrayFillTestOne024
     * @tc.desc Verify fill(value, -length) fills entire array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([11, 22, 33, 44, 55]);
      arr.fill(111, -5);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(111);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(111);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_2500
     * @tc.name testInt16ArrayFillTestOne025
     * @tc.desc Verify fill(value, -length-1) clamps start to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([11, 22, 33, 44, 55]);
      arr.fill(122, -6);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(122);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(122);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(122);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_2600
     * @tc.name testInt16ArrayFillTestOne026
     * @tc.desc Verify fill(value, 0, 0) changes no elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(99, 0, 0);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(30);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_2700
     * @tc.name testInt16ArrayFillTestOne027
     * @tc.desc Verify fill(value, 0, 1) fills only index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(99, 0, 1);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(99);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(20);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_2800
     * @tc.name testInt16ArrayFillTestOne028
     * @tc.desc Verify fill(value, 0, 3) fills indices 0..2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(88, 0, 3);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(88);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(88);
      let actual3: number = arr.$_get(3);
      expect(actual3).assertEqual(40);
      let actual4: number = arr.$_get(4);
      expect(actual4).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_2900
     * @tc.name testInt16ArrayFillTestOne029
     * @tc.desc Verify fill(value, 0, length-1) leaves last unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(77, 0, 4);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(77);
      let actual2: number = arr.$_get(3);
      expect(actual2).assertEqual(77);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_3000
     * @tc.name testInt16ArrayFillTestOne030
     * @tc.desc Verify fill(value, 0, length) fills entire array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(66, 0, 5);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(66);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(66);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_3100
     * @tc.name testInt16ArrayFillTestOne031
     * @tc.desc Verify fill(value, 0, length+1) clamps end to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(55, 0, 6);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(55);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(55);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_3200
     * @tc.name testInt16ArrayFillTestOne032
     * @tc.desc Verify fill(value, 0, -1) fills up to length-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(44, 0, -1);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(44);
      let actual2: number = arr.$_get(3);
      expect(actual2).assertEqual(44);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_3300
     * @tc.name testInt16ArrayFillTestOne033
     * @tc.desc Verify fill(value, 0, -length) changes no elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(22, 0, -5);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(30);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_3400
     * @tc.name testInt16ArrayFillTestOne034
     * @tc.desc Verify fill(value, 0, -length-1) clamps end to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(11, 0, -6);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(30);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_3500
     * @tc.name testInt16ArrayFillTestOne035
     * @tc.desc Verify fill(value, 1, 3) fills indices 1 and 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(99, 1, 3);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(99);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(99);
      let actual4: number = arr.$_get(3);
      expect(actual4).assertEqual(40);
      let actual5: number = arr.$_get(4);
      expect(actual5).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_3600
     * @tc.name testInt16ArrayFillTestOne036
     * @tc.desc Verify fill(value, 1, 1) empty range no change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(88, 1, 1);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(20);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_3700
     * @tc.name testInt16ArrayFillTestOne037
     * @tc.desc Verify fill(value, 3, 1) inverted range no change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(77, 3, 1);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(30);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_3800
     * @tc.name testInt16ArrayFillTestOne038
     * @tc.desc Verify fill(value, -3, -1) fills indices 2 and 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(66, -3, -1);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(66);
      let actual3: number = arr.$_get(3);
      expect(actual3).assertEqual(66);
      let actual4: number = arr.$_get(4);
      expect(actual4).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_3900
     * @tc.name testInt16ArrayFillTestOne039
     * @tc.desc Verify fill(value, length-1, length) fills last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(44, 4, 5);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(3);
      expect(actual2).assertEqual(40);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_4000
     * @tc.name testInt16ArrayFillTestOne040
     * @tc.desc Verify fill(value, length, 0) changes no elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(33, 5, 0);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(30);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_4100
     * @tc.name testInt16ArrayFillTestOne041
     * @tc.desc Verify fill(value, -1, 0) inverted range no change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(22, -1, 0);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(30);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_4200
     * @tc.name testInt16ArrayFillTestOne042
     * @tc.desc Verify fill(value, -1, length) fills last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(100, -1, 5);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(3);
      expect(actual2).assertEqual(40);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_4300
     * @tc.name testInt16ArrayFillTestOne043
     * @tc.desc Verify fill returns this same array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let result: Int16Array = arr.fill(99);
      let sameRef: boolean = result === arr;
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_4400
     * @tc.name testInt16ArrayFillTestOne044
     * @tc.desc Verify triple chained fill keeps last fill value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      arr.fill(77).fill(66).fill(55);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(55);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(55);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_4500
     * @tc.name testInt16ArrayFillTestOne045
     * @tc.desc Verify fill keeps length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let originalLen: int = arr.length;
      arr.fill(50);
      let actual1: int = arr.length;
      let expected1: number = originalLen;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_4600
     * @tc.name testInt16ArrayFillTestOne046
     * @tc.desc Verify fill keeps byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let originalByteLen: int = arr.byteLength;
      arr.fill(60);
      let actual1: int = arr.byteLength;
      let expected1: number = originalByteLen;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_4700
     * @tc.name testInt16ArrayFillTestOne047
     * @tc.desc Verify fill keeps byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let arr: Int16Array = new Int16Array(buf, 2, 5);
      let originalOffset: int = arr.byteOffset;
      arr.fill(70);
      let actual1: int = arr.byteOffset;
      let expected1: number = originalOffset;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_4800
     * @tc.name testInt16ArrayFillTestOne048
     * @tc.desc Verify fill(65535) truncates to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0]);
      arr.fill(65535);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_4900
     * @tc.name testInt16ArrayFillTestOne049
     * @tc.desc Verify fill(65536) truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1]);
      arr.fill(65536);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_5000
     * @tc.name testInt16ArrayFillTestOne050
     * @tc.desc Verify fill with huge start changes no elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(99, 2147483647);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(4);
      expect(actual2).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_5100
     * @tc.name testInt16ArrayFillTestOne051
     * @tc.desc Verify fill with huge end clamps and fills all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(77, 0, 2147483647);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(77);
      let actual2: number = arr.$_get(4);
      expect(actual2).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_5200
     * @tc.name testInt16ArrayFillTestOne052
     * @tc.desc Verify fill(start,end) on empty array no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      arr.fill(50, 0, 0);
      let actual1: int = arr.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_5300
     * @tc.name testInt16ArrayFillTestOne053
     * @tc.desc Verify fill on all-zero array sets fill value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0, 0, 0]);
      arr.fill(32767);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(32767);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(32767);
      let actual3: number = arr.$_get(3);
      expect(actual3).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_5400
     * @tc.name testInt16ArrayFillTestOne054
     * @tc.desc Verify fill(0) clears all max values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([32767, 32767, 32767, 32767, 32767]);
      arr.fill(0);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(0);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_5500
     * @tc.name testInt16ArrayFillTestOne055
     * @tc.desc Verify fill(max) overwrites all min values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-32768, -32768, -32768, -32768, -32768]);
      arr.fill(32767);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(32767);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(32767);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_5600
     * @tc.name testInt16ArrayFillTestOne056
     * @tc.desc Verify fill with negative start/end range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(99, -4, -1);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(99);
      let actual3: number = arr.$_get(3);
      expect(actual3).assertEqual(99);
      let actual4: number = arr.$_get(4);
      expect(actual4).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_5700
     * @tc.name testInt16ArrayFillTestOne057
     * @tc.desc Verify fill(value,0,large) clamps end and fills all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(33, 0, 100);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(33);
      let actual2: number = arr.$_get(4);
      expect(actual2).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_5800
     * @tc.name testInt16ArrayFillTestOne058
     * @tc.desc Verify fill(value,2,3) fills only middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(99, 2, 3);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(20);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(99);
      let actual4: number = arr.$_get(3);
      expect(actual4).assertEqual(40);
      let actual5: number = arr.$_get(4);
      expect(actual5).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_5900
     * @tc.name testInt16ArrayFillTestOne059
     * @tc.desc Verify fill on single-element array keeps length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([42]);
      arr.fill(-32768);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-32768);
      let actual2: int = arr.length;
      expect(actual2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_6000
     * @tc.name testInt16ArrayFillTestOne060
     * @tc.desc Verify ArrayBuffer.isView remains true after fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      arr.fill(5);
      let isStillView: boolean = ArrayBuffer.isView(arr);
      expect(isStillView).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_6100
     * @tc.name testInt16ArrayFillTestOne061
     * @tc.desc Verify fill on ArrayBuffer view updates elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let arr: Int16Array = new Int16Array(buf, 2, 4);
      arr.fill(123);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(123);
      let actual2: number = arr.$_get(3);
      expect(actual2).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_6200
     * @tc.name testInt16ArrayFillTestOne062
     * @tc.desc Verify fill leaves outside range elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50, 60, 70]);
      arr.fill(99, 2, 5);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(20);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(99);
      let actual4: number = arr.$_get(4);
      expect(actual4).assertEqual(99);
      let actual5: number = arr.$_get(5);
      expect(actual5).assertEqual(60);
      let actual6: number = arr.$_get(6);
      expect(actual6).assertEqual(70);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_6300
     * @tc.name testInt16ArrayFillTestOne063
     * @tc.desc Verify $_set after fill updates selected index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      arr.fill(99);
      arr.$_set(2, 50);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(99);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(50);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_6400
     * @tc.name testInt16ArrayFillTestOne064
     * @tc.desc Verify fill with far negative start clamps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(5, -100);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(5);
      let actual2: number = arr.$_get(4);
      expect(actual2).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_6500
     * @tc.name testInt16ArrayFillTestOne065
     * @tc.desc Verify fill with large end from start=2 fills to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(8, 2, 999);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(20);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(8);
      let actual4: number = arr.$_get(4);
      expect(actual4).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_6600
     * @tc.name testInt16ArrayFillTestOne066
     * @tc.desc Verify fill with equal negative start/end no change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(99, -2, -2);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(3);
      expect(actual2).assertEqual(40);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_6700
     * @tc.name testInt16ArrayFillTestOne067
     * @tc.desc Verify fill after Int16Array.of construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(100);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(100);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(100);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_6800
     * @tc.name testInt16ArrayFillTestOne068
     * @tc.desc Verify fill after Int16Array.from construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      let arr: Int16Array = Int16Array.from(src);
      arr.fill(200);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(200);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(200);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_6900
     * @tc.name testInt16ArrayFillTestOne069
     * @tc.desc Verify with after fill returns new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      arr.fill(99);
      let replaced: Int16Array = arr.with(2, 50);
      let actual1: number = arr.$_get(2);
      expect(actual1).assertEqual(99);
      let actual2: number = replaced.$_get(2);
      expect(actual2).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_7000
     * @tc.name testInt16ArrayFillTestOne070
     * @tc.desc Verify fill from mid to end on 10-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
      arr.fill(-1, 3);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(2);
      let actual3: number = arr.$_get(3);
      expect(actual3).assertEqual(-1);
      let actual4: number = arr.$_get(7);
      expect(actual4).assertEqual(-1);
      let actual5: number = arr.$_get(9);
      expect(actual5).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_7100
     * @tc.name testInt16ArrayFillTestOne071
     * @tc.desc Verify forEach sees fill value for all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0, 0, 0]);
      arr.fill(123);
      let allMatch: boolean = true;
      arr.forEach((v: number): void => {
        if (v !== 123) {
          allMatch = false;
        }
      });
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_7200
     * @tc.name testInt16ArrayFillTestOne072
     * @tc.desc Verify fill fully replaces previous content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(99);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(99);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(99);
      let actual3: number = arr.$_get(3);
      expect(actual3).assertEqual(99);
      let actual4: number = arr.$_get(4);
      expect(actual4).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_7300
     * @tc.name testInt16ArrayFillTestOne073
     * @tc.desc Verify subarray fill mutates parent Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      let sub: Int16Array = arr.subarray(1, 4);
      sub.fill(99);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(99);
      let actual3: number = arr.$_get(3);
      expect(actual3).assertEqual(99);
      let actual4: number = arr.$_get(4);
      expect(actual4).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_7400
     * @tc.name testInt16ArrayFillTestOne074
     * @tc.desc Verify reverse then fill overwrites all values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      arr.fill(99).reverse().fill(0);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = arr.$_get(4);
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_ONE_7500
     * @tc.name testInt16ArrayFillTestOne075
     * @tc.desc Verify sort then fill overwrites sorted values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 3, 1, 4, 2]);
      arr.sort();
      arr.fill(88);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(88);
      let actual2: number = arr.$_get(4);
      expect(actual2).assertEqual(88);
    });
  });
}
