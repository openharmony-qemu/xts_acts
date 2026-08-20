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

export default function int16ArrayWithTestThreeTest(): void {
  describe('Int16ArrayWithTestThreeTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_0100
     * @tc.name testInt16ArrayWithTestThree001
     * @tc.desc Verify with(1, 88) sets index 1 to 88 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let result = arr.with(1, 88);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(88);
      let actual2: number = result.$_get(0);
      expect(actual2).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_0200
     * @tc.name testInt16ArrayWithTestThree002
     * @tc.desc Verify with(4, 77) sets index 4 to 77 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let result = arr.with(4, 77);
      let actual1: number = result.$_get(4);
      expect(actual1).assertEqual(77);
      let actual2: number = result.$_get(3);
      expect(actual2).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_0300
     * @tc.name testInt16ArrayWithTestThree003
     * @tc.desc Verify with(2, 55) sets index 2 to 55 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let result = arr.with(2, 55);
      let actual1: number = result.$_get(2);
      expect(actual1).assertEqual(55);
      let actual2: number = result.$_get(0);
      expect(actual2).assertEqual(10);
      let actual3: number = result.$_get(4);
      expect(actual3).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_0400
     * @tc.name testInt16ArrayWithTestThree004
     * @tc.desc Verify with(-1, 99) sets index 4 to 99 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let result = arr.with(-1, 99);
      let actual1: number = result.$_get(4);
      expect(actual1).assertEqual(99);
      let actual2: number = result.$_get(3);
      expect(actual2).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_0500
     * @tc.name testInt16ArrayWithTestThree005
     * @tc.desc Verify with(-5, 11) sets index 0 to 11 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let result = arr.with(-5, 11);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(11);
      let actual2: number = result.$_get(4);
      expect(actual2).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_0600
     * @tc.name testInt16ArrayWithTestThree006
     * @tc.desc Verify with(-2, 66) sets index 3 to 66 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let result = arr.with(-2, 66);
      let actual1: number = result.$_get(3);
      expect(actual1).assertEqual(66);
      let actual2: number = result.$_get(4);
      expect(actual2).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_0700
     * @tc.name testInt16ArrayWithTestThree007
     * @tc.desc Verify with(0, 99) sets index 0 to 99 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([42]);
      let result = arr.with(0, 99);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(99);
      let actual2: int = result.length;
      expect(actual2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_0800
     * @tc.name testInt16ArrayWithTestThree008
     * @tc.desc Verify with(-1, 77) sets index 0 to 77 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([42]);
      let result = arr.with(-1, 77);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(77);
      let actual2: int = result.length;
      expect(actual2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_0900
     * @tc.name testInt16ArrayWithTestThree009
     * @tc.desc Verify with(0, 111) sets index 0 to 111 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([100, 200]);
      let result = arr.with(0, 111);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(111);
      let actual2: number = result.$_get(1);
      expect(actual2).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_1000
     * @tc.name testInt16ArrayWithTestThree010
     * @tc.desc Verify with(1, 222) sets index 1 to 222 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([100, 200]);
      let result = arr.with(1, 222);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(222);
      let actual2: number = result.$_get(0);
      expect(actual2).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_1100
     * @tc.name testInt16ArrayWithTestThree011
     * @tc.desc Verify with(-1, 333) sets index 1 to 333 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([100, 200]);
      let result = arr.with(-1, 333);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(333);
      let actual2: number = result.$_get(0);
      expect(actual2).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_1200
     * @tc.name testInt16ArrayWithTestThree012
     * @tc.desc Verify with(-2, 444) sets index 0 to 444 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([100, 200]);
      let result = arr.with(-2, 444);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(444);
      let actual2: number = result.$_get(1);
      expect(actual2).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_1300
     * @tc.name testInt16ArrayWithTestThree013
     * @tc.desc Verify with(1, 0) sets index 1 to 0 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.with(1, 0);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_1400
     * @tc.name testInt16ArrayWithTestThree014
     * @tc.desc Verify with(1, 1) sets index 1 to 1 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.with(1, 1);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_1500
     * @tc.name testInt16ArrayWithTestThree015
     * @tc.desc Verify with(1, -1) sets index 1 to -1 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.with(1, -1);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_1600
     * @tc.name testInt16ArrayWithTestThree016
     * @tc.desc Verify with(1, 32767) sets index 1 to 32767 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.with(1, 32767);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_1700
     * @tc.name testInt16ArrayWithTestThree017
     * @tc.desc Verify with(1, -32768) sets index 1 to -32768 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.with(1, -32768);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_1800
     * @tc.name testInt16ArrayWithTestThree018
     * @tc.desc Verify with(1, 32768) sets index 1 to -32768 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.with(1, 32768);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_1900
     * @tc.name testInt16ArrayWithTestThree019
     * @tc.desc Verify with(1, -32769) sets index 1 to 32767 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.with(1, -32769);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_2000
     * @tc.name testInt16ArrayWithTestThree020
     * @tc.desc Verify with(1, 65535) sets index 1 to -1 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.with(1, 65535);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_2100
     * @tc.name testInt16ArrayWithTestThree021
     * @tc.desc Verify with(1, 3.7) sets index 1 to 3 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.with(1, 3.7);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_2200
     * @tc.name testInt16ArrayWithTestThree022
     * @tc.desc Verify with(1, -3.7) sets index 1 to -3 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.with(1, -3.7);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_2300
     * @tc.name testInt16ArrayWithTestThree023
     * @tc.desc Verify with(1, 32767.9) sets index 1 to 32767 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.with(1, 32767.9);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_2400
     * @tc.name testInt16ArrayWithTestThree024
     * @tc.desc Verify with(1, -32768.9) sets index 1 to -32768 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.with(1, -32768.9);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_2500
     * @tc.name testInt16ArrayWithTestThree025
     * @tc.desc Verify with(1, 0.5) sets index 1 to 0 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.with(1, 0.5);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_2600
     * @tc.name testInt16ArrayWithTestThree026
     * @tc.desc Verify with(1, -0.5) sets index 1 to 0 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.with(1, -0.5);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_2700
     * @tc.name testInt16ArrayWithTestThree027
     * @tc.desc Verify with(1, NaN) stores 0 after ToInt16 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.with(1, Double.NaN);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_2800
     * @tc.name testInt16ArrayWithTestThree028
     * @tc.desc Verify with(1, Infinity) stores 0 after ToInt16 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.with(1, Double.POSITIVE_INFINITY);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_2900
     * @tc.name testInt16ArrayWithTestThree029
     * @tc.desc Verify with(1, -Infinity) stores 0 after ToInt16 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.with(1, -Double.POSITIVE_INFINITY);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_3000
     * @tc.name testInt16ArrayWithTestThree030
     * @tc.desc Verify with(1, 32767.0) sets index 1 to 32767 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.with(1, 32767.0);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_3100
     * @tc.name testInt16ArrayWithTestThree031
     * @tc.desc Verify with(1, -32768.0) sets index 1 to -32768 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.with(1, -32768.0);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_3200
     * @tc.name testInt16ArrayWithTestThree032
     * @tc.desc Verify with(1, 65536) sets index 1 to 0 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.with(1, 65536);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_3300
     * @tc.name testInt16ArrayWithTestThree033
     * @tc.desc Verify with(1, 32767.1) sets index 1 to 32767 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.with(1, 32767.1);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_3400
     * @tc.name testInt16ArrayWithTestThree034
     * @tc.desc Verify with(1, -32768.1) sets index 1 to -32768 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.with(1, -32768.1);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_3500
     * @tc.name testInt16ArrayWithTestThree035
     * @tc.desc Verify with(2, 99) length and element at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let result = arr.with(2, 99);
      let actual1: int = result.length;
      expect(actual1).assertEqual(5);
      let actual2: number = result.$_get(2);
      expect(actual2).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_3600
     * @tc.name testInt16ArrayWithTestThree036
     * @tc.desc Verify with(2, 99) returns Int16Array with same length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let result = arr.with(2, 99);
      let actual1: int = result.length;
      expect(actual1).assertEqual(5);
      let actual2: int = result.length;
      let expected2: number = arr.length;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_3700
     * @tc.name testInt16ArrayWithTestThree037
     * @tc.desc Verify with(2, 99) does not change original length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let oldLen = arr.length;
      let result = arr.with(2, 99);
      let actual1: int = arr.length;
      let expected1: number = oldLen;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_3800
     * @tc.name testInt16ArrayWithTestThree038
     * @tc.desc Verify with(2, 99) Int16Array replacement behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let result = arr.with(2, 99);
      let actual1: number = arr.$_get(2);
      expect(actual1).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_3900
     * @tc.name testInt16ArrayWithTestThree039
     * @tc.desc Verify with(2, 99) returns new ArrayBuffer not shared with original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let result = arr.with(2, 99);
      let actual1: boolean = result.buffer !== arr.buffer;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_4000
     * @tc.name testInt16ArrayWithTestThree040
     * @tc.desc Verify with(1, 20) always returns new Int16Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.with(1, 20);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(20);
      let actual2: boolean = result !== arr;
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_4100
     * @tc.name testInt16ArrayWithTestThree041
     * @tc.desc Verify chained with returns independent arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let r1 = arr.with(0, 11);
      let r2 = r1.with(1, 22);
      let actual1: number = r2.$_get(0);
      expect(actual1).assertEqual(11);
      let actual2: number = r2.$_get(1);
      expect(actual2).assertEqual(22);
      let actual3: number = r1.$_get(0);
      expect(actual3).assertEqual(11);
      let actual4: number = r1.$_get(1);
      expect(actual4).assertEqual(20);
      let actual5: number = arr.$_get(0);
      expect(actual5).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_4200
     * @tc.name testInt16ArrayWithTestThree042
     * @tc.desc Verify two with calls produce independent Int16Array copies
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let r1 = arr.with(0, 111);
      let r2 = arr.with(0, 222);
      let actual1: number = r1.$_get(0);
      expect(actual1).assertEqual(111);
      let actual2: number = r2.$_get(0);
      expect(actual2).assertEqual(222);
      let actual3: number = r1.$_get(1);
      expect(actual3).assertEqual(20);
      let actual4: number = r2.$_get(1);
      expect(actual4).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_4300
     * @tc.name testInt16ArrayWithTestThree043
     * @tc.desc Verify with(1, 99) result can construct new Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.with(1, 99);
      let copy = new Int16Array(result);
      let actual1: number = copy.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = copy.$_get(1);
      expect(actual2).assertEqual(99);
      let actual3: number = copy.$_get(2);
      expect(actual3).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_4400
     * @tc.name testInt16ArrayWithTestThree044
     * @tc.desc Verify with(1, 99) result can be copied via Int16Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.with(1, 99);
      let copy = Int16Array.from(result);
      let actual1: number = copy.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = copy.$_get(1);
      expect(actual2).assertEqual(99);
      let actual3: number = copy.$_get(2);
      expect(actual3).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_4500
     * @tc.name testInt16ArrayWithTestThree045
     * @tc.desc Verify with(2, 99) join content matches replaced array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let result = arr.with(2, 99);
      let actual1: string = result.join(',');
      expect(actual1).assertEqual('10,20,99,40,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_4600
     * @tc.name testInt16ArrayWithTestThree046
     * @tc.desc Verify with(10000, 99) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      try {
        arr.with(10000, 99);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_4700
     * @tc.name testInt16ArrayWithTestThree047
     * @tc.desc Verify with(-10000, 99) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      try {
        arr.with(-10000, 99);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_4800
     * @tc.name testInt16ArrayWithTestThree048
     * @tc.desc Verify with(2, 99) on two-element Int16Array throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([100, 200]);
      try {
        arr.with(2, 99);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_4900
     * @tc.name testInt16ArrayWithTestThree049
     * @tc.desc Verify with(-3, 99) on two-element Int16Array throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([100, 200]);
      try {
        arr.with(-3, 99);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_5000
     * @tc.name testInt16ArrayWithTestThree050
     * @tc.desc Verify with(0, 32767) sets index 0 to 32767 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let result = arr.with(0, 32767);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(32767);
      let actual2: number = arr.$_get(0);
      expect(actual2).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_5100
     * @tc.name testInt16ArrayWithTestThree051
     * @tc.desc Verify with(0, -32768) sets index 0 to -32768 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let result = arr.with(0, -32768);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(-32768);
      let actual2: number = arr.$_get(0);
      expect(actual2).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_5200
     * @tc.name testInt16ArrayWithTestThree052
     * @tc.desc Verify with(-1, NaN) stores 0 after ToInt16 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let result = arr.with(-1, Double.NaN);
      let actual1: number = result.$_get(4);
      expect(actual1).assertEqual(0);
      let actual2: number = arr.$_get(4);
      expect(actual2).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_5300
     * @tc.name testInt16ArrayWithTestThree053
     * @tc.desc Verify with(-1, Infinity) stores 0 after ToInt16 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let result = arr.with(-1, Double.POSITIVE_INFINITY);
      let actual1: number = result.$_get(4);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_5400
     * @tc.name testInt16ArrayWithTestThree054
     * @tc.desc Verify with(4, 32768) sets index 4 to -32768 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let result = arr.with(4, 32768);
      let actual1: number = result.$_get(4);
      expect(actual1).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_5500
     * @tc.name testInt16ArrayWithTestThree055
     * @tc.desc Verify with(4, -32769) sets index 4 to 32767 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let result = arr.with(4, -32769);
      let actual1: number = result.$_get(4);
      expect(actual1).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_5600
     * @tc.name testInt16ArrayWithTestThree056
     * @tc.desc Verify with(1, 32767) sets index 0 to 100 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([100, 200, 300]);
      let result = arr.with(1, 32767);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(100);
      let actual2: number = result.$_get(1);
      expect(actual2).assertEqual(32767);
      let actual3: number = result.$_get(2);
      expect(actual3).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_5700
     * @tc.name testInt16ArrayWithTestThree057
     * @tc.desc Verify with(1, 0) sets index 0 to 32767 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([32767, 32767, 32767]);
      let result = arr.with(1, 0);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(32767);
      let actual2: number = result.$_get(1);
      expect(actual2).assertEqual(0);
      let actual3: number = result.$_get(2);
      expect(actual3).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_5800
     * @tc.name testInt16ArrayWithTestThree058
     * @tc.desc Verify with(1, 0) sets index 0 to -32768 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([-32768, -32768, -32768]);
      let result = arr.with(1, 0);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(-32768);
      let actual2: number = result.$_get(1);
      expect(actual2).assertEqual(0);
      let actual3: number = result.$_get(2);
      expect(actual3).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_5900
     * @tc.name testInt16ArrayWithTestThree059
     * @tc.desc Verify with(2, 0) sets index 0 to 32767 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([32767, -32768, 100, -200]);
      let result = arr.with(2, 0);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(32767);
      let actual2: number = result.$_get(1);
      expect(actual2).assertEqual(-32768);
      let actual3: number = result.$_get(2);
      expect(actual3).assertEqual(0);
      let actual4: number = result.$_get(3);
      expect(actual4).assertEqual(-200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_6000
     * @tc.name testInt16ArrayWithTestThree060
     * @tc.desc Verify with(2, 888) returns Int16Array with same length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let result = arr.with(2, 888);
      let actual1: int = result.length;
      expect(actual1).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_6100
     * @tc.name testInt16ArrayWithTestThree061
     * @tc.desc Verify with positive and negative index equivalence for replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let rPos = arr.with(0, 99);
      let rNeg = arr.with(-5, 99);
      let actual1: number = rPos.$_get(0);
      let expected1: number = rNeg.$_get(0);
      expect(actual1).assertEqual(expected1);
      let actual2: number = rPos.$_get(0);
      expect(actual2).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_6200
     * @tc.name testInt16ArrayWithTestThree062
     * @tc.desc Verify with positive and negative index equivalence for replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let rPos = arr.with(4, 77);
      let rNeg = arr.with(-1, 77);
      let actual1: number = rPos.$_get(4);
      let expected1: number = rNeg.$_get(4);
      expect(actual1).assertEqual(expected1);
      let actual2: number = rPos.$_get(4);
      expect(actual2).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_6300
     * @tc.name testInt16ArrayWithTestThree063
     * @tc.desc Verify with positive and negative index equivalence for replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let rPos = arr.with(1, 55);
      let rNeg = arr.with(-4, 55);
      let actual1: number = rPos.$_get(1);
      let expected1: number = rNeg.$_get(1);
      expect(actual1).assertEqual(expected1);
      let actual2: number = rPos.$_get(1);
      expect(actual2).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_6400
     * @tc.name testInt16ArrayWithTestThree064
     * @tc.desc Verify with(0, 99) on Int16Array.of constructed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30, 40, 50);
      let result = arr.with(0, 99);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(99);
      let actual2: number = arr.$_get(0);
      expect(actual2).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_6500
     * @tc.name testInt16ArrayWithTestThree065
     * @tc.desc Verify with(0, 88) result can be copied via Int16Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.from([10, 20, 30, 40, 50]);
      let result = arr.with(0, 88);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(88);
      let actual2: number = arr.$_get(0);
      expect(actual2).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_6600
     * @tc.name testInt16ArrayWithTestThree066
     * @tc.desc Verify with(0, 99) on ArrayBuffer-backed Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(10);
      let arr = new Int16Array(buf, 0, 5);
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      let result = arr.with(0, 99);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(99);
      let actual2: number = arr.$_get(0);
      expect(actual2).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_6700
     * @tc.name testInt16ArrayWithTestThree067
     * @tc.desc Verify with(1, -999) sets index 0 to -100 without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([-100, -200, -300]);
      let result = arr.with(1, -999);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(-100);
      let actual2: number = result.$_get(1);
      expect(actual2).assertEqual(-999);
      let actual3: number = result.$_get(2);
      expect(actual3).assertEqual(-300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_6800
     * @tc.name testInt16ArrayWithTestThree068
     * @tc.desc Verify chained with same index ends with final value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let r1 = arr.with(1, 111);
      let r2 = r1.with(1, 222);
      let r3 = r2.with(1, 333);
      let actual1: number = r3.$_get(1);
      expect(actual1).assertEqual(333);
      let actual2: number = r2.$_get(1);
      expect(actual2).assertEqual(222);
      let actual3: number = r1.$_get(1);
      expect(actual3).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_6900
     * @tc.name testInt16ArrayWithTestThree069
     * @tc.desc Verify with(1, 99) entries iteration reflects replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.with(1, 99);
      let it = result.entries();
      let e0 = it.next();
      let e1 = it.next();
      let e2 = it.next();
      let actual1: number = e0.value![0];
      expect(actual1).assertEqual(0);
      let actual2: number = e0.value![1];
      expect(actual2).assertEqual(10);
      let actual3: number = e1.value![0];
      expect(actual3).assertEqual(1);
      let actual4: number = e1.value![1];
      expect(actual4).assertEqual(99);
      let actual5: number = e2.value![0];
      expect(actual5).assertEqual(2);
      let actual6: number = e2.value![1];
      expect(actual6).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_7000
     * @tc.name testInt16ArrayWithTestThree070
     * @tc.desc Verify with(0, 77) values iteration reflects replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.with(0, 77);
      let it = result.values();
      let actual1 = it.next().value!;
      expect(actual1).assertEqual(77);
      let actual2 = it.next().value!;
      expect(actual2).assertEqual(20);
      let actual3 = it.next().value!;
      expect(actual3).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_7100
     * @tc.name testInt16ArrayWithTestThree071
     * @tc.desc Verify with(2, 99) then fill overwrites replaced element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let result = arr.with(2, 99);
      let filled = result.fill(0);
      let actual1: number = filled.$_get(2);
      expect(actual1).assertEqual(0);
      let actual2: boolean = filled === result;
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_7200
     * @tc.name testInt16ArrayWithTestThree072
     * @tc.desc Verify with(0, 99) then reverse moves replaced element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let result = arr.with(0, 99);
      let reversed = result.reverse();
      let actual1: number = reversed.$_get(4);
      expect(actual1).assertEqual(99);
      let actual2: number = reversed.$_get(0);
      expect(actual2).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_7300
     * @tc.name testInt16ArrayWithTestThree073
     * @tc.desc Verify with(2, 150) then sort includes replaced value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([100, 20, 300, 40, 500]);
      let result = arr.with(2, 150);
      let sorted = result.sort();
      let actual1: number = sorted.$_get(0);
      expect(actual1).assertEqual(20);
      let actual2: number = sorted.$_get(2);
      expect(actual2).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_THREE_7400
     * @tc.name testInt16ArrayWithTestThree074
     * @tc.desc Verify with(2, 99) then slice is independent of result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestThree074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let result = arr.with(2, 99);
      let sliced = result.slice(0, 3);
      let actual1: number = sliced.$_get(2);
      expect(actual1).assertEqual(99);
      sliced.$_set(0, 999);
      let actual2: number = result.$_get(0);
      expect(actual2).assertEqual(10);
    });
  });
}
